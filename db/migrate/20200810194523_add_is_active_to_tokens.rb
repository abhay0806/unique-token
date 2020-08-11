class AddIsActiveToTokens < ActiveRecord::Migration[6.0]
  def change
    add_column :tokens, :is_active, :boolean, default: true
  end
end
