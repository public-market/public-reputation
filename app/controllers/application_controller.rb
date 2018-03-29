class ApplicationController < ActionController::API
  protected

  attr_reader :auth_user

  def respond_with_errors(object)
    render json: { errors: ErrorSerializer.serialize(object) }, status: :unprocessable_entity
  end

  def authenticate
    authenticate_api_key || render_unauthorized
  end

  def authenticate_api_key
    api_key = request.headers['X-Api-Key']
    @auth_user = ApiUser.find_by(api_key: api_key)
  end

  def render_unauthorized
    render json: { errors: [{ status: 401, title: 'Bad credentials' }] },
           status: :unauthorized
  end
end
