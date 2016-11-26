class CreateComments < ActiveRecord::Migration
  def change
  	create_table :comments do |t|
      t.integer :user_id
      t.string :comment, :null => false
      t.integer :commentable, polymorphic: true

      t.timestamps
    end
  end
end
