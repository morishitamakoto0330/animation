class AddViewerToAnimations < ActiveRecord::Migration
  def change
    add_column :animations, :viewer, :string
  end
end
