class CreateBugs < ActiveRecord::Migration[5.2]
  def change
    create_table :bugs do |t|
      t.string :title, null: false
      t.string :description
      t.datetime :deadline
      t.references :assigned_to
      t.references :project, foreign_key: true


      t.timestamps
    end
  end
end
