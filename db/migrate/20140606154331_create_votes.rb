class CreateVotes < ActiveRecord::Migration
  def up
    create_table :votes do |t|
      t.references :voteable, polymorphic: true
      t.belongs_to :user
      t.integer :value
      t.timestamps
    end
  end

  def down
    drop_table :votes
  end
end
