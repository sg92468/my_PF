class Company::SearchesController < ApplicationController
  def search
    @model = params["search"]["model"]
    if @model == 'portfolio'
      @datas = Portfolio.search(params[:keyword]).page(params[:page]).per(10).reverse_order
      # portfolioモデルでsearchの定義記述あり
    elsif @model == 'user'
      @datas = User.search(params[:keyword]).page(params[:page]).per(10).reverse_order
      # portfolioモデルでsearchの定義記述あり
    end
  end
end
