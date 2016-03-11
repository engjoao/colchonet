class User < ActiveRecord::Base
	has_many :rooms, dependent: :destroy
	has_many :reviews, dependent: :destroy
	has_many :reviewed_rooms, through: :reviews, source: :room

	scope :confirmed, -> {where(confirmed_at: nil)}

	validates_presence_of :email, :full_name, :location
	validates_length_of :bio, :minimum => 30, :allow_blank => false
	validates_format_of :email, :with => /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/
	validates_uniqueness_of :email

	has_secure_password

	before_create :generate_token

	def generate_token
	  self.confirmation_token = SecureRandom.urlsafe_base64
	end

	def confirm!
	  return if confirmed?

	  self.confirmed_at = Time.current
	  self.confirmation_token = ''
	  save!
	end

	def confirmed?
	  confirmed_at.present?
	end


  	def self.authenticate(email, password)
      user = confirmed.
      find_by_email(email).
      try(:authenticate, password)
 	end
end
