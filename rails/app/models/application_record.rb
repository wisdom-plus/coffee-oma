class ApplicationRecord < ActiveRecord::Base
  include RansackableColumns

  self.abstract_class = true

  INDEX_DISPALY_NUM = 9
  SHOW_DISPLAY_NUM = 5
  TOP_DISPALY_NUM = 3
end
