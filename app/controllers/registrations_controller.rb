class RegistrationsController < ApplicationController
  before_action :set_event
  before_action :authenticate_user

  def create
    @registration = current_user.registrations.create(registration_params.merge({event: @event}))

    redirect_to @registration.event, notice: "Thank you for attending our event!"
  end

  private

  def registration_params
    params.require(:registration).permit(:guest_count)
  end

  end

  def set_event
    @event = Event.find(params[:id])
  end
end
