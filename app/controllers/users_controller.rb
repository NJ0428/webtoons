class UsersController < ApplicationController
  # before_action :require_login, only: [:show]  # 임시로 비활성화

  def new
    puts "=== Users#new action called ==="
    @user = User.new
    puts "=== @user created: #{@user.inspect} ==="
    Rails.logger.info "Users#new action called - @user created: #{@user.inspect}"
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: '회원가입이 완료되었습니다.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @user = current_user
    
    # 로그인하지 않은 경우 테스트 사용자로 대체 (개발용)
    if @user.nil?
      @user = User.first || User.new(
        name: "김웹툰",
        nickname: "webtoon_creator", 
        email: "test@example.com",
        phone: "010-1234-5678",
        birth_date: Date.new(1990, 5, 15),
        gender: "male",
        bio: "웹툰을 사랑하는 크리에이터입니다."
      )
    end
  end

  def test
    puts "=== Test action called ==="
    render plain: "테스트 페이지입니다. 이 페이지가 보인다면 Rails가 정상 작동합니다."
  end

  private

  def user_params
    params.require(:user).permit(:name, :nickname, :email, :password, :password_confirmation, 
                                 :phone, :birth_date, :gender, :profile_image, :bio)
  end
end
