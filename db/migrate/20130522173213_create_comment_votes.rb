class CreateCommentVotes < ActiveRecord::Migration
  def change
    create_table :commentvotes do |c|
      c.integer :comment_id
      c.integer :user_id
      c.integer :votes
    end
  end
end
