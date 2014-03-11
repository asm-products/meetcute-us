class User < ActiveRecord::Base
  ROLES = %w[admin bronze silver gold]

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :account, :dependent => :destroy
  has_many :subscriptions, :dependent => :destroy

  accepts_nested_attributes_for :account

  after_create :create_user_account

  def create_user_account
    Account.create :user_id => self.id
  end
end
