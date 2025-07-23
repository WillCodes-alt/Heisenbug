class AddUsertypeToBugs < ActiveRecord::Migration[5.2]
  def change
    add_column :bugs, :usertype, :integer, default: 0
  end
end
