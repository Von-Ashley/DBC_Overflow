class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :user_id
      t.string :answer, :null => false

      t.timestamps
    end
  
end
  end
end