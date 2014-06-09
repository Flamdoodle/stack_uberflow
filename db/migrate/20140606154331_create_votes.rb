class CreateVotes < ActiveRecord::Migration
  def up
    create_table :votes do |t|
      t.references :voteable, polymorphic: true
      t.belongs_to :user, null: false
      t.integer :vote_value, null: false
      t.timestamps
    end
  end

  def down
    drop_table :votes
  end
end
