class Public::RoomsController < ApplicationController

  before_action :authenticate_user!

  def create
    @room = Room.create(params.require(:room).permit(:user_id, :company_id))
    @entry1 = Entry.create(room_id: @room.id, user_id: current_user.id, company_id: @room.company_id)
    @entry2 = Entry.create(params.require(:entry).permit(:user_id, :room_id, :company_id).merge(room_id: @room.id))
    redirect_to "/rooms/#{@room.id}"
  end

  def show
    @room = Room.find(params[:id])
      @messages = @room.messages
      @message = Message.new
      @entries = @room.entries
  end

end
