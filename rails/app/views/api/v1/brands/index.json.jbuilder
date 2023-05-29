json.sucess true
json.results @brands do |brand|
  json.name "#{brand.name}"
  json.value brand.id
  json.text "#{brand.name}"
end
