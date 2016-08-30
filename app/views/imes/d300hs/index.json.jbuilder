json.array!(@imes_d300hs) do |imes_d300h|
  json.extract! imes_d300h, :id
  json.url imes_d300h_url(imes_d300h, format: :json)
end
