# encoding: utf-8
class ScreenshotUploader < BaseUploader
  
  process :resize_to_limit => [640, nil]
  
  def filename
    if super.present?
      @name ||= Digest::MD5.hexdigest(File.dirname(current_path))
      "#{@name}.#{file.extension.downcase}"
    end
  end

end
