#! /usr/local/bin/ruby 
# encoding: utf-8 
require 'rubygems'
require 'uri'


# Set up gems listed in the Gemfile.
ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)

require 'bundler/setup' if File.exists?(ENV['BUNDLE_GEMFILE'])

bookmark_file = File.new("bookmarks_6_7_12.html", "r", :encoding => "BINARY")

contents = bookmark_file.read
# extract first URI from html_string
#url_array = URI.extract(content)
url_array = contents.scan(/\bhttps?:\/\/\S+\b/)
puts url_array





