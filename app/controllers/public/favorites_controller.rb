class Public::FavoritesController < ApplicationController
  before_action :authenticate_user!

  def create
    portfolio = Portfolio.find(params[:portfolio_id])
    favorite = current_user.favorites.new(portfolio_id: portfolio.id)
    favorite.save
    redirect_to portfolio_path(portfolio)
  end

  def destroy
    portfolio = Portfolio.find(params[:portfolio_id])
    favorite = current_user.favorites.find_by(portfolio_id: portfolio.id)
    favorite.destroy
    redirect_to portfolio_path(portfolio)
  end
end
