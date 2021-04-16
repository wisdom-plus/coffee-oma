json.results @tags do |tag|
  json.name tag.name
  json.value tag.name
  json.text "#{tag.name}(#{tag.taggings_count})"
end
