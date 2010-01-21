class AddLengthToSlideBody < ActiveRecord::Migration
  def self.up
    change_column :slides, :body, :string, :limit => 4096
  end

  def self.down
  end
end
