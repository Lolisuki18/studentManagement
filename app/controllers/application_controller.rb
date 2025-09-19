class ApplicationController < ActionController::Base
  include Authentication
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern


    around_action :switch_locale

  def switch_locale(&action)
    locale = params[:locale] || I18n.default_locale
    I18n.with_locale(locale, &action)
  end

  #ta có Rails tự động bật CSRF protection
  #nếu muốn tắt thì dùng dòng dưới
  # Thêm dòng này để disable CSRF cho API
  protect_from_forgery with: :null_session
end
