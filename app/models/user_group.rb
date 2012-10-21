class UserGroup < ActiveRecord::Base
  attr_accessible :enter_date, :group_id, :user_id

  belongs_to :user
  belongs_to :group
end
