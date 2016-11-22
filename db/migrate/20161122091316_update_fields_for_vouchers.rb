class UpdateFieldsForVouchers < ActiveRecord::Migration[5.0]
  def change
    rename_column :vouchers, :date, :expired_at
    add_column :vouchers, :status, :string, :default => "active"
  end
end
