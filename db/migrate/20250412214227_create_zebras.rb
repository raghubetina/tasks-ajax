class CreateZebras < ActiveRecord::Migration[8.0]
  def change
    create_table :zebras do |t|
      t.string :name

      t.timestamps
    end
  end
end
