# frozen_string_literal: true

# Embedded model for other catalag numbers.
# This is a custom model, not present as a class in DwC, where this is a single
# field containing a concatanated and separated literal (String).
class OtherCatalogNumber
  include Mongoid::Document

  embedded_in :collection_object

  # http://rs.tdwg.org/dwc/terms/otherCatalogNumbers
  # A previous or alternate fully qualified catalog number or other human-used
  # identifier for the same Occurrence, whether in the current or any other data
  # set or collection.
  field :other_catalog_number, as: :dwc_other_catalog_numbers, type: String
end
