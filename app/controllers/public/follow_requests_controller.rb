class Public::FollowRequestsController < ApplicationController
  def index
    @requests = current_user.follow_requests.all
  end

  def allow
    request = FollowRequest.find(params[:id])
    company = Company.find_by(id:request.company_id)
    follow = current_user.follow_companies.new(user_id:current_user.id, company_id: company.id)
      #follow＿requestsコントローラーですが、parent_followsのnewメソッドです。
    follow.save #parent_followに保存。
    request.destroy # follow_requestは削除
    redirect_back(fallback_location: root_path)
  end

  def destroy
    request = FollowRequest.find(params[:id])
    request.destroy
    redirect_back(fallback_location: root_path)
  end

end
