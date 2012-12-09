require 'tweetstream'
require 'ruby-growl'
require 'eventmachine'
require 'net/http'
module SocialMedia
  class Tweet
    
    def initialize 
      @client = nil
    end

    def self.feed
      
    end

    def self.user_tweet
      
            
      TweetStream.configure do |config|
        config.consumer_key       = '87rSkJ7tzINtNOefJ6FfGQ'
        config.consumer_secret    = 'TfXgJgKUo35olGwHNAY36HcMx2HhlNUHMSiNCXXjo'
        config.oauth_token        = '409143873-nx3Vm9P8bb7ONTJ6Cyz4syHLpzQmn4LdNQMtTtYB'
        config.oauth_token_secret = 'WtEzHP56fE7wBwdScq9vrDsWt1bHqIuizDXthfYoA'
        config.auth_method        = :oauth
      end
      
      @client = TweetStream::Client.new

      @client.on_error do |message|
        puts message
      end

      @client.on_direct_message do |direct_message|
        puts direct_message.text
      end

      @client.on_timeline_status  do |status|
        puts status.text
       
        message = {channel: "/usertweets", data: {status: status.text}}
        uri = URI.parse("http://localhost:9292/faye")
        Net::HTTP.post_form(uri, :message => message.to_json)
      end

      @client.userstream
      
    end
  end
end 
