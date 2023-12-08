[![Ruby](https://github.com/hsluv/hsluv-ruby/actions/workflows/ruby.yml/badge.svg)](https://github.com/hsluv/hsluv-ruby/actions/workflows/ruby.yml)
[![Gem Version](https://img.shields.io/gem/v/hsluv.svg)](https://rubygems.org/gems/hsluv)

A Ruby implementation of [HSLuv](https://www.hsluv.org).

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

```ruby
Hsluv.hsluv_to_hex(12.177, 100, 53.23)
=> #ff0000
```

#### Hsluv::hsluv_to_rgb(hue, saturation, lightness) -> color as rgb

```ruby
Hsluv.hsluv_to_rgb(12.177, 100, 53.23)
=> [0.9998643703868711, 6.849859221502719e-14, 8.791283550555612e-06]
```

#### Hsluv::hex_to_hsluv(hex) -> list of floats as defined above

```ruby
Hsluv.hex_to_hsluv("#ff0000")
=> [12.177050630061776, 100.0000000000022, 53.23711559542933]
```

#### Hsluv::rgb_to_hsluv(rgb) -> list of floats as defined above

```ruby
Hsluv.rgb_to_hsluv(0.99, 6.84e-14, 8.79e-16)
=> [12.17705063006216, 100.00000000000209, 52.711595266911985]
```

For HPLuv (the pastel variant), use:

- `hpluv_to_hex`
- `hpluv_to_rgb`
- `hex_to_hpluv`
- `rgb_to_hpluv`

## Local workflow

If you don't have Ruby installed already, I recommend using our [devcontainer.json](.devcontainer/devcontainer.json) configuration to launch your editor in a pre-built Ruby container. Also consider using GitHub "Codespaces" feature if you don't use Docker.

Initial setup:

```bash
bundle install
```

Test:

```bash
bundle exec rspec
```

## Releasing a new version

1. Log in to [rubygems.org](https://rubygems.org/) using our shared [hsluv](https://rubygems.org/profiles/hsluv) profile
2. Make a new API key if necessary, copy it to GitHub Actions `HSLUV_RUBYGEMS_API_KEY` secret
3. Update [hsluv.gemspec](./hsluv.gemspec) with new version, e.g. `1.0.2.rc1`, push to a branch
4. Run [gem.yml workflow](https://github.com/hsluv/hsluv-ruby/actions/workflows/gem.yml) on that branch
5. Sanity check: `gem install --user-install hsluv -v 1.0.2.rc1`

## Version history

1.0.2

- Add HSLuv revision 4 support (thanks @felix-d)
