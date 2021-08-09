class Public::CompaniesController < ApplicationController
  def show
    @company = Company.find(params[:id])
    @currentUserEntry = Entry.where(user_id: current_user.id)
    @companyEntry = Entry.where(company_id: @company.id)
    @currentUserEntry.each do |cu|
      @companyEntry.each do |u|
        if cu.room_id == u.room_id then
          @isRoom = true
          @roomId = cu.room_id
        end
      end
    end
    if @isRoom
    else
      @room = Room.new
      @entry = Entry.new
    end
  end
end
