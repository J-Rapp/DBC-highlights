class TweetsController < ApplicationController
  def recent
    tweets = Tweet.includes(:hashtags).ordered_json
    render json: tweets
  end

  def search
    hashtag = Hashtag.where(name: params[:keyword]).first
    if hashtag
      render json: hashtag.tweets.ordered_json
    else
      render :nothing => true, status: 404
    end
  end

  def create
    tweet = Tweet.new(tweet_params)
    defaultify(tweet, :content) { Faker::Lorem.sentence }
    defaultify(tweet, :username) { Faker::Name.name }
    defaultify(tweet, :handle) { "@" + Faker::Internet.user_name }
    defaultify(tweet, :avatar_url) { Faker::Avatar.image(tweet.username) }
    tweet.save

    hashtags_names = params[:hashtags] || []
    hashtags_names.each do |name|
      hashtag = Hashtag.where(name: name).first_or_create
      tweet.hashtags << hashtag
    end

    render json: tweet.to_json(methods: :hashtag_names)
  end

  private

  def defaultify(tweet, property)
    tweet[property] = yield if tweet[property].empty?
  end

  def tweet_params
    params.require(:tweet).permit( :content, :username, :handle, :avatar_url )
  end
end
