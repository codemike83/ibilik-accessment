class CreatePosts < ActiveRecord::Migration
	def change
		create_table :posts do |p|
			p.integer :user_id
			p.string :post_title
			p.string :post_body

			p.timestamps null: false
		end
	end
end
