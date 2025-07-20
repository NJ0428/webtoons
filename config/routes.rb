Rails.application.routes.draw do
  root "webtoons#index"
  get "/webtoon", to: "webtoons#webtoon"
  get "/webtoon/list", to: "webtoons#webtoon_list"
  get "/webtoon/detail", to: "webtoons#webtoon_detail"
  get "/api/webtoons/by_day/:day", to: "webtoons#by_day"
  get "/api/webtoons/trending", to: "webtoons#trending"
  
  # 사용자 인증 관련 라우트
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get "/signup", to: "users#new"
  post "/signup", to: "users#create"
  get "/profile", to: "users#show"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end
