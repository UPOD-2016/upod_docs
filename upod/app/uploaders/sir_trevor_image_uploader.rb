# encoding: utf-8

class SirTrevorImageUploader< CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  include CarrierWave::MiniMagick
  # include CarrierWave::MimeTypes

  # process :set_content_type
  process :optimize

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/editor".tap do |s|
      s.prepend "test_" if Rails.env.test?
    end
  end

  def optimize
    manipulate! do |img|
      return img unless img.mime_type.match /jpe?g/

      img.strip
      img.combine_options do |c|
        c.quality "80"
        c.depth "8"
        c.interlace "plane"
      end

      img
    end
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  def default_url
  #   # For Rails 3.1+ asset pipeline compatibility:
      ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  end

  # Process files as they are uploaded:
  # process :scale => [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
    version :large do
      process resize_to_limit: [850, nil]
    end

    version :medium do
      process resize_to_limit: [640, nil]
    end

    version :small do
      process resize_to_limit: [320, nil]
    end

  # Add a white list of extensions which are allowed to be uploaded.
  def extension_white_list
    %w(jpg jpeg gif png)
  end

  def filename
     "#{secure_token(10)}.#{file.extension}" if original_filename.present?
  end

  protected
    def secure_token(length=16)
      var = :"@#{mounted_as}_secure_token"
      model.instance_variable_get(var) or model.instance_variable_set(var, SecureRandom.hex(length/2))
    end
end
