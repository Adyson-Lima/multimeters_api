class CreateMultimeters < ActiveRecord::Migration[7.0]
  def change
    create_table :multimeters do |t|
      t.string :mult_type
      t.string :description

      t.timestamps
    end
  end
end
