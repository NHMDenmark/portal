class AssociatedMedia
  include Mongoid::Document
  # include Mongoid::Attributes::Dynamic

  embedded_in :collection_object

  field :dwc_associated_media, type: String

  field :dc_identifier, type: String # http://purl.org/dc/terms/identifier
  field :dc_title, type: String      # http://purl.org/dc/terms/title
  field :dc_format, type: String     # http://purl.org/dc/terms/format
  field :xmp_owner, type: String     # http://ns.adobe.com/xap/1.0/rights/Owner
  field :dc_rights, type: String     # http://purl.org/dc/terms/rights
  field :ac_license_logo_url, type: String # http://rs.tdwg.org/ac/terms/licenseLogoURL
  field :iptc_credit , type: String # http://ns.adobe.com/photoshop/1.0/Credit
  field :dce_rights , type: String # http://purl.org/dc/elements/1.1/rights
end
