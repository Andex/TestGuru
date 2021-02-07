class CreateBadgeTestPassagesTable < ActiveRecord::Migration[6.1]
  def change
    create_table :badge_test_passages_tables do |t|
      t.references :test_passages, null: false, foreign_key: true
      t.references :badge, null: false, foreign_key: true

      t.timestamps
    end
  end
end
