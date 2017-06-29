module ApplicationHelper
  # returns hash with mongoid IDs and blank keys removed
  def tidy_up(hash)
    hash.reject { |_k, v| v.is_a? BSON::ObjectId }
				.delete_if { |_k, v| v.blank? }
				.map { |k, v| [k.to_s.humanize, v] }
				.to_h
  end
end
