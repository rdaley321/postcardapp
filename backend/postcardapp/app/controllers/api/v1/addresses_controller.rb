class Api::V1::AddressesController < ApplicationController
  def create
    @address.new(address_params)
    if @address.save
      render json: @postcard, status: :accepted
    else
      render json: { errors: @note.errors.full_messages }, status: :unprocessible_entity
    end
  end

  def update
    @address.update(address_params)
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
