class ProfilePhotoUploader < CarrierWave::Uploader::Base
  
  if Rails.env.test?
    storage :file
  else
    storage :fog
  end

  def store_dir
    "public/testuploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def default_url()
    "https://daily-buzz-profile-pics-development.s3.amazonaws.com/coffee-791045_1280.jpg"
  end
  
end
