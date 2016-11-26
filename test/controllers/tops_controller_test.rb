require 'test_helper'

class TopsControllerTest < ActionController::TestCase
  setup do
    @top = tops(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tops)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create top" do
    assert_difference('Top.count') do
      post :create, top: { desc1: @top.desc1, desc2: @top.desc2, desc3: @top.desc3, desc4: @top.desc4, desc5: @top.desc5, iscategory: @top.iscategory, ispublic: @top.ispublic, sources: @top.sources, top1: @top.top1, top2: @top.top2, top3: @top.top3, top4: @top.top4, top5: @top.top5, user_id: @top.user_id }
    end

    assert_redirected_to top_path(assigns(:top))
  end

  test "should show top" do
    get :show, id: @top
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @top
    assert_response :success
  end

  test "should update top" do
    patch :update, id: @top, top: { desc1: @top.desc1, desc2: @top.desc2, desc3: @top.desc3, desc4: @top.desc4, desc5: @top.desc5, iscategory: @top.iscategory, ispublic: @top.ispublic, sources: @top.sources, top1: @top.top1, top2: @top.top2, top3: @top.top3, top4: @top.top4, top5: @top.top5, user_id: @top.user_id }
    assert_redirected_to top_path(assigns(:top))
  end

  test "should destroy top" do
    assert_difference('Top.count', -1) do
      delete :destroy, id: @top
    end

    assert_redirected_to tops_path
  end
end
