class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|

      t.string :title, null: false
      t.text :description
      t.references :creator
      # if we use foreign_key =true rails will look for the table
      # the other method is t.integer with foreign_key true
      t.timestamps
    end
  end
end
