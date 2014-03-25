# CarrierWave Watermarker

Watermarker provides a simple processor for placing watermark on images.

## Usage

```ruby
class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::Watermarker

  process watermark: "#{Rails.root}/app/assets/images/watermark.png"

  version :thumbnail do
    process watermark: ["#{Rails.root}/app/assets/images/watermark.png", 'Center']
  end
end
```

Watermark process accepts one or two parameters. Second optional parameter it's
a place where you want to place watermark. You can choose one of these places:
None, Center, East, Forget, NorthEast, North, NorthWest, SouthEast, South,
SouthWest, West, Static

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'carrierwave_watermarker'
```

And then execute:

```shell
$ bundle
```

## Requirements

CarrierWave Watermarker uses
[MiniMagick](https://github.com/probablycorey/mini_magick)

On OS X:

```shell
$ brew install imagemagick
```
