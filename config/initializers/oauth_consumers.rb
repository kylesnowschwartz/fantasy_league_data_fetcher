OAUTH_CREDENTIALS={
  :yahoo => {
    :key => "dj0yJmk9TkNyd2pBakVPU3Z6JmQ9WVdrOVdFNU5ZV0pXTkhFbWNHbzlNQS0tJnM9Y29uc3VtZXJzZWNyZXQmeD0xNQ--",
    :secret => "e9a4bf467ff0725c2150a3e85f76f990c7a05cc3"
  }
}

# edit this file to contain credentials for the OAuth services you support.
# each entry needs a corresponding token model.
#
# eg. :twitter => TwitterToken, :hour_feed => HourFeedToken etc.
#
# OAUTH_CREDENTIALS={
#   :twitter=>{
#     :key=>"",
#     :secret=>"",
#     :client=>:twitter_gem, # :twitter_gem or :oauth_gem (defaults to :twitter_gem)
#     :expose => false, # expose client at /oauth_consumers/twitter/client see docs
#     :allow_login => true # Use :allow_login => true to allow user to login to account
#   }
#

load 'oauth/models/consumers/service_loader.rb'