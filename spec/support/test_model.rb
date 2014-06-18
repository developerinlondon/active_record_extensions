# class used for testing activerecord extensions
ActiveRecord::Base.establish_connection(:adapter => "sqlite3",
                                        :database => File.dirname(__FILE__) + "/db/active_record_extensions.sqlite3")

if ActiveRecord::Base.connection.table_exists? :test_models
  ActiveRecord::Migration.drop_table :test_models
end

ActiveRecord::Migration.create_table :test_models do |t|
  t.date    :day
  t.string  :foo
end

class TestModel < ActiveRecord::Base
end
