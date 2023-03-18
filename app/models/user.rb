class User < ApplicationRecord
  rolify
  has_secure_password
  after_create :assign_default_role

  def assign_default_role
    self.add_role(:anonymous) if self.roles.blank?
  end

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
  validates :password_digest, presence: true, length: { minimum: 8 }

  def editor?
    self.has_role? :editor
  end

  def reader?
    self.has_role? :reader
  end

  def get_role
    if self.has_role? :editor
      return :editor
    elsif self.has_role? :reader
      return :reader
    else
      return :anonymous
    end
  end

  def get_role_name
    case self.get_role
    when :editor
      return "Editor"
    when :reader
      return "Lector"
    else
      return "Anónimo"
    end
  end

  def remove_roles
    self.remove_role :editor
    self.remove_role :reader
    self.remove_role :anonymous
  end
end
