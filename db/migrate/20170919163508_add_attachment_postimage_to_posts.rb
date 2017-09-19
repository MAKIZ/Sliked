class AddAttachmentPostimageToPosts < ActiveRecord::Migration[5.1]
  def self.up
    change_table :posts do |t|
      t.attachment :postimage
    end
  end

  def self.down
    remove_attachment :posts, :postimage
  end
end
