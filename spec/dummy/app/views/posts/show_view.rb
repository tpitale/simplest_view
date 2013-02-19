class Posts::ShowView < ActionView::Base

  def zambies string
    string.gsub(/zambies/, 'ZAMBIES!!1')
  end

end