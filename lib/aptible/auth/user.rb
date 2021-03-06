module Aptible
  module Auth
    class User < Resource
      has_many :roles

      field :id
      field :name
      field :email
      field :username
      field :verified, type: Aptible::Resource::Boolean
      field :public_key_fingerprint
      field :created_at, type: Time
      field :updated_at, type: Time

      def organizations
        roles.map(&:organization)
      end

      def operations
        # TODO: Implement query params for /operations
        []
      end

      def privileged_organizations
        privileged_roles.map(&:organization)
      end

      def privileged_roles
        @privileged_roles ||= roles.select(&:privileged?)
      end
    end
  end
end
