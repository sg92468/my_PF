class Public::CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    portfolio = Portfolio.find(params[:portfolio_id])
    comment = current_user.comments.new(comment_params)
    comment.portfolio_id = portfolio.id
    comment.score = Language.get_data(comment_params[:comment]) # AIによる自然言語処理の結果
    comment.save
    @comments = portfolio.comments.page(params[:page]).per(5).reverse_order # 非同期のため、コメント一覧データ取出し
  end

  def destroy
    Comment.find_by(id: params[:id], portfolio_id: params[:portfolio_id]).destroy
    @portfolio = Portfolio.find(params[:portfolio_id]) # 非同期のため、PFデータ取出し
    @comments = @portfolio.comments.page(params[:page]).per(5).reverse_order # 非同期のため、コメント一覧データ取出し
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
