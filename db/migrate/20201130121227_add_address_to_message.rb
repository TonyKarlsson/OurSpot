class AddAddressToMessage < ActiveRecord::Migration[6.0]
  def change
    add_column :messages, :address, :string
  end
end
