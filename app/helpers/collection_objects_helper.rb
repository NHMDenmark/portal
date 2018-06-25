module CollectionObjectsHelper
  def display_order(section)
    order = %w(identification taxon geological_context location event organism)
    section.sort do |a, b|
      order.index(a[:header]) <=> order.index(b[:header])
    end
  end

  def italicize?(term, genus = nil )
    # italicize cientific name if determined to genus ore below
    return true if term == 'scientific_name' && genus

    italics = %w(genus subgenus specific_epithet infraspecific_epithet)
    italics.include?(term)
  end

  def section_header(header, record_details)
    header_strings = {
      'taxon' => "#{record_details[:scientific_name]}",
      'identification' => "#{record_details[:dwc_type_status]}",
      'geological_context' => "Geological Context",
      'location' => "#{record_details[:locality]}, #{record_details[:higher_geography]}",
      'event' => "#{record_details[:dwc_event_date]}",
      'organism' => "Organism",
    }
    header_strings[header]
  end
end
