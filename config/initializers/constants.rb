# frozen_string_literal: true

# Required for filtering typeahead results in autocompletable.rb
WHITE = Text::WhiteSimilarity.new

# Custom RDF vocabularies
IPTC = RDF::Vocabulary.new 'http://ns.adobe.com/photoshop/1.0/'
AUDUBON = RDF::Vocabulary.new 'http://rs.tdwg.org/ac/terms/'
XMP = RDF::Vocabulary.new 'http://ns.adobe.com/xap/1.0/'
EXIF = RDF::Vocabulary.new 'http://ns.adobe.com/exif/1.0/'

IDLOC = 'http://id.loc.gov/vocabulary/iso639-2/'
