require 'test_helper'

class GifsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @gif = gifs(:one)
  end

  test "should get index" do
    get gifs_url, as: :json
    assert_response :success
  end

  test "should create gif" do
    assert_difference('Gif.count') do
      post gifs_url, params: { gif: { category: @gif.category, description: @gif.description, gif_url: @gif.gif_url, name: @gif.name } }, as: :json
    end

    assert_response 201
  end

  test "should show gif" do
    get gif_url(@gif), as: :json
    assert_response :success
  end

  test "should update gif" do
    patch gif_url(@gif), params: { gif: { category: @gif.category, description: @gif.description, gif_url: @gif.gif_url, name: @gif.name } }, as: :json
    assert_response 200
  end

  test "should destroy gif" do
    assert_difference('Gif.count', -1) do
      delete gif_url(@gif), as: :json
    end

    assert_response 204
  end
end
