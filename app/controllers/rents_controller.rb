class RentsController < ApplicationController
  def create
    rent = Rent.new(rent_params)
    authorize rent

    if rent.save
      RentMailer.with(rent_id: rent.id).send_create_rent.deliver_later
      render json: rent, serializer: RentSerializer, status: :created
    else
      render json: rent.errors, status: :bad_request
    end
  end

  def index
    render_paginated policy_scope(Rent),
                     each_serializer: RentSerializer
  end

  private

  def rent_params
    params.require(:rent).permit(:user_id, :book_id, :rent_in, :rent_out)
  end
end
