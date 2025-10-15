class CreateNotes < ActiveRecord::Migration[8.0]
  def change
    enable_extension "vector" unless extension_enabled?("vector")

    create_table :notes do |t|
      t.text :content, null: false
      t.column :embedding, :vector, limit: 1536 # vector column with 1536 dimensions
      t.timestamps
    end  
  end
end
