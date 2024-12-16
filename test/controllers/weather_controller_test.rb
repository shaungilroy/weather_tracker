require "test_helper"

class WeatherControllerTest < ActionDispatch::IntegrationTest

  test "view should return default zip if none passed" do
    get root_url
    assert_response :success
    assert_select 'span[id=extracted_postal_code]', "97401"
  end

  test "view should contain search address after search" do
    test_address = Faker::Address.full_address
    get root_url, params: { search_address: test_address }
    assert_response :success
    assert_includes @response.body, test_address.dup
  end

end
