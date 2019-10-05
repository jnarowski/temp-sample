class AddServiceId < ActiveRecord::Migration[6.0]
  def change
    add_column :service_items, :service_id, :integer
  end
end
