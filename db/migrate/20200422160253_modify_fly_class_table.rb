class ModifyFlyClassTable < ActiveRecord::Migration[6.0]
  def change
    add_column :instructors, :inst_image, :string
    add_column :instructors, :dragon_image, :string
    remove_column :fly_classes, :name, :string
    add_reference :fly_classes, :user, foreign_key: true
  end
end
