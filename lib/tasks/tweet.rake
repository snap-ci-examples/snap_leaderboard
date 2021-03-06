require 'uri'
namespace :tweet do
  task :update => [:environment] do
    client = Twitter::REST::Client.new do |config|
      config.consumer_key    = ENV['TWITTER_CONSUMER_KEY']
      config.consumer_secret = ENV['TWITTER_CONSUMER_SECRET']
      config.access_token    = ENV['TWITTER_ACCESS_TOKEN']
      config.access_token_secret = ENV['TWITTER_ACCESS_TOKEN_SECRET']
    end
    reply_to_id = URI(ENV['TWITTER_LINK']).path.split('/').last.to_i
    client.update("@" + ENV['TWITTER_USER'] + " Your pipeline was triggered. Check out the pipeline at https://snap-ci.com/snap-ci-examples/snap_leaderboard/branch/publish", in_reply_to_status_id: reply_to_id)
  end
end
