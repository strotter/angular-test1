class CreateComments < ActiveRecord::Migration
  def up
    create_table :comments do |t|
      t.string :username
      t.string :comment
    end
  end

  def down
    drop_table :comments
  end
end
