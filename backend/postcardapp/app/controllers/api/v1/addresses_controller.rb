class Api::V1::AddressesController < ApplicationController
  def index
    @addresses = Address.all
  end

  def show
    @address = Address.find(params[:id])
  end

  def new
  end

  def create
    @address = Address.new(address_params)
    if @address.save
      render json: @address, status: :accepted
    else
      render json: { errors: @note.errors.full_messages }, status: :unprocessible_entity
    end
  end

  def update
    @address = Address.update(address_params)
    if @address.save
      render json: @address, status: :accepted
    else
      render json: { errors: @address.errors.full_messages }, status: :unprocessible_entity
    end
  end
end

private

def address_params
  params.require(:address).permit(:street, :city, :state, :zip)
end
