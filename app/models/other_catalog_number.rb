# frozen_string_literal: true

# Embedded model for other catalag numbers.
class OtherCatalogNumber
  include Mongoid::Document

  embedded_in :collection_object

  field :dwc_other_catalog_numbers, type: String
end
