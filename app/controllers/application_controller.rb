class ApplicationController < ActionController::Base
  helper_method :gv
  before_action :global_vars
  protect_from_forgery with: :exception

  def authenticate_any!
    if admin_signed_in?
      true
    else
      authenticate_user!
    end
  end

  private

  def gv(key)
    global_vars.find { |g| g.key == key }&.value
  end

  def global_vars
    @global_vars ||= GlobalVar.all
  end

  def markdown
    @markdown ||= Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, tables: true)
  end
end
