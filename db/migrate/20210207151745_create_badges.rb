class CreateBadges < ActiveRecord::Migration[6.1]
  def change
    create_table :badges do |t|
      t.string :name, null: false
      t.string :picture, null: false
      t.string :rule_name, null: false
      t.string :parameter, null: false

      t.timestamps
    end
  end
end
