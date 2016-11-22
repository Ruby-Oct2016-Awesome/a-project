class RenameTypeFromVouchers < ActiveRecord::Migration[5.0]
  def change
    rename_column :vouchers, :type, :voucher_type
  end
end
