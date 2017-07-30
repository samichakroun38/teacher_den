class CollesController < ApplicationController
  def show
    documents
  end

  private

  def documents
    @documents ||= Document.colles
  end
end
