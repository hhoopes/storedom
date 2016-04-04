class Store < ActiveRecord::Base
  belongs_to :user
  has_many :items

  before_create :set_slug

  scope :approved, -> { where(approval: true)}

  def set_slug
    self.slug = name.parameterize
  end
end
