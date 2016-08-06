class AddCommentToBooks < ActiveRecord::Migration
  def change
    add_column :books, :commets, :string
  end
end
