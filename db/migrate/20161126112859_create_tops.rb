class CreateTops < ActiveRecord::Migration
  def change
    create_table :tops do |t|
      t.string :top1
      t.text :desc1
      t.string :top2
      t.text :desc2
      t.string :top3
      t.text :desc3
      t.string :top4
      t.text :desc4
      t.string :top5
      t.text :desc5
      t.boolean :ispublic
      t.string :iscategory
      t.references :user, index: true
      t.text :sources

      t.timestamps
    end
  end
end
