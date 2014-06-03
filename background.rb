#!/usr/bin/env ruby
require 'yaml'
@config = {}
@config_file = ENV['HOME']+'/.casper_background/config.txt'
@default_config = {'folder'=> ENV['HOME']+'/Pictures/', 'time'=>'10', 'using_photo_in_log'=>'2'}
@log_file = ENV['HOME']+'/.casper_background/log.txt'
@photos = {}

def main
  clear_log
  upload_config
  begin
  loop do
    @photos = `find #{@config['folder']} -type f | grep [jJ][pP][eE]*[gG]`.split(/\n/)
    photo = @photos.shuffle.sample
    `gsettings set org.gnome.desktop.background picture-uri "file:///#{photo}"`
    log " - #{@photos.count} photos was founded. Using #{photo.to_s} for background" if @config['using_photo_in_log'] == '1'
    sleep @config['time'].to_i*60
  end
  rescue
    log 'Something wrong in main loop.'
  end
end

def upload_config
  if File.exist?(@config_file)
    begin
      config_file_text = File.read(@config_file)
      @config = YAML.load config_file_text || {}
      log "Config file from #{@config_file} was upload successfully"
    rescue
      log "Something wrong with config file from #{@config_file}."
    end
  else
    @config = @default_config
    log "Default config was uploaded"
  end
end

def log(message)
  notes = Time.now.to_s + " " + message
	File.open(@log_file, "a+"){|f| f.puts(notes); f.close}
end

def clear_log
  File.delete @log_file if File.exist? @log_file
end


main()
