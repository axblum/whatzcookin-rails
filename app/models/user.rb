class User < ActiveRecord::Base

  has_many :cuisine_styles, through: :nutritional_profile
  has_many :excluded_ingredients, through: :nutritional_profile
  has_many :restrictions, through: :nutritional_profile
  has_one :nutritional_profile
  has_one :user_taste_profile

  devise :omniauthable
  validates_presence_of :email, :encrypted_password
  has_many :comments
  has_many :ratings
  has_many :favorites
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

 def self.find_for_google_oauth2(access_token, signed_in_resource=nil)
    data = access_token.info
    user = User.where(:provider => access_token.provider, :uid => access_token.uid ).first
    if user
      return user
    else
      registered_user = User.where(:email => access_token.info.email).first
      if registered_user
        return registered_user
      else
        user = User.create!(name: data['name'],
          provider:access_token.provider,
          email: data["email"],
          uid: access_token.uid ,
          password: Devise.friendly_token[0,20],
        )
      end
   end
  end

  def build_personalize_hash
    result = {}
    self.restrictions = restrictions
    restrictions.each do |restriction|
      if !result.has_key?(restriction.type)
        result[restriction.type] = [restriction.name]
      else
        result[restriction.type] << restriction.name
      end

    end
    if result.has_key?("ExcludedIngredient")
      result["ExcludeIngredients"] = result.delete("ExcludedIngredient")
    end
    if result.has_key?("DietaryRestriction")
      result["diet"] = result.delete("DietaryRestriction")
    end
    return result
  end


end
