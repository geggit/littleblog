class CommentObserver < ActiveRecord::Observer
  def email_article_author
   puts "We will notify the author in Chapter 9"
  end
end
