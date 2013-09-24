class CreateEntries < ActiveRecord::Migration
  def change
    execute 'CREATE EXTENSION IF NOT EXISTS hstore'

    create_table :entries do |t|
      t.hstore :responses
      t.text :responses_text

      t.timestamps
    end
  end
end