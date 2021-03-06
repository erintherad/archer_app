class Character < ActiveRecord::Base

	has_attached_file :photo, :styles => { :small => "200x200>" },
					  :url => "/photos/characters/:id/:style/:basename.:extension",
					  :path => ":rails_root/public/photos/characters/:id/:style/:basename.:extension"

	validates_attachment_presence :photo
	validates_attachment_size :photo, :less_than => 5.megabytes
	validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']				  
end
