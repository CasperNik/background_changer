#!/usr/bin/env ruby
require 'yaml'
@config = {}
@config_file = ENV['HOME']+'/.casper_background/config.txt'
@default_config = {'folder'=> ENV['HOME']+'/Pictures/', 'time'=>'10'}
@photos = {}

def main
  upload_config
  loop do
    @photos = `find #{@config['folder']} -type f | grep [jJ][pP][eE]*[gG]`
    photo = @photos.split(/\n/).shuffle.sample
    `gsettings set org.gnome.desktop.background picture-uri "file:///#{photo}"`
    sleep @config['time'].to_i*60
  end
end

def upload_config
  if File.exist?(@config_file)
    begin
      config_file_text = File.read(@config_file)
      @config = YAML.load config_file_text || {}
    rescue
      p 'Something wrong with config file.'
    end
  else
    @config = @default_config
  end
end


main()