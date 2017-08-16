module CollectionObjectsHelper
  def display_order(record_detail)
    order = %w(taxon identification geological_context location event organism)

    # insert 'metadata' as the last element
    order << 'metadata'
    record_detail.sort do |a, b|
      order.index(a[:section]) <=> order.index(b[:section])
    end
  end

  def italicize?(term, genus = nil )
    # italicize cientific name if determined to genus ore below
    return true if term == 'dwc_scientific_name' && genus

    italics = %w(dwc_genus dwc_subgenus dwc_specific_epithet dwc_infraspecific_epithet)
    italics.include?(term)
  end
end
