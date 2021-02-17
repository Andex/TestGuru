class CreateBadgeTestPassagesTable < ActiveRecord::Migration[6.1]
  def change
    create_table :badges_test_passages do |t|
      t.references :test_passage, null: false, foreign_key: true
      t.references :badge, null: false, foreign_key: true

      t.timestamps
    end
  end
end
