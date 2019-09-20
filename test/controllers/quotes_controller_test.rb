require 'test_helper'

class QuotesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get quotes_index_url
    assert_response :success
  end

  test "should get new" do
    get quotes_new_url
    assert_response :success
  end

  test "should get create" do
    get quotes_create_url
    assert_response :success
  end

  test "should get edit" do
    get quotes_edit_url
    assert_response :success
  end

  test "should get update" do
    get quotes_update_url
    assert_response :success
  end

  test "should get delete" do
    get quotes_delete_url
    assert_response :success
  end

end
