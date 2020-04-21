class CreateIntructors < ActiveRecord::Migration[6.0]
  def change
    create_table :intructors do |t|
      t.string :name
      t.string :dragonType
      t.string :dragonName

      t.timestamps
    end
  end
end
