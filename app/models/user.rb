class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         has_one(:information)
         has_many(:posts)
         has_many(:articles)
         acts_as_mappable
         acts_as_messageable
         acts_as_follower
         acts_as_followable
         geocoded_by :address, :latitude  => :lat, :longitude => :lng
         after_validation :geocode
         has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
         validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/ 

	def address
		[street, city, state].compact.join(', ')
	end

  def user_image_url
    self.avatar.url(:medium)
  end

  def count_followers
    self.followers_count
  end

  def mailboxer_name
    self.first_name
  end

  def mailboxer_email(object)
    self.email
  end
end
