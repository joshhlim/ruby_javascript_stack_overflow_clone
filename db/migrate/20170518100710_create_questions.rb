class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title, null: false
      t.string :body, null: false
      t.integer :category_id
      t.integer :user_id

      t.timestamps
    end
  end
end
