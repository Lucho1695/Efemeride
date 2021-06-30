require "test_helper"

class EfemeridesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @efemeride = efemerides(:one)
  end

  test "should get index" do
    get efemerides_url
    assert_response :success
  end

  test "should get new" do
    get new_efemeride_url
    assert_response :success
  end

  test "should create efemeride" do
    assert_difference('Efemeride.count') do
      post efemerides_url, params: { efemeride: { date: @efemeride.date, ong_text,: @efemeride.ong_text,, text: @efemeride.text } }
    end

    assert_redirected_to efemeride_url(Efemeride.last)
  end

  test "should show efemeride" do
    get efemeride_url(@efemeride)
    assert_response :success
  end

  test "should get edit" do
    get edit_efemeride_url(@efemeride)
    assert_response :success
  end

  test "should update efemeride" do
    patch efemeride_url(@efemeride), params: { efemeride: { date: @efemeride.date, ong_text,: @efemeride.ong_text,, text: @efemeride.text } }
    assert_redirected_to efemeride_url(@efemeride)
  end

  test "should destroy efemeride" do
    assert_difference('Efemeride.count', -1) do
      delete efemeride_url(@efemeride)
    end

    assert_redirected_to efemerides_url
  end
end
