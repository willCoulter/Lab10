class ApplicationRecord < ActiveRecord::Base
  include GENERATE_UUID
  self.abstract_class = true
end
