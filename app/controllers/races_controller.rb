class RacesController < ApplicationController
  before_action :set_user, only: [:index, :new, :edit, :destroy]
  before_action :set_race, only: [:show, :edit, :update, :destroy]

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
  end

  def edit
    build_hash_tags
  end

  def update
    if @race.update(race_params)
      redirect_to user_races_path(user_id: @race.user_id), notice: 'Race was successfully updated'
    else
      render :edit
    end
  end

  def destroy
    @race.destroy
    redirect_to user_races_path(user_id: @user), notice: 'Race was successfully deleted'
  end

  private

  def race_params
    @race_params = RaceDecanter.decant(params[:race])
  end

  def set_user
    @user = User.find_by(id: params[:user_id])
  end

  def set_race
    @race = Race.find(params[:id])
  end

  def build_hash_tags
    num_hash_tags = @race.hash_tags.count
    (4 - num_hash_tags).times { @race.hash_tags.build }
  end
end
