class Document < ApplicationRecord
  has_secure_token
  default_scope { order(created_at: :desc) }

  enum category: [:colles, :info, :devoirs, :corrections]

  has_attached_file :file,
    url: "/system/:class/:token/:style/:filename",
    path: ":rails_root/public:url"
  validates_attachment_content_type :file, content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif", "application/pdf"]

  Paperclip.interpolates :token do |attachment, style|
    attachment.instance.token
  end
end
