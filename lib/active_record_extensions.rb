require 'active_record'
require "active_record_extensions/version"
require "active_record_extensions/create_extensions"

ActiveRecord::Base.send :include, ActiveRecordExtensions::CreateExtensions
