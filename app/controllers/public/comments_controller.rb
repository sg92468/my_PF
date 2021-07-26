class Public::CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    portfolio = Portfolio.find(params[:portfolio_id])
    comment = current_user.comments.new(comment_params)
    comment.portfolio_id = portfolio.id
    comment.save

    @comments = portfolio.comments.page(params[:page]).per(5).reverse_order
  end

  def destroy
    Comment.find_by(id: params[:id], portfolio_id: params[:portfolio_id]).destroy
    @portfolio = Portfolio.find(params[:portfolio_id])
    @comments = @portfolio.comments.page(params[:page]).per(5).reverse_order
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end

end
