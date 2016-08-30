json.array!(@imes_d400hs) do |imes_d400h|
  json.extract! imes_d400h, :id
  json.url imes_d400h_url(imes_d400h, format: :json)
end
