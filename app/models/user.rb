class User < ActiveRecord::Base
  enum role: [:guest, :bronze, :silver, :gold, :admin]

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :account, :dependent => :destroy
  has_one :site, :dependent => :destroy
  has_many :subscriptions, :dependent => :destroy

  accepts_nested_attributes_for :account
  accepts_nested_attributes_for :site

  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :bronze
  end
end
