class AddAvatarToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :avatar, :string, :default => "http://vignette4.wikia.nocookie.net/dragcave/images/6/6e/No_avatar.jpg/revision/latest?cb=20140427211725"
  end
end
