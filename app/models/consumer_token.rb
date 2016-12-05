require 'oauth/models/consumers/token'
class ConsumerToken < ActiveRecord::Base
  include Oauth::Models::Consumers::Token

  # self.table_name = "yahoo_tokens"

  # You can safely remove this callback if you don't allow login from any of your services
  # before_create :create_user

  # Modify this with class_name etc to match your application
  # belongs_to :user

  def user
    'nope'
  end

end