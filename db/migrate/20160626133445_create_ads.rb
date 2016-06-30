class CreateAds < ActiveRecord::Migration
  def change
    create_table :ads do |t|
      t.integer :ad

      t.timestamps null: false
    end
  end
end
