require 'test_helper'

class V1::BeersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @v1_beer = v1_beers(:one)
  end

  test "should get index" do
    get v1_beers_url, as: :json
    assert_response :success
  end

  test "should create v1_beer" do
    assert_difference('V1::Beer.count') do
      post v1_beers_url, params: { v1_beer: { brand: @v1_beer.brand, name: @v1_beer.name, price: @v1_beer.price, store: @v1_beer.store } }, as: :json
    end

    assert_response 201
  end

  test "should show v1_beer" do
    get v1_beer_url(@v1_beer), as: :json
    assert_response :success
  end

  test "should update v1_beer" do
    patch v1_beer_url(@v1_beer), params: { v1_beer: { brand: @v1_beer.brand, name: @v1_beer.name, price: @v1_beer.price, store: @v1_beer.store } }, as: :json
    assert_response 200
  end

  test "should destroy v1_beer" do
    assert_difference('V1::Beer.count', -1) do
      delete v1_beer_url(@v1_beer), as: :json
    end

    assert_response 204
  end
end
