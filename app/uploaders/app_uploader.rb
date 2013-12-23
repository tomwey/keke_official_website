# coding: utf-8
class AppUploader < CarrierWave::Uploader::Base
  
  storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}"
  end
  
  def extension_white_list
    %w(apk ipa)
  end
  
end 