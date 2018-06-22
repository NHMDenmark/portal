# frozen_string_literal: true

# Provides autocmplete/typeahead functionality for search
module Autocompletable
  # Extracts the value for (nested) fields from the results returned by
  # searchkick
  def field_value(field_path, results)
    current_field = field_path.shift
    val = results[current_field]
    return val unless val.respond_to? :key?
    field_value(field_path, val)
  end

  # Returns the value from _result_ that best matches _str_.
  # _fields_: the fields to search in
  def filter(results, str, *fields)
    fields.map { |f| field_value f.split('.'), results }
          .compact
          .min { |a, b| white_compare(a, b, str) }
  end

  # Returns typeahead suggestions based on the ealsticsearch search passed as a
  # block.
  # _str_: the String to search for
  # _fields_: the model fields to serach in (use dot-notation for nested fields)
  def typeahead(str, *fields, &block)
    block.yield(str, fields).inject([]) do |arr, result|
      arr << filter(result, str, *fields)
    end.uniq
  end

  # Compares _str1_ and _strw_ by White similarity to <em>ref_str</em>.
  def white_compare(str1, str2, ref_str)
    WHITE.similarity(str2, ref_str) <=> WHITE.similarity(str1, ref_str)
  end
end
