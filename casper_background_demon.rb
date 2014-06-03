#!/usr/bin/env ruby
require 'daemons'

Daemons.run(ENV['HOME']+'/.casper_background/background.rb')
