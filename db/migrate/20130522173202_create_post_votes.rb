class CreatePostVotes < ActiveRecord::Migration
  def change
    create_table :postvotes do |c|
      c.integer :votes
      c.integer :post_id
      c.integer :user_id
    end
  end
end
