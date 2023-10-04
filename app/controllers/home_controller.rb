class HomeController < ApplicationController
  def about
  end
  def feed
    @posts = Post.all.reverse
  end  
end
