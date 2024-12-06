class RenameSpaceCwsToWorkspaces < ActiveRecord::Migration[7.1]
  def change
    rename_table :space_cws, :workspaces
    rename_column :reservations, :space_cw_id, :workspace_id
  end
end
