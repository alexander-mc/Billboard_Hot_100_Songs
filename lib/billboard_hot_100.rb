module BillboardHot100
end

require 'pry'
require 'nokogiri'
require 'open-uri'
require 'colorize'

# require_relative '../config/environment'
require_relative './concerns/validations.rb'
require_relative './billboard_hot_100/song.rb'
require_relative './billboard_hot_100/scraper.rb'
require_relative './billboard_hot_100/cli.rb'
require_relative './billboard_hot_100/version.rb'