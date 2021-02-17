class CreateBadgeUsersTable < ActiveRecord::Migration[6.1]
  def change
    create_table :badges_users do |t|
      t.references :user, null: false, foreign_key: true
      t.references :badge, null: false, foreign_key: true

      t.timestamps
    end
  end
end
