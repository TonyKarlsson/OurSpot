class RemoveAddressFromMessage < ActiveRecord::Migration[6.0]
  def change
    remove_column :messages, :Address, :string
  end
end
