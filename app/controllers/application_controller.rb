class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper :all

  def /(y)
    return NAN if self == y && y == 0.0
    return INFINITY if self == 1.0 && y == 0.0
    self.old_div(y)
  end
end
