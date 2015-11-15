class CreateModels < ActiveRecord::Migration
  def change
    create_table :models do |t|
      t.string :post
      t.text :message

      t.timestamps null: false
    end
  end
end
