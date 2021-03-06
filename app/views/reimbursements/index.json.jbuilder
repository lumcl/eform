json.array!(@reimbursements) do |reimbursement|
  json.extract! reimbursement, :id, :name, :bukrs, :belnr, :gjahr, :blart, :budat, :bldat, :waers, :subject, :body, :approved, :status, :deleted, :owner_id, :creator_id, :updater_id, :creator_ip, :updater_ip, :uuid
  json.url reimbursement_url(reimbursement, format: :json)
end
