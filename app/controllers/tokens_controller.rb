class TokensController < ApplicationController

  def send_generate_token
    @token = Token.create(token_number: 6.times.map{SecureRandom.rand(10)}.join)
    if @token.token_number.present?
      render json: @token.token_number, status: 200
    else
      render json: @token.errors.as_json(full_messages: true), status: :unprocessable_entity
    end
  end

  def deactivate
    if Deactivator.deactivate(@token)
      head(:ok)
    else
      render json: {error: {deactivate_error: "Token could not be deactivated"}}, status: :unprocessable_entity
    end
  end

  def reactivate
    if Deactivator.reactivate(@token)
      head(:ok)
    else
      render json: {error: {deactivate_error: "Token could not be reactivated"}}, status: :unprocessable_entity
    end
  end

  def destroy
    if @token.destroy
      head :ok
    else
      render json: token.errors.as_json(full_messages: true), status: :unprocessable_entity
  end
end
