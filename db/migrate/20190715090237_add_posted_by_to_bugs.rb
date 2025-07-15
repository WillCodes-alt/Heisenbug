class AddPostedByToBugs < ActiveRecord::Migration[5.2]
  def change
    add_reference :bugs, :posted_by

  end
end
