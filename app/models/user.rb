class User < ActiveRecord::Base
  ROLES = %w[admin bronze silver gold]

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :account, :dependent => :destroy, autosave: true, inverse_of: :user

  has_many :subscriptions, :dependent => :destroy

  accepts_nested_attributes_for :account
end
