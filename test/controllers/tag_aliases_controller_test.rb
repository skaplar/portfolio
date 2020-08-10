require 'test_helper'

class TagAliasesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tag_alias = tag_aliases(:one)
  end

  test "should get index" do
    get tag_aliases_url
    assert_response :success
  end

  test "should get new" do
    get new_tag_alias_url
    assert_response :success
  end

  test "should create tag_alias" do
    assert_difference('TagAlias.count') do
      post tag_aliases_url, params: { tag_alias: { alias: @tag_alias.alias, tag_id: @tag_alias.tag_id } }
    end

    assert_redirected_to tag_alias_url(TagAlias.last)
  end

  test "should show tag_alias" do
    get tag_alias_url(@tag_alias)
    assert_response :success
  end

  test "should get edit" do
    get edit_tag_alias_url(@tag_alias)
    assert_response :success
  end

  test "should update tag_alias" do
    patch tag_alias_url(@tag_alias), params: { tag_alias: { alias: @tag_alias.alias, tag_id: @tag_alias.tag_id } }
    assert_redirected_to tag_alias_url(@tag_alias)
  end

  test "should destroy tag_alias" do
    assert_difference('TagAlias.count', -1) do
      delete tag_alias_url(@tag_alias)
    end

    assert_redirected_to tag_aliases_url
  end
end
