class User::DownloadsController < User::UserController
  def show
    documents
  end

  private

  def documents
    @documents ||= Document.where.not(category: :colles)
  end
end
