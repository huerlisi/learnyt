class EMailsController < AuthorizedController
  def new
    @e_mail = EMail.new(:sender => current_user)
    new!
  end
end