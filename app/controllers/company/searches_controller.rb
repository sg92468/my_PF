class Company::SearchesController < ApplicationController
  def search
    @model = params["search"]["model"]
    if @model == 'portfolio'
      @datas = Portfolio.search(params[:keyword]).page(params[:page]).per(10).reverse_order
    elsif @model == 'user'
      @datas = User.search(params[:keyword]).page(params[:page]).per(10).reverse_order
    end
  end


end
