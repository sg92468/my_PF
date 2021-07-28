class Public::UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @portfolios = @user.portfolios.page(params[:page]).per(5).reverse_order
  end

  def edit
    @path = Rails.application.routes.recognize_path(request.referer) # サインアップ後にのみ説明文章を表示するため定義
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render 'edit'
    end
  end

  def favorites
    @user = User.find(params[:id])
    @favorites = Favorite.where(user_id: @user.id)
  end

  private

  def user_params
    params.require(:user).permit(:image, :name, :kana_name, :postal_code, :address, :phone_number, :information, :available_language)
  end
end
