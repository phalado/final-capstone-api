class CreateFlyClasses < ActiveRecord::Migration[6.0]
  def change
    create_table :fly_classes do |t|
      t.string :name
      t.datetime :classTime
      t.string :instructor
      t.string :status

      t.timestamps
    end
  end
end
