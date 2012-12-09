require "#{Rails.root}/lib/social_media/tweet"
class WelcomeController < ApplicationController
  def index
    SocialMedia::Tweet.user_tweet 
  end
end

