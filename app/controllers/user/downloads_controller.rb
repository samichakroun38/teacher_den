class User::DownloadsController < User::UserController
  def show
    documents
  end

  private

  def documents
    @documents ||= Document.joins(:category).where.not(categories: { label: "colles" })
  end
end
