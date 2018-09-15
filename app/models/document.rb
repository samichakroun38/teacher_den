class Document < ApplicationRecord
  attr_accessor :category_label

  has_secure_token
  default_scope { order(created_at: :desc) }

  belongs_to :category, class_name: "::Category",
                        inverse_of: :documents,
                        optional: false

  has_attached_file :file,
    url: "/system/:class/:token/:style/:filename",
    path: ":rails_root/public:url"
  # validates_attachment_content_type :file, content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif", "application/pdf"]

  Paperclip.interpolates :token do |attachment, style|
    attachment.instance.token
  end

  before_validation :set_category

  private

  def set_category
    if !category && category_label
      self.category = Category.find_by_label(category_label)
    end
  end
end
