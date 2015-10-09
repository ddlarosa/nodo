#!/usr/bin/env ruby

require 'rubygems'
require 'eventmachine'
require './db'

  module EchoServer
    def post_init
      #puts "-- someone connected to the echo server!"
    end

    def receive_data data
      send_data ">>> you sent: #{data}"
      puts "#{data}"
      data_a=data.split('|')
      nodo=1
      mac=data_a[0]
      dbm=data_a[1]
      firsttime=data_a[2]
      lasttime=data_a[3]
      node_result=NodeResult.create(node_id:nodo,mac:mac,singal_db:dbm.to_i,firsttime:firsttime.to_i,lasttime:lasttime.to_i);
    end
  end

  EventMachine::run {
    EventMachine::start_server "0.0.0.0", 8081, EchoServer
    puts 'running echo server on 8081'
  }
