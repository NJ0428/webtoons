class UsersController < ApplicationController
  # before_action :require_login, only: [:show, :edit, :update, :profile_history, :rollback_profile]  # 임시로 비활성화

  def new
    puts "=== Users#new action called ==="
    @user = User.new
    puts "=== @user created: #{@user.inspect} ==="
    Rails.logger.info "Users#new action called - @user created: #{@user.inspect}"
  end

  def create
    @user = User.new(user_params.except(:name, :nickname, :phone, :birth_date, :gender, :profile_image, :bio))
    
    if @user.save
      # 초기 프로필 생성
      profile_result = @user.update_profile(
        user_params.slice(:name, :nickname, :phone, :birth_date, :gender, :profile_image, :bio),
        change_reason: "회원가입 시 초기 프로필 생성",
        changed_by: 'user'
      )
      
      if profile_result.persisted?
        session[:user_id] = @user.id
        redirect_to root_path, notice: '회원가입이 완료되었습니다.'
      else
        @user.errors.merge!(profile_result.errors)
        render :new, status: :unprocessable_entity
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @user = current_user
    
    # 로그인하지 않은 경우 테스트 사용자로 대체 (개발용)
    if @user.nil?
      @user = User.first || User.new(
        email: "test@example.com"
      )
      # 테스트 사용자의 프로필 생성
      if @user.persisted? && @user.user_profiles.empty?
        @user.update_profile({
          name: "김웹툰",
          nickname: "webtoon_creator",
          phone: "010-1234-5678",
          birth_date: Date.new(1990, 5, 15),
          gender: "male",
          bio: "웹툰을 사랑하는 크리에이터입니다."
        }, change_reason: "테스트 프로필 생성", changed_by: 'system')
      end
    end
    
    @current_profile = @user.current_profile
  end

  def edit
    @user = current_user
    @current_profile = @user.current_profile
  end

  def update
    @user = current_user
    @current_profile = @user.current_profile
    
    profile_result = @user.update_profile(
      profile_params,
      change_reason: params[:change_reason],
      changed_by: 'user'
    )
    
    if profile_result.persisted?
      redirect_to user_path(@user), notice: '프로필이 성공적으로 업데이트되었습니다.'
    else
      @current_profile = profile_result
      render :edit, status: :unprocessable_entity
    end
  end

  def profile_history
    @user = current_user
    @profiles = @user.profile_history.includes(:user)
  end

  def rollback_profile
    @user = current_user
    version = params[:version].to_i
    
    result = @user.rollback_profile_to(version, change_reason: "사용자 요청으로 버전 #{version}으로 롤백")
    
    if result&.persisted?
      redirect_to user_path(@user), notice: "프로필이 버전 #{version}으로 롤백되었습니다."
    else
      redirect_to profile_history_user_path(@user), alert: "프로필 롤백에 실패했습니다."
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

  def profile_params
    params.require(:user).permit(:name, :nickname, :phone, :birth_date, :gender, :profile_image, :bio)
  end
end
