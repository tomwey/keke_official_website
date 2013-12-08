# encoding: utf-8
require "digest/md5"
require "carrierwave/processing/mini_magick"

class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  
  storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}"
  end
  
  def default_url
    "photo/#{version_name}.jpg"
  end
  
  version :normal do
    process :resize_to_fill => [48,48]
  end
  
  # version :medium do
  #   process :resize_to_fill => [32,32]
  # end
  
  version :small do
    process :resize_to_fill => [16,16]
  end
  
  version :large do
    process :resize_to_fill => [64,64]
  end
  
  version :big do
    process :resize_to_fill => [120,120]
  end
  
  def extension_white_list
    %w(jpg jpeg gif png)
  end

  # def filename
  #   if super.present?
  #     ext = File.extname(original_filename)
  #     # NOTE: 这里的到的图片是裁减过后的图片 MD5，也就是说，只有当原图小于裁减范围的时候，md5 才会保持和原始图片 md5 一致，而达到覆盖的目的
  #     fname = Digest::MD5.hexdigest(self.read)
  #     @name ||= "#{fname}#{ext}"
  #   end
  # end
  
  def filename
    if super.present?
      "avatar/#{Time.now.to_i}.#{file.extension.downcase}"
    end
  end

end
