class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  # allow_browser versions: :modern  # 임시로 비활성화
  
  helper_method :current_user, :logged_in?

  private

  def current_user
    return @current_user if defined?(@current_user)
    
    @current_user = if session[:user_id]
      begin
        User.find(session[:user_id])
      rescue ActiveRecord::RecordNotFound
        session[:user_id] = nil  # 잘못된 세션 정리
        nil
      end
    else
      nil
    end
  end

  def logged_in?
    !!current_user
  end

  def require_login
    unless logged_in?
      redirect_to login_path, alert: '로그인이 필요합니다.'
    end
  end
end
