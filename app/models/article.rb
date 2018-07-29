class Article < ApplicationRecord
  belongs_to :parent, class_name: "::Article", optional: lambda { |a| a.main? }
  has_many :sub_articles, class_name: "::Article", foreign_key: :parent_id

  validates_presence_of :title
  validate :no_sub_parent

  enum status: [:unpublished, :published, :expired]

  private

  def no_sub_parent
    if self.parent && self.parent.parent
      errors.add(:base, " cannot be child of child article")
    end
  end
end
