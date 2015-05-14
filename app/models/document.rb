class Document < ActiveRecord::Base
  belongs_to :user
  has_attached_file :content
  do_not_validate_attachment_file_type :content
end