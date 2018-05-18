class TweetsController < ApplicationController
  def index
    @race = Race.find_by(id: params[:race_id])
    @tweets = @race.tweets
  end
end
