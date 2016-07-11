class ImagesController < ApplicationController
  def create
    image = Image.create_from_filepath(params[:attachment][:file])
    render json: image.as_json, status: 200
  end
end
