class V1::BeersController < ApplicationController
  before_action :set_v1_beer, only: [:show, :update, :destroy]

  # GET /v1/beers
  def index
    @v1_beers = V1::Beer.all

    render json: @v1_beers
  end

  # GET /v1/beers/1
  def show
    render json: @v1_beer
  end

  # POST /v1/beers
  def create
    @v1_beer = V1::Beer.new(v1_beer_params)

    if @v1_beer.save
      render json: @v1_beer, status: :created, location: @v1_beer
    else
      render json: @v1_beer.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /v1/beers/1
  def update
    if @v1_beer.update(v1_beer_params)
      render json: @v1_beer
    else
      render json: @v1_beer.errors, status: :unprocessable_entity
    end
  end

  # DELETE /v1/beers/1
  def destroy
    @v1_beer.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_v1_beer
      @v1_beer = V1::Beer.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def v1_beer_params
      params.require(:v1_beer).permit(:name, :brand, :price, :store)
    end
end
