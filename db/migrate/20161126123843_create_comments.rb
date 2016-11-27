class CreateComments < ActiveRecord::Migration
  def change
  	create_table :comments do |t|
      t.integer :user_id
      t.string :comment, :null => false
      t.string :commentable_type
      t.integer :commentable_id, polymorphic: true

      t.timestamps null: false
    end
  end
end
