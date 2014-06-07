class CreateQuestions < ActiveRecord::Migration
  def up
    create_table :questions do |t|
      t.belongs_to :asker
      t.string :title
      t.text :body
      t.timestamps
    end
  end

  def down
    drop_table :questions
  end
end
