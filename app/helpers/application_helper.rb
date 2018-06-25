module ApplicationHelper
  # FIXME: obsolete after aliasing
  def de_namespace(field_name)
    namespace, *term = field_name.split('_')
    [namespace, term.join('_')]
  end

  def namespace(field_name)
    de_namespace(field_name).first
  end

  # FIXME: obsolete after aliasing
  def term(field_name)
    de_namespace(field_name).last
  end

  # returns hash with mongoid IDs and blank keys removed
  def strip(hash)
    hash.reject { |_k, v| v.is_a?(BSON::ObjectId) || v.is_a?(Hash) || v.is_a?(Array) }
				.delete_if { |_k, v| v.blank? }
				.map { |k, v| [k, v] }
				.to_h
  end

  def background_image(coll = nil)
    name = coll&.tr(' ', '_')&.downcase
    asset = Rails.application.assets.find_asset(name) ? name : 'nhmd_generic'
    path = asset_path asset
    tag.style ".content-box {background-image: url(#{path}); background-size: contain; background-repeat: no-repeat;}"
  end
end
