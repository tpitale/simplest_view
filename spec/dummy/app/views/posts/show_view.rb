class Posts::ShowView < ActionView::Base
  @post = Post.find(params[:id])
end