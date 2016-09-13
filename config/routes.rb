Rails.application.routes.draw do

  namespace :imes do
    resources :qh_bdbhs
  end
  namespace :imes do

    resources :d238hs do
      post :str_qhlc, on: :collection
      post :tooling, on: :collection
      get :print, on: :collection
    end

    resources :file_uploaders do
      post :bd_file_upload, on: :collection
    end

    resources :d034hs do
      get :get_vbeln, on: :collection
      post :str_qhlc, on: :collection
      get :create_d034m, on: :collection
      get :destroy_d034m, on: :collection
    end

    resources :qh_bdlcs
    resources :d400hs

    resources :d089hs do
      get :delete_d089l, on: :collection
    end

    resources :d031hs do
      get :delete_d031l, on: :collection
    end

    resources :d301hs
    resources :d272hs
    resources :d888hs
    resources :d189hs
    resources :q001hs
    resources :d300hs
    resources :d600hs
    resources :d302hs
  end

  resources :selects do
    get :user, on: :collection
  end

  resources :ajaxs do
    get :download_imes_file, on: :collection
    post :upload_imes_file, on: :collection
  end

  resources :reimbursements


  root to: 'imes/qh_bdlcs#index' #首頁

  devise_for :users

  resources :users do
    get :autocomplete_user_email, :on => :collection
  end

end
