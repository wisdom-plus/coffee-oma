class LogoUploader < CarrierWave::Uploader::Base
  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  # storage :file
  if Rails.env.production?
    # :nocov:
    storage :fog
    # :nocov:
  else
    storage :file
  end

  process resize_and_pad: [500, 350, '#ffffff']

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    if Rails.env.test?
      "uploads/#{Rails.env}/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
    else
      # :nocov:
      "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
      # :nocov:
    end
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url(*_args)
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   ActionController::Base.helpers.asset_path([version_name, 'noimage.png'].compact.join('_'))

  #   # "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process scale: [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  # version :thumb do
  #   process resize_to_fit: [300, 300]
  # end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_allowlist
    %w[jpg png jpeg]
  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  def filename
    original_filename
  end

  def size_range
    1..(10.megabytes)
  end
end
