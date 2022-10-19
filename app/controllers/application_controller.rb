class ApplicationController < ActionController::API
  include ActionController::Cookies

  rescue_from ActiveRecord::RecordInvalid, with: :record_invalid_message
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found_message

  private

  def record_invalid_message err
    render json: { "errors": ["validation errors"] }, status: :unprocessable_entity
  end

  def record_not_found_message err
    render json: { "error": "#{err.model} not found" }, status: :not_found
  end

end
