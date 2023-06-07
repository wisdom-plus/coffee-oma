json.sucess true
json.results @brands do |brand|
  json.name brand.name.to_s
  json.value brand.id
  json.text brand.name.to_s
end
