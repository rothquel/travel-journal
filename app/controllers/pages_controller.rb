class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :explore ]

  def home
  end

  def explore
    @posts = Post.all
    @markers = @posts.geocoded.map do |post|
      {
        lat: post.latitude,
        lng: post.longitude,
        info_window: render_to_string(partial: "info_window", locals: {post: post})
      }
    end
  end
end
