require "application_system_test_case"

class StudentGroupsTest < ApplicationSystemTestCase
  setup do
    @student_group = student_groups(:one)
  end

  test "visiting the index" do
    visit student_groups_url
    assert_selector "h1", text: "Student groups"
  end

  test "should create student group" do
    visit student_groups_url
    click_on "New student group"

    fill_in "Name", with: @student_group.name
    click_on "Create Student group"

    assert_text "Student group was successfully created"
    click_on "Back"
  end

  test "should update Student group" do
    visit student_group_url(@student_group)
    click_on "Edit this student group", match: :first

    fill_in "Name", with: @student_group.name
    click_on "Update Student group"

    assert_text "Student group was successfully updated"
    click_on "Back"
  end

  test "should destroy Student group" do
    visit student_group_url(@student_group)
    click_on "Destroy this student group", match: :first

    assert_text "Student group was successfully destroyed"
  end
end
