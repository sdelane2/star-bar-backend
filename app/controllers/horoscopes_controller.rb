class HoroscopesController < ApplicationController
  before_action :set_horoscope, only: [:show, :update, :destroy]

  # GET /horoscopes
  def index
    @horoscopes = Horoscope.all

    render json: @horoscopes
  end

  # GET /horoscopes/1
  def show
    render json: @horoscope
  end

  # POST /horoscopes
  def create
    @horoscope = Horoscope.new(horoscope_params)
    if @horoscope.save
      render json: @horoscope, status: :created, location: @horoscope
    else
      render json: @horoscope.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /horoscopes/1
  def update
    if @horoscope.update(horoscope_params)
      render json: @horoscope
    else
      render json: @horoscope.errors, status: :unprocessable_entity
    end
  end

  # DELETE /horoscopes/1
  def destroy
    @horoscope.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_horoscope
      @horoscope = Horoscope.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def horoscope_params
      params.require(:horoscope).permit(:lucky_number, :lucky_color, :mood, :compatibility, :current_date, :description)
    end
end
