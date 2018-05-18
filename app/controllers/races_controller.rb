class RacesController < ApplicationController
  before_action :set_user, only: [:index, :new, :edit]

  def index
    @races = @user.races
  end

  def new
    @race = Race.new
    build_hash_tags
  end

  def create
    @race = Race.new(race_params)
    if @race.save
      redirect_to user_races_path(user_id: @race.user_id), notice: 'Race was successfully created'
    else
      render :new
    end
  end

  def show
    @race = Race.find(params[:id])
  end

  def edit
    @race = Race.find(params[:id])
    build_hash_tags
  end

  def update
    @race = Race.find(params[:id])
    if @race.update(race_params)
      redirect_to user_races_path(user_id: @race.user_id), notice: 'Race was successfully updated'
    else
      render :edit
    end
  end

  private

  def race_params
    @race_params = RaceDecanter.decant(params[:race])
  end

  def set_user
    @user = User.find_by(id: params[:user_id])
  end

  def build_hash_tags
    @race.hash_tags.build if @race.hash_tags.empty?
  end
end
