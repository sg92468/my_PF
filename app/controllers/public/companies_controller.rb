class Public::CompaniesController < ApplicationController
  def show
    @company = Company.find(params[:id])
    @room_exist = Room.where(user_id: current_user.id, company_id: @company.id)
    if @room_exist.present?
      @room = Room.find_by(user_id: current_user.id, company_id: @company.id)
    else
      @room = Room.new
      @entry = Entry.new
    end
  end
end
