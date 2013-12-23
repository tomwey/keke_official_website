# encoding: utf-8
class ImageUploader < BaseUploader
  
  version :normal do
    process :resize_to_fill => [48,48]
  end
  
  version :small do
    process :resize_to_fill => [16,16]
  end
  
  version :large do
    process :resize_to_fill => [64,64]
  end
  
  version :big do
    process :resize_to_fill => [120,120]
  end
  
  def filename
    if super.present?
      "avatar/#{Time.now.to_i}.#{file.extension.downcase}"
    end
  end

end
