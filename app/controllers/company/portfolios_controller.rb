class Company::PortfoliosController < ApplicationController
  before_action :authenticate_company!

  def index
    @portfolios = Portfolio.page(params[:page]).per(12).reverse_order
  end

  def show
    @portfolio = Portfolio.find(params[:id])
    @comment = Comment.new
  end

  private

  def portfolio_params
    params.require(:portfolio).permit(:image, :name, :information, :site_url, :github_url, :use_language, :genre_id)
  end

end
