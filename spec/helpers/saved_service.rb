def saved_service(id)
  service = Clock.new
  service.service_name = service_name
  service.time = current_time
  service.save
end


def get_request_status(id, status_code)
  get "clocks/#{id}.json"
  expect(last_response.status).to eq status_code
end

def post_response_body(new_time, id, status_code, time_value)
  post "clocks/#{id}.json", { "time" => new_time }
  expect(last_response.status).to eq status_code
end

def get_response_body(id, status_code, time_value)
  get "clocks/#{id}.json"
  expect(last_response.status).to eq status_code
  expect(JSON.parse(last_response.body)).to include ({ "time" => "#{time_value}" })
end

def stub_time(time)
  allow(Time).to receive(:now).and_return(time)
end
