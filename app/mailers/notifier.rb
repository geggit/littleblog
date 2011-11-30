class Notifier < ActionMailer::Base
  default :from => "Little Blog"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.email_friend.subject
  #
  def email_friend(article, sender_name, receiver_email)
    @article = article
    @sender_name = sender_name

    attachments["rryp.png"] = File.read(Rails.root.join("public/images/rryp.png"))
    mail :to => receiver_email, :subject => "Interesting Article"
  end
  
  def comment_added(comment)
    @article = comment.article
    mail :to => @article.user.email, :subject => "New comment for '#{@article.title}'"
  end
end
