# coding: utf-8
class FileUploader < CarrierWave::Uploader::Base
  
  storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}"
  end
  
  def extension_white_list
    %w( pem )
  end
  
  def filename
    if super.present?
      @name ||= Digest::MD5.hexdigest(File.dirname(current_path))
      "#{@name}-#{original_filename}"
    end
  end
  
end 