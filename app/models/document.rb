class Document < ApplicationRecord

  enum category: [:colles, :info, :devoirs, :corrections]

  has_attached_file :file
  validates_attachment_content_type :file, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif", "application/pdf"]
end
