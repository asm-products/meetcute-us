class User < ActiveRecord::Base
  enum role: [:guest, :bronze, :silver, :gold, :admin]

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :account, :dependent => :destroy
  has_one :site, :dependent => :destroy
  has_many :subscriptions, :dependent => :destroy

  accepts_nested_attributes_for :account
  accepts_nested_attributes_for :site

  def set_default_role
    self.role ||= :guest
  end
end
