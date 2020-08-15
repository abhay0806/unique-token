Rails.application.routes.draw do

	resources :tokens, only: [] do
    collection do
      delete :destroy
      delete :deactivate
      post :reactivate
      post :send_generate_token
      post :delete_token
    end
  end
end
