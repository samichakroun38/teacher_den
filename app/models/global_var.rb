class GlobalVar < ApplicationRecord
  validates_presence_of :key, :value

  def self.with_key(key)
    self.find_by_key(key)&.value || "Missing value: #{key}"
  end
end
