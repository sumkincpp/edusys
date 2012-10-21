class CreateUserGroups < ActiveRecord::Migration
  def change
    create_table :user_groups do |t|
      t.integer :user_id
      t.integer :group_id
      t.datetime :enter_date

      t.timestamps
    end
  end
end
