json.array!(@imes_qh_bdlcs) do |imes_qh_bdlc|
  json.extract! imes_qh_bdlc, :id
  json.url imes_qh_bdlc_url(imes_qh_bdlc, format: :json)
end
