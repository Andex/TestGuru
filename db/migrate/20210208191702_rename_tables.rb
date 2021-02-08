class RenameTables < ActiveRecord::Migration[6.1]
  def change
    rename_table :badge_users_tables, :badges_users
    rename_table :badge_test_passages_tables, :badge_test_passages
  end
end
