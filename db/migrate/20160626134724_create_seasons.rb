class CreateSeasons < ActiveRecord::Migration
  def change
    create_table :seasons do |t|
      t.string :season

      t.timestamps null: false
    end
  end
end
