class Company::CompaniesController < ApplicationController
  before_action :authenticate_company!

  def show
    @company = Company.find(params[:id])
  end

  def edit
    @company = Company.find(params[:id])
  end

  def update
    @company = Company.find(params[:id])
    if @company.update(company_params)
      redirect_to company_company_path(@company) #企業詳細画面にリダイレクト
    else
      render 'edit'
    end
  end


  private

  def company_params
    params.require(:company).permit(:name, :kana_name, :email, :phone_number, :website)
  end
end
