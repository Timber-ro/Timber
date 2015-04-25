class AddAttachmentProfilePictureToContractors < ActiveRecord::Migration
  def self.up
    change_table :contractors do |t|
      t.attachment :profile_picture
    end
  end

  def self.down
    remove_attachment :contractors, :profile_picture
  end
end
