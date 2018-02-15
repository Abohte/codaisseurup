class Api::RegistrationsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_event

  def create
    registration = @event.registrations.new(registration_params)
    registration.set_total_price

    if registration.save
      render status: 201, json: {
        message: "Registration created",
        event: @event,
        registration: registration
      }.to_json
    else
      render status: 422, json: {
        message: "Registration could not be created",
        errors: registration.errors
      }.to_json
    end
  end

  private

  def registration_params
    params.require(:registration).permit(:guest_count)
  end

  def set_event
    @event = Event.find(params[:event_id])
  end
end
