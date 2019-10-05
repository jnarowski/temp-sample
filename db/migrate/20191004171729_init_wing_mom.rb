class InitWingMom < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string
    add_column :users, :phone, :string
    add_column :users, :address_street, :string
    add_column :users, :address_city, :string
    add_column :users, :address_state, :string
    add_column :users, :address_zip, :string
    add_column :users, :stripe_customer_id, :string
    add_column :users, :stripe_source_id, :string

    create_table :bookings do |t|
      t.references :service_item
      t.date       :booked_at
      t.datetime   :perform_at
      t.string     :state
      t.string     :payment_state
      t.text       :notes
      t.references :user
    end

    create_table :services do |t|
      t.string :name
      t.string :state, default: 'active'
    end

    create_table :service_items do |t|
      t.string  :name
      t.text    :description
      t.decimal :price, precision: 8, scale: 2
    end
  end
end
