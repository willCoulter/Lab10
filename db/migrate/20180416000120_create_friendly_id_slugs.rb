class CreateFriendlyIdSlugs < ActiveRecord::Migration[5.1]
  def change
    create_table :friendly_id_slugs do |t|
      t.string   :slug,           :null => false
      t.integer  :sluggable_id,   :null => false
      t.string   :sluggable_type, :limit => 50
      t.string   :scope
      t.datetime :created_at
    end
    add_index :friendly_id_slugs, :sluggable_id
    add_index :friendly_id_slugs, [:slug, :sluggable_type]
    add_index :friendly_id_slugs, [:slug, :sluggable_type, :scope], :unique => true
    add_index :friendly_id_slugs, :sluggable_type

    add_column :articles, :uuid, :string, unique: true, index: true
    add_column :articles, :slug, :string, unique: true, index: true

    add_column :comments, :uuid, :string, unique: true, index: true
    add_column :comments, :slug, :string, unique: true, index: true

    Article.all.each do |article|
      uuid = SecureRandom.uuid
      article.update_column(:uuid, uuid)
      article.update_column(:slug, uuid)
    end

    Comment.all.each do |comment|
      uuid = SecureRandom.uuid
      comment.update_column(:uuid, uuid)
      comment.update_column(:slug, uuid)
    end

  end
end
