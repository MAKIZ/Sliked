# Sliked
A simple microblogging app that will show if the users and their posts are like or dislike by the community.

[screenshot coming soon]

#### Description

A web application that allows users to post short messages that can be shared with other social media platform. It's main goal is to incourage users to post good quality contents. The most like or disliked will be on top rank of that category.

### List of Technoligies use
- HTML
- CSS
- Javascript
- Bootstrap
- Ruby on Rails

### Code Snippet
database - Active Record
```rb

  create_table "posts", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "postimage_file_name"
    t.string "postimage_content_type"
    t.integer "postimage_file_size"
    t.datetime "postimage_updated_at"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end
```
The Model 
```rb
class Post < ApplicationRecord
  validates_presence_of :name, :description
  belongs_to :user

  has_attached_file :postimage, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :postimage, content_type: /\Aimage\/.*\z/
end

```

The View
```rb
<div class="container pt-5">
  <div class="card-columns">
    <% @posts.each do |post| %>
    <div class="card">
      <%= image_tag post.postimage.url, class: "img-fluid d-block mx-auto" %>
      <div class="card-body">
        <%= link_to  "#{post.name}", post, class: "card-title" %>
        <p class="card-text"><%= post.description %></p>
        <hr>
        <small><%= link_to post.user.name, user_path(post.user.id) %></small>
      </div>
    </div>
    <% end %>
  </div>
</div>
```

The Controller
```rb
 def new
    @post = Post.new
  end

  def create
    @post = Post.new(create_params)
    @post.user = current_user

    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to @post
    else
      redirect_back fallback_location: edit_post_path(@post)
    end
  end
```



My Stretch Goals
- Update the User Experience
- Update the User Interface
- show how many like and dislikes by post and by user
- able to share on other social media platform
- Host upload images in a different server
