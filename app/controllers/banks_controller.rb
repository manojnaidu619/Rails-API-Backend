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

  def update
    @bank = Bank.find(params[:id])
     if @bank.update(bank_params)
       render json: {status: "SUCCESS", message: "Updated Data", data: @bank}
     else
       render json: @bank.errors, status: 422
     end
  end

  private

  def bank_params
    params.require(:bank).permit(:name, :cash)
  end
end
