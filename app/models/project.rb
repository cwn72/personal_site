class Project < ActiveRecord::Base
  belongs_to :resume

  has_attached_file :image, :styles => { :thumbnail => '200x200>'}

  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  do_not_validate_attachment_file_type :image

  validates_presence_of :name, :link
end
