module RansackableColumns
  extend ActiveSupport::Concern

  EXCEPTCOLUMN = %w[password_digest reset_password_token
                    password_reset_sent_at remember_digest
                    tokens confirmation_token encrypted_password].freeze

  class_methods do
    def ransackable_attributes(_auth_object = nil)
      column_names - EXCEPTCOLUMN
    end

    def ransackable_associations(_auth_object = nil)
      reflect_on_all_associations.map { |a| a.name.to_s }
    end
  end
end
