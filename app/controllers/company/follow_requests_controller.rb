class Company::FollowRequestsController < ApplicationController
  def create
    user = User.find(params[:user_id])
    request = current_company.follow_requests.new(user_id: user.id, company_id: current_company.id)
    request.save
    redirect_back(fallback_location: company_users_path) #同じページにリダイレクト
  end

  def destroy
    user = User.find(params[:user_id])
    request = current_company.follow_requests.find_by(user_id: user.id, company_id: current_company.id)
    request.destroy
    redirect_back(fallback_location: company_users_path) #同じページにリダイレクト
  end
end
