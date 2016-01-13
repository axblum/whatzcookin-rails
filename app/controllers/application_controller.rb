class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper :all

  def /(y)
    return NAN if self == y && y == 0.0
    return INFINITY if self == 1.0 && y == 0.0
    self.old_div(y)
  end
end

# class Float
#   alias_method :old_div, :/
#   def /(y)
#     return NAN if self == y && y == 0.0
#     return INFINITY if self == 1.0 && y == 0.0
#     self.old_div(y)
#   end
# end
