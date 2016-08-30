json.array!(@imes_d600hs) do |imes_d600h|
  json.extract! imes_d600h, :id
  json.url imes_d600h_url(imes_d600h, format: :json)
end
