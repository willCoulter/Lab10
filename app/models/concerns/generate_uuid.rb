require 'active_support/concern'

module GENERATE_UUID
  extend ActiveSupport::Concern

  included do
    before_create :generate_uuid
    after_create :manually_update_slug
  end

  # Generates a UUID for the record with the model name pre-pending the UUID
  def generate_uuid
    self.uuid = "#{self.model_name.name}-" + SecureRandom.uuid
  end

  # Updates the slug with the UUID after the record is created. We use a update column to avoid model callback loops
  def manually_update_slug
    self.update_column(:slug, self.uuid)
  end

end