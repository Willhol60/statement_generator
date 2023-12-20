# frozen_string_literal: true

require 'test_helper'

class StatementsControllerTest < ActionDispatch::IntegrationTest
  test 'should get new' do
    get statements_new_url
    assert_response :success
  end
end
