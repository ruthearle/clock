def saved_service(id)
  service.service_id = id
  service.time = current_time
  service.save
end


def get_request_status(id, status_code)
  get "api/time", { "service_id" => id }
  expect(last_response.status).to eq status_code
end

def put_response_body(new_time, id, status_code, time_value)
  put "api/time", { "new" => new_time, "service_id" => id }
  expect(last_response.status).to eq status_code
  expect(JSON.parse(last_response.body)).to include ({ "time" => "#{time_value}", "service_id" => "#{id}" })
end

def get_response_body(id, status_code, time_value)
  get "api/time", { "service_id" => id}
  expect(last_response.status).to eq status_code
  expect(JSON.parse(last_response.body)).to include ({ "time" => "#{time_value}" })
end

def stub_time(time)
  allow(Time).to receive(:now).and_return(time)
end
