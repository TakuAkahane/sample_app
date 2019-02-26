# Load the Rails application.
require_relative 'application'
# MySQL server has gone away 対策
require 'mysql_retry_lost_connection'

# Initialize the Rails application.
Rails.application.initialize!
