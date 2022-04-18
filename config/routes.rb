Rails.application.routes.draw do

  devise_for :users,
    controllers: {
        sessions: 'users/sessions',
        registrations: 'users/registrations'
    }
  get '/member-data', to: 'users#show'

  patch '/profile-photo/:id', to: 'users#add_profile_photo'
  
  post '/new-gallery', to: 'galleries#new_gallery'
  patch '/gallery/:id', to: 'galleries#update'
  get '/user-galleries', to: 'galleries#user_galleries'
  get '/gallery/:id', to: 'galleries#show'
  
  get '/share/:id', to: 'share#show'
  
  post '/new-block/', to: 'blocks#new_block'  
  get '/gallery/:id/blocks', to: 'blocks#gallery_blocks'

    # POST => gallery#create /new-gallery create new gallery
    # POST => gallery#block-builder /new-gallery/id/block-builder/
end