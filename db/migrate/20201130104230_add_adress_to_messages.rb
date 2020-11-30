class AddAdressToMessages < ActiveRecord::Migration[6.0]
  def change
    add_column :messages, :Address, :string
  end
end
