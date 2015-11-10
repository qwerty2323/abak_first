AbakFirst::Application.routes.draw do
  get "pages/index"

  get "pages/show"

  get "pages/new"

  get "pages/new_root"

  get "pages/create"

  get "pages/create_root"

  get "pages/edit"

  get "pages/update"

  root to: 'pages#index'
end
