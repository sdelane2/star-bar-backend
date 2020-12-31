class FavoriteHoroscopesController < ApplicationController
  before_action :set_favorite_horoscope, only: [:show, :update, :destroy]

  # GET /favorite_horoscopes
  def index
    @favorite_horoscopes = FavoriteHoroscope.all

    render json: @favorite_horoscopes
  end

  # GET /favorite_horoscopes/1
  def show
    render json: @favorite_horoscope
  end

  # POST /favorite_horoscopes
  def create
    @favorite_horoscope = FavoriteHoroscope.new(favorite_horoscope_params)

    if @favorite_horoscope.save
      render json: @favorite_horoscope, status: :created, location: @favorite_horoscope
    else
      render json: @favorite_horoscope.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /favorite_horoscopes/1
  def update
    if @favorite_horoscope.update(favorite_horoscope_params)
      render json: @favorite_horoscope
    else
      render json: @favorite_horoscope.errors, status: :unprocessable_entity
    end
  end

  # DELETE /favorite_horoscopes/1
  def destroy
    @favorite_horoscope.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_favorite_horoscope
      @favorite_horoscope = FavoriteHoroscope.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def favorite_horoscope_params
      # byebug
      params.require(:favorite_horoscope).permit(:user_id, :horoscope_id,)
    end
end
