class RefactorReservationsWorkspaces < ActiveRecord::Migration[7.1]
  def change
    # Remove columns from reservations
    remove_column :reservations, :date_reserved, :date
    remove_column :reservations, :date_cancelled, :date
    remove_column :reservations, :city_id, :bigint

    # Add city_id to workspaces WITHOUT null constraint first
    add_column :workspaces, :city_id, :bigint, null: true
    add_index :workspaces, :city_id
    add_foreign_key :workspaces, :cities
  end
end
