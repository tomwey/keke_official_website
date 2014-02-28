class CreateApps < ActiveRecord::Migration
  def change
    create_table :apps do |t|
      t.string :name                        # app名字
      t.text :intro                         # app简介
      t.string :icon                        # app图标
      t.integer :app_type, :default => 0        # app类型，0表示应用，1表示游戏
      t.string :version, :default => '1.0'  # app当前版本号
      t.string :app_key                     # app唯一标识
      t.integer :os_type, :default => 0     # app操作系统类型，0表示iOS, 1表示Android, 暂时支持两种操作系统
      t.string :app_url                     # app发布平台的下载地址
      t.date :published_at                  # app发布时间, 例如：2013-02-13

      t.timestamps
    end
    add_index :apps, :app_type
    add_index :apps, :app_key, :unique => true
    add_index :apps, :os_type
    add_index :apps, :published_at
  end
end
