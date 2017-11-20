#!/usr/bin/env ruby

require 'sinatra'
require 'tilt/erb'
require 'nokogiri'
require 'open-uri'

get '/' do
  @base_url = 'http://www.xpress.hu'
  bluray_url = "#{@base_url}/xp/TCS.asp?TCS=10&VID=066-281146680-55199729804481745"

  data = Nokogiri::HTML(open(bluray_url))
  @films = data.css('.TOPwrap2')
  erb :xpress
end
