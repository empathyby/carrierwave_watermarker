require 'mini_magick'

module CarrierWave::Watermarker
  DEFAULT_GRAVITY = 'SouthEast'
  POSSIBLE_GRAVITY = %w(None Center East Forget NorthEast North NorthWest SouthEast South SouthWest West Static)

  def watermark(watermark_path, gravity = DEFAULT_GRAVITY)
    unless File.exist?(watermark_path)
      Rails.logger.warn "There is no watermark image! #{watermark_path}"
      return
    end
    gravity = DEFAULT_GRAVITY unless POSSIBLE_GRAVITY.include?(gravity.to_s)

    image = MiniMagick::Image.open(current_path)
    result = image.composite(MiniMagick::Image.open(watermark_path)) do |c|
      c.gravity gravity
    end

    result.write(current_path)
  end
end
