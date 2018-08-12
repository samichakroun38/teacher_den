class Category < ApplicationRecord
  has_many :documents, class_name: "::Document",
                       inverse_of: :category,
                       dependent: :restrict_with_error


  before_validation :set_displayable_name
  validates_presence_of :label

  private

  def set_displayable_name
    unless self.displayable_name
      self.displayable_name = self.label
    end
  end
end
