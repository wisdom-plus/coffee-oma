class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  INDEX_DISPALY_NUM = 9
  SHOW_DISPLAY_NUM = 5
  TOP_DISPALY_NUM = 3

  class << self
    def ransackable_attributes(auth_object = nil)
      if Ransack::SUPPORTS_ATTRIBUTE_ALIAS
        column_names + _ransackers.keys
      else
        column_names + _ransackers.keys + _ransackers.values.map(&:attribute_names).flatten
      end.uniq
    end
    def ransackable_associations(auth_object = nil)
      reflect_on_all_associations.map { |a| a.name.to_s }
    end
  end
end
