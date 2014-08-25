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

  private

  def setup_request! 
    options = { 
      :headers  =>  {'Accept' => "application/json"}, 
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

