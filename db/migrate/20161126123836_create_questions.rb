class CreateQuestions < ActiveRecord::Migration
  def change
  	create_table :questions do |t|
      t.integer :user_id
      t.string :title
      t.string :question, :null => false
      t.integer :answer_id #for best answer

      t.timestamps null: false
    end
  end
end
