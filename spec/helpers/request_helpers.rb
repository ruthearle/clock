module RequestHelpers

  def saved_service(id)
    service = Clock.new
    service.service_name = service_name
    service.fake_time = current_time
    service.save
  end


  def get_request_status(id, status_code)
    get "clocks/#{id}.json"
    expect(last_response.status).to eq status_code
  end

  def post_response_body(new_time, id, status_code)
    post "clocks/#{id}.json", { "fake_time" => "#{new_time}" }
  end

  def get_response_body(id, status_code, time_value)
    get "clocks/#{id}.json"
    expect(last_response.status).to eq status_code
  end

  def stub_time(time)
    allow(Time).to receive(:now).and_return(time)
  end

end
