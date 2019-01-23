class Api::V1::PostcardsController < ApplicationController
  def index
    @postcards = Postcard.all
    render json: @postcards
  end

  def show
    @postcard = Postcard.find(params[:id])
    render json: @postcard
  end

  def new
  end

  def create
    @postcard.new(postcard_params)
    if @postcard.save
      render json: @postcard, status: :accepted
    else
      render json: { errors: @note.errors.full_messages }, status: :unprocessible_entity
    end
  end

  def update
    @postcard.update(postcard_params)
    if @postcard.save
      render json: @postcard, status: :accepted
    else
      render json: { errors: @postcard.errors.full_messages }, status: :unprocessible_entity
    end
  end

  def destroy
    @postcards = Postcard.all
    @postcard = Postcard.find(params[:id])
    if @postcard.destroy
      render json: @postcards, status: :accepted
    else
      render json: { errors: @postcard.errors.full_messages }, status: :unprocessible_entity
    end

  end
end


private

def postcard_params
  params.require(:postcard).permit(:message, :name, :address)
end
