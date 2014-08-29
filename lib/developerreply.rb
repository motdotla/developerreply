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
    hostname  = options[:hostname]
    url       = options[:url]
    payload   = { 
      hostname: hostname, 
      url: url,
      api_user: Developerreply.username, 
      api_key: Developerreply.password
    }

    resp = Developerreply.request.post do |req|
      req.path    = "/api/parse.set.json"
      req.body    = payload
    end

    if resp.body["error"]
      error_message = resp.body["error"]["message"] 
      raise "Unable to create hostname and url: #{error_message}"
    else
      return true
    end
  end

  private

  def setup_request! 
    options = { 
      #:headers  =>  {'Accept' => "application/json"},
      :url      =>  "https://api.sendgrid.com",
      :ssl      =>  {:verify => false} 
    } 
 
    Developerreply.request = ::Faraday::Connection.new(options) do |builder| 
      builder.use     ::Faraday::Request::UrlEncoded
      builder.use     ::FaradayMiddleware::ParseJson
      builder.use     ::FaradayMiddleware::FollowRedirects
      builder.adapter ::Faraday.default_adapter 
    end
  end
end

