[![Build Status](https://travis-ci.org/hsluv/hsluv-ruby.svg)](https://travis-ci.org/hsluv-colors/hsluv-ruby)
[![Gem Version](https://badge.fury.io/rb/hsluv.svg)](http://badge.fury.io/rb/hsluv)

A Ruby implementation of [HSLuv](http://www.hsluv.org).

## Demo

![Demo](http://i.imgur.com/GTsNT8u.gif)

Demo link: http://www.hsluv-colors.org/syntax/#006925

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'hsluv'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install hsluv

## Usage

- `hue` is a float between 0 and 360
- `saturation` is a float between 0 and 100
- `lightness` is a float between 0 and 100
- `hex` is the hexadecimal format of the color
- `red` is a float between 0 and 1
- `green` is a float between 0 and 1
- `blue` is a float between 0 and 1

#### Hsluv::hsluv_to_hex(hue, saturation, lightness) -> color as a hex string

```
Hsluv.hsluv_to_hex(12.177, 100, 53.23)
=> #ff0000
```

#### Hsluv::hsluv_to_rgb(hue, saturation, lightness) -> color as rgb

```
Hsluv.hsluv_to_rgb(12.177, 100, 53.23)
=> [0.9998643703868711, 6.849859221502719e-14, 8.791283550555612e-06]
```

#### Hsluv::hex_to_hsluv(hex) -> list of floats as defined above

```
Hsluv.hex_to_hsluv("#ff0000")
=> [12.177050630061776, 100.0000000000022, 53.23711559542933]
```

#### Hsluv::rgb_to_hsluv(rgb) -> list of floats as defined above

```
Hsluv.rgb_to_hsluv(0.99, 6.84e-14, 8.79e-16)
=> [12.17705063006216, 100.00000000000209, 52.711595266911985]
```

For HPLuv (the pastel variant), use:

  - `hpluv_to_hex`
  - `hpluv_to_rgb`
  - `hex_to_hpluv`
  - `rgb_to_hpluv`

## Testing

Run `rspec spec/`.

## Contributing

1. Fork it ( https://github.com/hsluv/hsluv-ruby/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
