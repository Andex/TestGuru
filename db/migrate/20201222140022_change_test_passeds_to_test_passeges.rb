class ChangeTestPassedsToTestPasseges < ActiveRecord::Migration[6.1]
  def change
    rename_table :test_passeds, :test_passages
  end
end
