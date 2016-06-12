class CreateAnimations < ActiveRecord::Migration
  def change
    create_table :animations do |t|
      t.string :title
      t.string :day

      t.timestamps null: false
    end
  end
end
