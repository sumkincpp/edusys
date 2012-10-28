class CreateChangeWorldProjects < ActiveRecord::Migration
  def change
    create_table :change_world_projects do |t|
      t.enum :district, :limit => ['Центральный', 'Северный', 'Северо-Восточный', 'Восточный', 'Юго-Восточный',
                                   'Южный', 'Юго-Западный', 'Западный', 'Северо-Западный', 'Зеленоградский',
                                   'Новомосковский', 'Троицкий'] #, :default => 'не задан'
      t.string :school
      t.enum :nomination, :limit => ['социальный проект', 'социальная реклама', 'проект по социальному заказу']
      t.string :project_name
      t.text :authors
      t.string :supervisor
      t.string :phone_sup
      t.string :phone_sup_mob
      t.string :document

      t.timestamps
    end
  end
end

