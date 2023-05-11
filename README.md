# RubyDuga

Client for the DUGA Web Service API v1.2

## DUGA API Account

If you do not have a DUGA API Application ID, you can register at [DUGA](https://click.duga.jp/aff/40413-01). You will get Application ID and Agent ID.

## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add ruby_duga

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install ruby_duga

## Usage

```ruby
cli = RubyDuga.new(app_id: "YOUR_APP_ID", agent_id: "YOUR_AGENT_ID", banner_id: "YOUR_BANNER_ID")
response = cli.search(keyword: "コメディ", adult: 0)
response.body[:items].map {|x| x[:item][:title]}
=> ["けっこう仮面 マングリフォンの逆襲", "古今亭駒次「公園のひかり号」", "けっこう仮面 フォーエバー", "けっこう仮面 RETURNS", "できる子の証明", "天然華汁さやか", "けっこう仮面 プレミアム", "18倫 アイドルを探せ！", "ビキニ★ラーメン", "18倫"]
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/dugabot0/ruby_duga.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
