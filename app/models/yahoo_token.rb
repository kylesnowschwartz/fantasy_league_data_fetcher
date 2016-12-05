class YahooToken < ConsumerToken
  YAHOO_SETTINGS={
    :site=>"http://fantasysports.yahooapis.com/fantasy/v2",
    :authorize_url =>"https://api.login.yahoo.com/oauth/v2/request_auth",
    :request_token_url => "https://api.login.yahoo.com/oauth/v2/get_request_token",
    :access_token_url => "https://api.login.yahoo.com/oauth/v2/get_token",
    :oauth_version=>"1.0"
  }   

  def self.consumer
    @consumer||=OAuth::Consumer.new credentials[:key],credentials[:secret],YAHOO_SETTINGS
  end

  # refresh expired token
  def refresh!
    old_one = self
    request_token = OAuth::RequestToken.new(YahooToken.consumer, self.token, self.secret)

    options={}
    options[:oauth_session_handle]=self.session_handle

    access_token = request_token.get_access_token options
    new_one = YahooToken.find_or_create_from_access_token(access_token)
    new_one.session_handle=access_token.params[:oauth_session_handle]
    new_one.save!

    if new_one
      old_one.delete
      return new_one
    end

    return nil
  end

  def myapi
    # api_url = ....  Yahoo api url
    request_token = OAuth::RequestToken.new(YahooToken.consumer, self.token, self.secret)

    options={}
    options[:oauth_session_handle]=self.session_handle

    access_token = request_token.get_access_token options
    response=access_token.get(api_url, { 'Accept'=>'application/json' })
    return MultiJson.decode(response.body)
  end
end 
