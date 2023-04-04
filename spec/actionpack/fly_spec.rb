require "spec_helper"

RSpec.describe ActionPack::Fly do
  context "FLY_CLIENT_IP not present" do
    it "returns expected remote_ip" do
      request = stub_request "REMOTE_ADDR" => "1.2.3.4"
      expect(request.remote_ip).to eq "1.2.3.4"

      request =
        stub_request "REMOTE_ADDR" => "127.0.0.1",
                     "HTTP_X_FORWARDED_FOR" => "3.4.5.6"
      expect(request.remote_ip).to eq "3.4.5.6"
    end
  end

  context "HTTP_FLY_CLIENT_IP present" do
    it "returns the fly ip" do
      request =
        stub_request(
          "REMOTE_ADDR" => "172.68.65.232",
          "HTTP_FLY_CLIENT_IP" => "72.1.1.42"
        )
      expect(request.remote_ip).to eq "72.1.1.42"
    end

    context "when HTTP_X_FORWARDED_FOR is present" do
      it "returns the fly ip" do
        request =
          stub_request "REMOTE_ADDR" => "127.0.0.1",
                       "HTTP_X_FORWARDED_FOR" => "72.1.1.1, 172.1.1.42",
                       "HTTP_FLY_CLIENT_IP" => "72.1.1.42"
        expect(request.remote_ip).to eq "72.1.1.42"
      end
    end
  end

  private

  def stub_request(env = {})
    ip_spoofing_check =
      env.key?(:ip_spoofing_check) ? env.delete(:ip_spoofing_check) : true
    @trusted_proxies ||= nil
    ip_app =
      ActionDispatch::RemoteIp.new(
        Proc.new {},
        ip_spoofing_check,
        @trusted_proxies
      )
    tld_length = env.key?(:tld_length) ? env.delete(:tld_length) : 1
    ip_app.call(env)
    ActionDispatch::Http::URL.tld_length = tld_length
    ActionDispatch::Request.new(env)
  end
end
