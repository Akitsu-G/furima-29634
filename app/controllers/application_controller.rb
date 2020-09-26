class ApplicationController < ActionController::Base
  # Basic認証起動
  before_action :basic_auth
  # devise
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  # 登録時 送信パラメーター制限(ログイン時はデフォルト)
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(
      :sign_up, keys:
      [:nickname,
       :first_name,
       :last_name,
       :first_name_kana,
       :last_name_kana,
       :birth]
    )
  end

  private

  # Basic認証メソッド
  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['BASIC_AUTH_USER'] && password == ENV['BASIC_AUTH_PASSWORD']
    end
  end
end
