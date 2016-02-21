class User < ActiveRecord::Base
  enum role: [:free, :paid, :overdue, :admin, :superadmin]
  after_initialize :set_role, if: :new_record?

  def set_role
    self.role ||= :user_free
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable
end
