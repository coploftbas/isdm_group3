require 'test_helper'

class DocumentsControllerTest < ActionController::TestCase
  setup do
    @document = documents(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:documents)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create document" do
    assert_difference('Document.count') do
      post :create, document: { comment: @document.comment, created_by_id: @document.created_by_id, file_location: @document.file_location, name: @document.name, project_id_id: @document.project_id_id, updated_by_id: @document.updated_by_id }
    end

    assert_redirected_to document_path(assigns(:document))
  end

  test "should show document" do
    get :show, id: @document
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @document
    assert_response :success
  end

  test "should update document" do
    patch :update, id: @document, document: { comment: @document.comment, created_by_id: @document.created_by_id, file_location: @document.file_location, name: @document.name, project_id_id: @document.project_id_id, updated_by_id: @document.updated_by_id }
    assert_redirected_to document_path(assigns(:document))
  end

  test "should destroy document" do
    assert_difference('Document.count', -1) do
      delete :destroy, id: @document
    end

    assert_redirected_to documents_path
  end
end
