class Api::V1::DocumentsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    document = Document.new(documents_params)
    if document.save
      render json: {}, status: 200
    else
      render json: { errors: document.errors }, status: 422
    end
  end

  private

  def documents_params
    params.require(:document).permit(:category, :file)
  end
end
