require 'test_helper'

class StudentsControllerTest < ActionController::TestCase
  setup do
    @student = students(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:students)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create student" do
    assert_difference('Student.count') do
      post :create, student: { awaited_Fri: @student.awaited_Fri, awaited_Mon: @student.awaited_Mon, awaited_Sat: @student.awaited_Sat, awaited_Sun: @student.awaited_Sun, awaited_Thu: @student.awaited_Thu, awaited_Tue: @student.awaited_Tue, awaited_Wed: @student.awaited_Wed, course_id: @student.course_id, name: @student.name, surname: @student.surname }
    end

    assert_redirected_to student_path(assigns(:student))
  end

  test "should show student" do
    get :show, id: @student
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @student
    assert_response :success
  end

  test "should update student" do
    patch :update, id: @student, student: { awaited_Fri: @student.awaited_Fri, awaited_Mon: @student.awaited_Mon, awaited_Sat: @student.awaited_Sat, awaited_Sun: @student.awaited_Sun, awaited_Thu: @student.awaited_Thu, awaited_Tue: @student.awaited_Tue, awaited_Wed: @student.awaited_Wed, course_id: @student.course_id, name: @student.name, surname: @student.surname }
    assert_redirected_to student_path(assigns(:student))
  end

  test "should destroy student" do
    assert_difference('Student.count', -1) do
      delete :destroy, id: @student
    end

    assert_redirected_to students_path
  end
end
