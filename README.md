[![Build Status](https://travis-ci.org/husl-colors/husl-ruby.svg)](https://travis-ci.org/husl-colors/husl-ruby)
[![Gem Version](https://badge.fury.io/rb/husl.svg)](http://badge.fury.io/rb/husl)

A Ruby implementation of [HUSL](http://www.husl-colors.org).

## Demo

![Demo](http://i.imgur.com/GTsNT8u.gif)

Demo link: http://www.husl-colors.org/syntax/#006925

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'husl'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install husl

## Usage

- `hue` is a float between 0 and 360
- `saturation` is a float between 0 and 100
- `lightness` is a float between 0 and 100
- `hex` is the hexadecimal format of the color
- `red` is a float between 0 and 1
- `green` is a float between 0 and 1
- `blue` is a float between 0 and 1

#### Husl::husl_to_hex(hue, saturation, lightness) -> color as a hex string

```
Husl.husl_to_hex(12.177, 100, 53.23)
=> #ff0000
```

#### Husl::husl_to_rgb(hue, saturation, lightness) -> color as rgb

```
Husl.husl_to_rgb(12.177, 100, 53.23)
=> [0.9998643703868711, 6.849859221502719e-14, 8.791283550555612e-06]
```

#### Husl::hex_to_husl(hex) -> list of floats as defined above

```
Husl.hex_to_husl("#ff0000")
=> [12.177050630061776, 100.0000000000022, 53.23711559542933]
```

#### Husl::rgb_to_husl(rgb) -> list of floats as defined above

```
Husl.rgb_to_husl(0.99, 6.84e-14, 8.79e-16)
=> [12.17705063006216, 100.00000000000209, 52.711595266911985]
```

For HUSLp (the pastel variant), use:

  - `huslp_to_hex`
  - `huslp_to_rgb`
  - `hex_to_huslp`
  - `rgb_to_huslp`

## Testing

Run `rspec spec/`.

## Contributing

1. Fork it ( https://github.com/husl-colors/husl-ruby/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
