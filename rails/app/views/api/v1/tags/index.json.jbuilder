json.sucess true
json.results @tags do |tag|
  json.name "#{tag.name}(#{tag.taggings_count})"
  json.value tag.name
  json.text "#{tag.name}(#{tag.taggings_count})"
end
