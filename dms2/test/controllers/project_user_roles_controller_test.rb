require 'test_helper'

class ProjectUserRolesControllerTest < ActionController::TestCase
  setup do
    @project_user_role = project_user_roles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:project_user_roles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create project_user_role" do
    assert_difference('ProjectUserRole.count') do
      post :create, project_user_role: { project_id_id: @project_user_role.project_id_id, role_id_id: @project_user_role.role_id_id, user_id_id: @project_user_role.user_id_id }
    end

    assert_redirected_to project_user_role_path(assigns(:project_user_role))
  end

  test "should show project_user_role" do
    get :show, id: @project_user_role
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @project_user_role
    assert_response :success
  end

  test "should update project_user_role" do
    patch :update, id: @project_user_role, project_user_role: { project_id_id: @project_user_role.project_id_id, role_id_id: @project_user_role.role_id_id, user_id_id: @project_user_role.user_id_id }
    assert_redirected_to project_user_role_path(assigns(:project_user_role))
  end

  test "should destroy project_user_role" do
    assert_difference('ProjectUserRole.count', -1) do
      delete :destroy, id: @project_user_role
    end

    assert_redirected_to project_user_roles_path
  end
end
