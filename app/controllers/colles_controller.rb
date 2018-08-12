class CollesController < ApplicationController
  def show
    documents
  end

  private

  def documents
    @documents ||= Document.joins(:category).where(categories: { label: "colles" })
  end
end
