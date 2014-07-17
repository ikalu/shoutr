class MakeShoutsPolymorphic < ActiveRecord::Migration
  class Shout < ActiveRecord::Base 

  end

  class TextShout < ActiveRecord::Base

  end

  def change
    create_table :text_shouts do |t|
      t.string :body
      t.timestamps
    end

    add_column :shouts, :body_type, :string
    add_column :shouts, :body_id, :integer

    Shout.all.each do |shout|
      text_shout = TextShout.create!(body: shout.body)
      shout.update!(body_type: "TextShout", body_id: text_shout.id)
    end

    remove_column :shouts, :body
  end
end
