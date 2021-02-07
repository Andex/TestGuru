class CreateBadgeUsersTable < ActiveRecord::Migration[6.1]
  def change
    create_table :badge_users_tables do |t|
      t.references :user, null: false, foreign_key: true
      t.references :badge, null: false, foreign_key: true

      t.timestamps
    end
  end
end
