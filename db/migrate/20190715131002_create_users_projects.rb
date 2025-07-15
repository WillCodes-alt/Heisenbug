class CreateUsersProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :users_projects do |t|

      t.timestamps
    end
  end
end
