class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable

  enum role: { free:       0,
               paid:       1,
               overdue:    2,
               admin:      3,
               superadmin: 4 }

  after_initialize :set_role, if: :new_record?

  def set_role
    self.role ||= :free
  end

  def is_free?
    return true if self.free? || self.is_paid?
  end

  def is_paid?
    return true if self.paid? || self.overdue? || self.is_admin?
  end

  def is_admin?
    return true if self.admin? || self.is_superadmin?
  end

  def is_superadmin?
    return true if self.superadmin?
  end
end
