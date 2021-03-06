module Aptible
  module Auth
    class Role < Resource
      belongs_to :organization

      field :id
      field :name
      field :privileged, type: Aptible::Resource::Boolean
      field :created_at, type: Time
      field :updated_at, type: Time
    end
  end
end
