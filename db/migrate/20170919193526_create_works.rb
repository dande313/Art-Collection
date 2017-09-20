class CreateWorks < ActiveRecord::Migration[5.1]
  def change
  	  create_table :works do |t|
   	   t.string :title
   	   t.string :artist
   	   t.integer :year
   	   t.string :medium
       t.text :description
       t.integer :user_id
   	end
  end
end