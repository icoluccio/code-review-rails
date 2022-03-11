class ApplicationController < ActionController::Base
  include Pundit
  include Wor::Paginate
  before_action :authenticate_user!, unless: :devise_controller?
  include DeviseTokenAuth::Concerns::SetUserByToken
  protect_from_forgery with: :null_session

  def render_errors(message, status = :bad_request)
    Rails.logger.error(message)
    render json: { errors: message }, status: status
  end
end
