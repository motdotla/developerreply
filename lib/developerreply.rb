require "faraday"
require "faraday_middleware"
require "developerreply/version"

module Developerreply
  extend self

  def username=(username)    
    @username = username     
    setup_request!
      
    @username
  end 
      
  def username
    return @username if @username 
    "username_required"       
  end

  def password=(password)    
    @password = password     
    setup_request!
      
    @password
  end 
      
  def password
    return @password if @password 
    "password_required"       
  end

  def request=(request)
    @request = request
  end

  def request
    @request
  end

  def create(options={})
    cookie  = attempt_login_and_return_cookie

    hostname  = options[:hostname]
    url       = options[:url]
    payload   = "reply_option[hostname]=#{hostname}&reply_option[url]=#{url}"

    resp = Developerreply.request.post do |req|
      req.path    = "/developer/reply"
      req.body    = payload
      req.headers["Cookie"] = cookie
    end

    if resp.status == 302 # for SendGrid's response here, a 302 is a successful create... yea, I know.
      return true
    else
      raise "Unable to create hostname and url at /developer/reply"
    end
  end

  private

  def login_payload
    "login[username]=#{Developerreply.username}&login[password]=#{Developerreply.password}"
  end

  def attempt_login_and_return_cookie
    cookie = ""

    resp = Developerreply.request.post '/login',  login_payload

    if resp.status == 302 # for SendGrid's auth, a 302 is a successful login where a 200 is not successful... yeah, I know.
      set_cookie_header = resp.headers["set-cookie"]
      cookie = set_cookie_header.split(";")[0]
    end

    raise "Authentication failed" if cookie == ""

    cookie
  end

  def setup_request! 
    options = { 
      :url      =>  "https://sendgrid.com",
      :ssl      =>  {:verify => false} 
    } 
 
    Developerreply.request = ::Faraday::Connection.new(options) do |builder| 
      builder.adapter ::Faraday.default_adapter 
    end
  end
end

