class AddColumnCommenterIdToComment < ActiveRecord::Migration[5.0]
  def change
    add_column :comments, :commenter_id, :integer
  end
end
