class Public::PortfoliosController < ApplicationController
  before_action :authenticate_user!

  def new
    @portfolio = Portfolio.new
  end

  def create
    @portfolio = Portfolio.new(portfolio_params)
    @portfolio.user_id = current_user.id
    if @portfolio.save
      redirect_to portfolio_path(@portfolio.id)
    else
      render 'new'
    end
  end

  def index
    @portfolios = Portfolio.page(params[:page]).per(10).reverse_order
  end

  def show
    @portfolio = Portfolio.find(params[:id])
    @comments = @portfolio.comments.page(params[:page]).per(5).reverse_order
    @comment = Comment.new
  end

  def edit
    @portfolio = Portfolio.find(params[:id])
  end

  def update
    @portfolio = Portfolio.find(params[:id])
    if @portfolio.update(portfolio_params)
      redirect_to portfolio_path(@portfolio.id)
    else
      render 'edit'
    end
  end

  def destroy
    @portfolio = Portfolio.find(params[:id])
    @portfolio.destroy
    redirect_to user_path(@portfolio.user)
  end

  def search
    @portfolios = Portfolio.search(params[:keyword]).page(params[:page]).per(10).reverse_order
  end

  private

  def portfolio_params
    params.require(:portfolio).permit(:image, :name, :information, :site_url, :github_url, :use_language, :genre_id)
  end

end
