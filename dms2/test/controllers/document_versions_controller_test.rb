require 'test_helper'

class DocumentVersionsControllerTest < ActionController::TestCase
  setup do
    @document_version = document_versions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:document_versions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create document_version" do
    assert_difference('DocumentVersion.count') do
      post :create, document_version: { comment: @document_version.comment, created_by_id: @document_version.created_by_id, document_id_id: @document_version.document_id_id, document_name: @document_version.document_name, file_location: @document_version.file_location, updated_by_id: @document_version.updated_by_id, version_document_name: @document_version.version_document_name }
    end

    assert_redirected_to document_version_path(assigns(:document_version))
  end

  test "should show document_version" do
    get :show, id: @document_version
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @document_version
    assert_response :success
  end

  test "should update document_version" do
    patch :update, id: @document_version, document_version: { comment: @document_version.comment, created_by_id: @document_version.created_by_id, document_id_id: @document_version.document_id_id, document_name: @document_version.document_name, file_location: @document_version.file_location, updated_by_id: @document_version.updated_by_id, version_document_name: @document_version.version_document_name }
    assert_redirected_to document_version_path(assigns(:document_version))
  end

  test "should destroy document_version" do
    assert_difference('DocumentVersion.count', -1) do
      delete :destroy, id: @document_version
    end

    assert_redirected_to document_versions_path
  end
end
