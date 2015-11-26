class CreateDynamicfieldsDynamicfields < ActiveRecord::Migration

  def up
    create_table :dynamicfields do |t|
      t.string :criteria, :default => "page_layout"
      t.string :page_layout
      t.string :page_id
      t.string :model_title
      t.integer :position

      t.timestamps
    end

    create_table :dynamicform_fields do |t|
      t.integer :dynamicfield_id
      t.string :field_id
      t.string :field_label
      t.string :field_type
      t.integer :position
      t.timestamps
    end

    create_table :dynamicform_associations do |t|
      t.integer :dynamicfield_id
      t.integer :page_id
    end

    create_table :dynamicform_values do |t|

      t.integer :dynamicform_field_id
      t.integer :dynamicform_association_id

      t.text :text_value
      t.integer :resource_id
      t.integer :image_id
      t.string :string_value
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-dynamicfields"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/dynamicfields/dynamicfields"})
    end

    drop_table :dynamicfields
    drop_table :dynamicform_fields
    drop_table :dynamicform_values
    drop_table :dynamicform_associations

  end

end
