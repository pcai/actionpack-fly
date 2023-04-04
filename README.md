
# Actionpack::Fly

![Build Status](https://github.com/pcai/actionpack-fly/actions/workflows/ruby.yml/badge.svg)

Simple gem that extends Rails `request.remote_ip` to default to Fly's `Fly-Client-IP` header. More about [Fly HTTP Request Headers](https://fly.io/docs/reference/runtime-environment/#fly-client-ip) and why we choose to trust `Fly-Client-IP`.


## Installation

Add this line to your Rails application's Gemfile:

```ruby
gem 'actionpack-fly'
```

## Usage

None! Just install and feel confident that `request.remote_ip` is doing its job.


## Contributing




## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Credits

Forked from https://github.com/customink/actionpack-cloudflare
