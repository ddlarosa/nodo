#!/usr/bin/env ruby
#
# server_1

require 'rubygems'
require 'eventmachine'

  module EchoServer
    def post_init
      puts "-- someone connected to the echo server!"
    end

    def receive_data data
      send_data ">>> you sent: #{data}"
      puts "receive_data #{data}"
    end
  end

  EventMachine::run {
    EventMachine::start_server "0.0.0.0", 8081, EchoServer
    puts 'running echo server on 8081'
  }
