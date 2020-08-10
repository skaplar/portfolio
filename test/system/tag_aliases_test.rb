require "application_system_test_case"

class TagAliasesTest < ApplicationSystemTestCase
  setup do
    @tag_alias = tag_aliases(:one)
  end

  test "visiting the index" do
    visit tag_aliases_url
    assert_selector "h1", text: "Tag Aliases"
  end

  test "creating a Tag alias" do
    visit tag_aliases_url
    click_on "New Tag Alias"

    fill_in "Alias", with: @tag_alias.alias
    fill_in "Tag", with: @tag_alias.tag_id
    click_on "Create Tag alias"

    assert_text "Tag alias was successfully created"
    click_on "Back"
  end

  test "updating a Tag alias" do
    visit tag_aliases_url
    click_on "Edit", match: :first

    fill_in "Alias", with: @tag_alias.alias
    fill_in "Tag", with: @tag_alias.tag_id
    click_on "Update Tag alias"

    assert_text "Tag alias was successfully updated"
    click_on "Back"
  end

  test "destroying a Tag alias" do
    visit tag_aliases_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Tag alias was successfully destroyed"
  end
end
