require "test_helper"

class FavoritesControllerTestCase < ActionDispatch::IntegrationTest
  setup do
    login
    @megadrive = products(:megadrive)
    @switch = products(:switch)
  end

  test 'should create favorite' do
    assert_difference('Favorite.count', 1) do
      post favorites_url(product_id: @megadrive.id)
    end

    assert_redirected_to product_path(@megadrive)
  end

  test 'should unfavorite' do
    assert_difference('Favorite.count', -1) do
      delete favorite_url(product_id: @switch.id)
    end

    assert_redirected_to product_path(@switch)
  end
end
