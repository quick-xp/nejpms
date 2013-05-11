# coding: utf-8
require 'rubygems'
require 'dm-core'
require 'dm-migrations'
require_relative '../app/models/sell_order.rb'
require_relative '../app/models/buy_order.rb'

DataMapper.setup(:default, {
  adapter: "mysql",
  database: "eveonline",
  username: "work",
  host: "localhost" })
DataMapper.auto_migrate!
puts 'Migration complete'
