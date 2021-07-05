require 'bundler'
Bundler.require

# Setup a DB connection here
require_relative '../db/seed.rb'
require_relative '../lib/queries.rb'