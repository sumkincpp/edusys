class CreateChangeWorldProjects < ActiveRecord::Migration
  def change
    create_table :change_world_projects do |t|
      t.enum :district, :limit => ['Центральный', 'Северный', 'Северо-Восточный', 'Восточный', 'Юго-Восточный',
                                   'Южный', 'Юго-Западный', 'Западный', 'Северо-Западный', 'Зеленоградский',
                                   'Новомосковский', 'Троицкий'] #, :default => 'не задан'
      t.string :school
      t.enum :nomination, :limit => ['Педагогические инновации', 'Экономические инновации',
                                     'Инновации в области физкультурно-спортивной деятельности',
                                     'Инновационные проекты в области культурно-массовой',
                                     'Организационно-управленческие инновации']
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
