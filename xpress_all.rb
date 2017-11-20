#!/usr/bin/env ruby

require 'sinatra'
require 'tilt/erb'
require 'nokogiri'
require 'open-uri'

get '/' do
  @base_url = 'http://www.xpress.hu'
  url = "#{@base_url}/xp/keres.asp?GOMB=60&KERES=5&TCS=10&PINF=1&MFID=10&RENDEZ=20&CSRKT=2&VID=066-281146680-55199729804481745"
  html = Nokogiri::HTML(open(url))

  page_numbers = []

  html.at_css('.keresleccenter').css('span a').each do |line|
    page_numbers << line.text
  end

  @last_number = page_numbers.last
  erb :xpress_all
end
