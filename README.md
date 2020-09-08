# Billboard Hot 100 Songs
  
Want to know what the hottest songs are this week? What about an easy way to get data from the Billboard Hot 100 without being bombarded with videos and ads?  
  
This Ruby Gem allows you to access data on the Billboard Hot 100 (https://www.billboard.com/charts/hot-100) from the command line. Quickly generate the list of this week's Hot 100 songs with the following information,  
  
♪ Song name  
♪ Artist(s)  
♪ This week's rank  
♪ Change - The difference between this and last week's rank  
♪ Peak rank (or "Peak") - The highest rank that the song has ever reached on the Hot 100  
♪ Duration - The total number of weeks on the Hot 100  
  
You can even find answers to questions like,  
  
♪ Which songs are new this week?  
♪ Which songs have peaked #1?  
♪ Which songs have been on the charts the longest?  
  
Go ahead and check it out. Enjoy!  
  
## Preview  

![Welcome Screen](/images/1_Welcome_Screen_330.png)  

![Welcome Screen](/images/1_Welcome_Screen_340.png)  

![Welcome Screen](/images/1_Welcome_Screen_350.png)  

## Installation  

    $ gem install billboard_hot_100_songs

## Usage

Type the below and follow the on screen prompts.

    $ bin/billboard_hot_100_songs

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/alexander-mc/billboard_hot_100_songs. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
