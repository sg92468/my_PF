class Public::FollowCompaniesController < ApplicationController
  def index
    @followers = current_user.follow_companys.page(params[:page]).per(10).reverse_order

  end

  def destroy
    follow = FollowCompany.find(params[:id])
    follow.destroy
    redirect_back(fallback_location: root_path)
  end
end
