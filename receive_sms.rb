require 'sinatra'
require 'rubygems'
require 'bundler'
Bundler.require
require 'json'
require 'cgi'

configure do
  enable :logging, :dump_errors, :raise_errors, :show_exceptions
  $stdout.sync = true
  $stderr.sync = true
end

# URL configured as "SMS Mobile Originated URI"
post '/' do
  begin
    STDOUT.puts request.body.read
  rescue
    STDERR.puts "Error! #{$!}"
    $@.each { |x| STDERR.puts x }
  end

  [202,"Accepted"]
end

