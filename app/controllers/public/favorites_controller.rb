class Public::FavoritesController < ApplicationController
  before_action :authenticate_user!
  before_action :portfolio_params


  def create
    Favorite.create(user_id: current_user.id, portfolio_id: @portfolio.id)
    #非同期のためリダイレクトの指定なし
  end

  def destroy
    Favorite.find_by(user_id: current_user.id, portfolio_id: @portfolio.id).destroy
    #非同期のためリダイレクトの指定なし
  end

  private

  def portfolio_params
    @portfolio = Portfolio.find(params[:portfolio_id])
  end

end
