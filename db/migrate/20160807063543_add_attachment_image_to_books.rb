class AddAttachmentImageToBooks < ActiveRecord::Migration
  def change
  	def self.up
  		add_attachment :books, :image
  	end
  	def self.down
  		remove_attachment :books, :image
  	end
  end
end
