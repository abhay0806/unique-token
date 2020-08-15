class AddStartTimeToTokens < ActiveRecord::Migration[6.0]
  def change
    add_column :tokens, :start_time, :timestamps
  end
end
