require 'slim'
require 'the_notification/version'
require 'the_notification/config'

module TheNotification
  class Engine < Rails::Engine; end
end

_root_ = File.expand_path('../../', __FILE__)

%w[ localized_errors ].each do |concern|
  require "#{ _root_ }/app/models/concerns/#{ concern }.rb"
end
