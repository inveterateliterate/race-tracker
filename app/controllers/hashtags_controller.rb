class HashtagsController < ApplicationController
  before_action :set_hashtag, only: [:update, :destroy]

  def index
    json_with hashtags = Hashtag.all
  end

  def create
    hashtag = Hashtag.new(hashtag_params)
    hashtag.save
    json_with hashtag
  end

  def update
    @hashtag.update_attributes(hashtag_params)
    json_with @hashtag
  end

  def destroy
    @hashtag.destroy
    json_with @hashtag
  end

  private

  def set_hashtag
    @hashtag = Hashtag.find(params[:id])
  end

  def hashtag_params
    @hashtag_params ||= HashtagDecanter.decant(params[:hashtag])
  end
end
