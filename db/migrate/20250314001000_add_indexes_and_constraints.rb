class AddIndexesAndConstraints < ActiveRecord::Migration[7.1]
  def change
    # Add any unique constraints or not null constraints
    # For example, I ensure that 'users.email' is not null (already done by Devise)
    change_column_null :workspaces, :name, false
    change_column_null :workspaces, :description, false
    change_column_null :users, :email, false

    # Adding a default price or discount:
    change_column_default :workspaces, :price, from: nil, to: 0.0
    change_column_default :workspaces, :discount, from: nil, to: 0.0
  end
end
