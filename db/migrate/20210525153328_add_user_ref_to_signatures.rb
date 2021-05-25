class AddUserRefToSignatures < ActiveRecord::Migration[6.0]
  def change
    add_reference :signatures, :user, null: false, foreign_key: true
  end
end
