json.array!(@shows) do |show|
  json.extract! show, :name, :start_date, :end_date, :type_of_show :description,
  :category
  json.url show_url(show, format: :json)
end
