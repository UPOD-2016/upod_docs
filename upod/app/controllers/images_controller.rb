class ImagesController < ApplicationController
  def create
    uploader = SirTrevorImageUploader.new

    if uploader.store! params[:attachment][:file]
      render json: uploader.as_json, status: 200
    else
      render :json => uploader.errors, status: 500
    end

  end
end
