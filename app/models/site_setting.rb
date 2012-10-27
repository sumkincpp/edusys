class SiteSetting < ActiveRecord::Base
  set_table_name "settings"
  attr_accessible :target_id, :target_type, :value, :var
end
