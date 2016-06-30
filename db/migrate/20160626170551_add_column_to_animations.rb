class AddColumnToAnimations < ActiveRecord::Migration
  def change
    add_column :animations, :ad, :integer
    add_column :animations, :season, :string
    add_column :animations, :finished, :bool
  end
end
