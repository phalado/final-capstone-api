class ModifyFlyClassTable < ActiveRecord::Migration[6.0]
  def change
    add_column :instructors, :instImage, :string
    add_column :instructors, :dragonImage, :string
    remove_column :fly_classes, :name, :string
    add_reference :fly_classes, :user, foreign_key: true
  end
end
