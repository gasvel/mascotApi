    json.id @posts.id
    json.title @posts.title
    json.body @posts.body
    json.user do
      json.id @posts.user.id
      json.name @posts.user.name
    end
