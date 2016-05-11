json.array!(@employees) do |employee|
  json.extract! employee, :id, :name, :gender, :age
  json.url employee_url(employee, format: :json)
end
