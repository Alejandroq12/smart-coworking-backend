class AddAdditionalConstraints < ActiveRecord::Migration[7.1]
  def change
    # Add NOT NULL constraints
    change_column_null :workspaces, :model, false
    change_column_null :workspaces, :address, false
    change_column_null :countries, :abbrev, false
    change_column_null :states, :abbrev, false

    # Add unique indexes Example: country abbrev unique?
    add_index :countries, :abbrev, unique: true
    add_index :states, [:country_id, :abbrev], unique: true
  end
end
