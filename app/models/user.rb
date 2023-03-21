class User < ApplicationRecord
  rolify
  has_secure_password
  after_create :assign_default_role

  def assign_default_role
    self.add_role(:reader) if self.roles.blank?
  end

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
  validates :password_digest, presence: true, length: { minimum: 8 }

  def editor?
    self.has_role? :editor
  end

  def get_role
    if self.has_role? :editor
      return :editor
    else
      return :reader
    end
  end

  def get_role_name
    case self.get_role
    when :editor
      return "Editor"
    when :reader
      return "Lector"
    end
  end

  def remove_roles
    self.remove_role :editor
    self.remove_role :reader
  end
end
