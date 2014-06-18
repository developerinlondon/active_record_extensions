module ActiveRecordExtensions
  module CreateExtensions
    extend ActiveSupport::Concern

    module ClassMethods
      def update_or_create attrs_to_match, attrs_to_update = {}
        incumbent = where(attrs_to_match).first_or_initialize
        incumbent.update_attributes attrs_to_update
        incumbent
      end

      def self.delete_then_create(attrs_to_match, attrs_to_update = {})
        self.destroy_all!(attrs_to_match)
        self.create!(attrs_to_match.merge(attrs_to_update))
      end
    end
  end
end

ActiveRecord::Base.send :include, ActiveRecordExtensions
