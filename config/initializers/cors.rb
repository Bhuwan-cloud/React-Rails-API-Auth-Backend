Rails.application.config.middleware.insert_before 0, Rack::Cors do

    allow do
        origins "http://localhost:3000"
        resource "*", 
        headers: :any,
        methods: [:get, :post, :put, :delete, :option, :head]
        credentials: true
    end 

    allow do
        origins "https://react-rails-auth.herokuapp.com"
        resource "*",
        headers: :any,
        methods: [:get, :post, :put, :delete, :option, :head]
        credentials: true
    end 
end 