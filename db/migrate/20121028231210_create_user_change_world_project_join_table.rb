class CreateUserChangeWorldProjectJoinTable < ActiveRecord::Migration
  def change
    create_table :change_world_projects_users, :id => false do |t|
      t.integer :change_world_project_id
      t.integer :user_id
    end
  end
end