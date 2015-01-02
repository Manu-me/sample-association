class CreateCandies < ActiveRecord::Migration
  def change
    create_table :candies do |t|
      t.string :name
      t.references :kid, index: true

      t.timestamps
    end
  end
end
