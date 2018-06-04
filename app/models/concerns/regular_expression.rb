module RegularExpression
  extend ActiveSupport::Concern
  MAIL_REGEX = /\A[a-zA-Z0-9_\#!$%&`'*+\-{|}~^\/=?\.]+@[a-zA-Z0-9][a-zA-Z0-9\.-]+\z/
  TELL_REGEX = /0\d{1,4}-\d{1,4}-\d{4}/
end
