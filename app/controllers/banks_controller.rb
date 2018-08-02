class BanksController < ApplicationController
  def index
    render json: Bank.all
  end

  def create
    @bank = Bank.new(bank_params)
     if @bank.save
       render json: {status: "SUCCESS", message: "Loaded Data", data: @bank}
     else
       render json: @bank.errors, status: 422
     end
  end

  private

  def bank_params
    params.require(:bank).permit(:name, :cash)
  end
end
