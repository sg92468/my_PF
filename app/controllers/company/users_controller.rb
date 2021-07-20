class Company::UsersController < ApplicationController
  before_action :authenticate_company!
  
  def index
    @users = User.page(params[:page]).per(10).reverse_order
  end

  def show
    @user = User.find(params[:id])
    @portfolios = @user.portfolios.page(params[:page]).per(5).reverse_order
  end

  private

  def user_params
    params.require(:user).permit(:image, :name, :kana_name, :postal_code, :address, :phone_number, :information, :available_language)
  end
end
