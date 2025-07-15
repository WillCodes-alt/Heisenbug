class CreateJoinTableBugsComments < ActiveRecord::Migration[5.2]
  def change
    create_join_table :Bugs, :Comments do |t|
      # t.index [:bug_id, :comment_id]
      # t.index [:comment_id, :bug_id]
    end
  end
end
