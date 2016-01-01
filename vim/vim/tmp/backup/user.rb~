class User < ActiveRecord::Base
  before_validation :set_token, on: :create
  before_save :set_level

  validates :username, :token, uniqueness: true
  validates :url, :username, :name, :surname, :skype, :github, :phone, :vk, presence: true
  validates :url, format: { with: URI::regexp, message: 'Not valid URL' }
  validates :url, format: { with: /\A.*\.herokuapp\.com\z/,
                            message: 'Invalid url. Only herokuapp domains are allowed. Example domain:  http://pushckinrocks.herokuapp.com' }

  validates_with ConfirmRegistrationValidator, on: :create

  has_paper_trail

  scope :not_winners, -> { where(winner: false) }
  scope :rating, -> { order('rating desc') }

  def set_token
    self.token = SecureRandom.hex
  end

  def win?
    self.rating >= 800
  end

  def set_level
    # [0..99] => 1 etc
    self.level = [(self.rating || 0) / 100 + 1, 9].min
  end

end
