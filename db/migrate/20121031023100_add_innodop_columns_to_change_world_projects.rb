class AddInnodopColumnsToChangeWorldProjects < ActiveRecord::Migration
  def change
    add_column :change_world_projects, :directive_type, :enum, :limit => ['О мерах по реализации государственной политики в области образования и науки', 'Развитие образования города Москвы ("Столичное образование")']
    add_column :change_world_projects, :directive_text, :text
    add_column :change_world_projects, :concept, :text
    add_column :change_world_projects, :purpose, :text
    add_column :change_world_projects, :resources, :text
    add_column :change_world_projects, :current_results, :text
    add_column :change_world_projects, :future_results, :text
  end
end