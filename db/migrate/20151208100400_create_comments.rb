class CreateComments < ActiveRecord::Migration
	def change
		create_table :comments do |c|
			c.integer :user_id
			c.integer :post_id
			c.string :comment_body

			c.timestamps null: false
		end
	end
end
