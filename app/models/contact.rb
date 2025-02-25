class Contact < ApplicationRecord
  belongs_to :kind, optional: true
  has_many :phones
  has_one :address
  accepts_nested_attributes_for :phones, allow_destroy: true
  accepts_nested_attributes_for :address, update_only: true

  def as_json(options = {})
    super(
      {
        root: true,
        include: {
          address: {only: [:street, :city] },
          kind: { only: [:id, :description] },
          phones: { only: [:id, :number] }
        }
      }
    )
  end
end
