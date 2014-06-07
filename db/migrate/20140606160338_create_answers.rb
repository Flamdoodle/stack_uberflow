class CreateAnswers < ActiveRecord::Migration
  def up
    create_table :answers do |t|
      t.belongs_to :answerer
      t.belongs_to :question
      t.text :body
      t.timestamps
    end
  end

  def down
    drop_table :answers
  end
end
