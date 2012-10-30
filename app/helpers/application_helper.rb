module ApplicationHelper
  def mark_required(object, attribute)
    "*" if object.class.validators_on(attribute).map(&:class).include? ActiveModel::Validations::PresenceValidator
  end

  def registration_text
    return t(:registration) if Settings.registration_opened
    return t(:request_invite)
  end
end