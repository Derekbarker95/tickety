class AddStatusToSupport < ActiveRecord::Migration
  def change
    add_column :supports, :status, :boolean
  end
end
