class OauthClient < ActiveRecord::Base
  CLIENT_ID = 'dj0yJmk9TkNyd2pBakVPU3Z6JmQ9WVdrOVdFNU5ZV0pXTkhFbWNHbzlNQS0tJnM9Y29uc3VtZXJzZWNyZXQmeD0xNQ'
  CLIENT_SECRET = 'e9a4bf467ff0725c2150a3e85f76f990c7a05cc3'
  SITE = 'https://api.login.yahoo.com/oauth2/request_auth'
  RESPONSE_TYPE = 'json'
  REDIRECT_URI = 'http://localhost:3000'

  client = OAuth2::Client.new(CLIENT_ID, CLIENT_SECRET, :site => SITE)
 #https://api.login.yahoo.com/oauth2/request_auth?client_id=dj0yJmk9ak5IZ2x5WmNsaHp6JmQ9WVdrOVNqQkJUMnRYTjJrbWNHbzlNQS0tJnM9Y29uc3VtZXJzZWNyZXQmeD1hYQ--&redirect_uri=oob&response_type=code&language=en-us

  client.auth_code.authorize_url(:redirect_uri => REDIRECT_URI)
  # => "https://example.org/oauth/authorization?response_type=code&client_id=client_id&redirect_uri=http://localhost:8080/oauth2/callback"
  token = client.auth_code.get_token('authorization_code_value', :redirect_uri => REDIRECT_URI, :headers => {'Authorization' => 'Basic some_password'})
  response = token.get('/api/resource', :params => { 'query_foo' => 'bar' })
  response.class.name
  # => OAuth2::Response
end


# require 'oauth2'

# OAuth2::Client.new(
#   Rails.application.secrets.yahoo_consumer_id, 
#   Rails.application.secrets.yahoo_consumer_secret, 
#   site: 'https://api.login.yahoo.com', 
#   authorize_url: '/oauth2/request_auth', 
#   token_url: '/oauth2/get_token'
# )

# client.auth_code.authorize_url(redirect_uri: redirect_uri, headers: { "Authorization" => basic_authorization })
# token = client.auth_code.get_token(code, redirect_uri: redirect_uri)

# # Later
# token.refresh!