require File.dirname(__FILE__) + '/../spec_helper'

describe Typhoeus::Response do
  describe "initialize" do
    it "should store response_code" do
      Typhoeus::Response.new(:code => 200).code.should == 200
    end
    
    it "should store response_headers" do
      Typhoeus::Response.new(:headers => "a header!").headers.should == "a header!"
    end
    
    it "should store response_body" do
      Typhoeus::Response.new(:body => "a body!").body.should == "a body!"
    end
    
    it "should store request_time" do
      Typhoeus::Response.new(:time => 1.23).time.should == 1.23
    end

    it "should store requested_url" do
      response = Typhoeus::Response.new(:requested_url => "http://test.com")
      response.requested_url.should == "http://test.com"
    end

    it "should store requested_http_method" do
      response = Typhoeus::Response.new(:requested_http_method => :delete)
      response.requested_http_method.should == :delete
    end

    it "should store an associated request object" do
      response = Typhoeus::Response.new(:request => "whatever")
      response.request.should == "whatever"
    end
  end

  describe "headers" do
    describe "basic parsing" do
      it "can parse the headers into a hash" do
        response = Typhoeus::Response.new(:headers => "HTTP/1.1 200 OK\r\nContent-Type: text/html; charset=utf-8\r\nConnection: close\r\nStatus: 200\r\nX-Powered-By: Phusion Passenger (mod_rails/mod_rack) 2.2.9\r\nX-Cache: miss\r\nX-Runtime: 184\r\nETag: e001d08d9354ab7bc7c27a00163a3afa\r\nCache-Control: private, max-age=0, must-revalidate\r\nContent-Length: 4725\r\nSet-Cookie: _some_session=BAh7CDoGciIAOg9zZXNzaW9uX2lkIiU1OTQ2OTcwMjljMWM5ZTQwODU1NjQwYTViMmQxMTkxMjoGcyIKL2NhcnQ%3D--b4c4663932243090c961bb93d4ad5e4327064730; path=/; HttpOnly\r\nServer: nginx/0.6.37 + Phusion Passenger 2.2.4 (mod_rails/mod_rack)\r\nSet-Cookie: foo=bar; path=/;\r\nP3P: CP=\"NOI DSP COR NID ADMa OPTa OUR NOR\"\r\n\r\n")
        response.headers_hash["Status"].should == "200"
        response.headers_hash["Set-Cookie"].should == ["_some_session=BAh7CDoGciIAOg9zZXNzaW9uX2lkIiU1OTQ2OTcwMjljMWM5ZTQwODU1NjQwYTViMmQxMTkxMjoGcyIKL2NhcnQ%3D--b4c4663932243090c961bb93d4ad5e4327064730; path=/; HttpOnly", "foo=bar; path=/;"]
        response.headers_hash["Content-Type"].should == "text/html; charset=utf-8"
      end

      it "parses a header key that appears multiple times into an array" do
        response = Typhoeus::Response.new(:headers => "HTTP/1.1 302 Found\r\nContent-Type: text/html; charset=utf-8\r\nConnection: close\r\nStatus: 302\r\nX-Powered-By: Phusion Passenger (mod_rails/mod_rack) 2.2.9\r\nLocation: http://mckenzie-greenholt1512.myshopify.com/cart\r\nX-Runtime: 22\r\nCache-Control: no-cache\r\nContent-Length: 114\r\nSet-Cookie: cart=8fdd6a828d9c89a737a52668be0cebaf; path=/; expires=Fri, 12-Mar-2010 18:30:19 GMT\r\nSet-Cookie: _session=BAh7CToPc2Vzc2lvbl9pZCIlZTQzMDQzMDg1YjI3MTQ4MzAzMTZmMWZmMWJjMTU1NmI6CWNhcnQiJThmZGQ2YTgyOGQ5Yzg5YTczN2E1MjY2OGJlMGNlYmFmOgZyIgA6BnMiDi9jYXJ0L2FkZA%3D%3D--6b0a699625caed9597580d8e9b6ca5f5e5954125; path=/; HttpOnly\r\nServer: nginx/0.6.37 + Phusion Passenger 2.2.4 (mod_rails/mod_rack)\r\nP3P: CP=\"NOI DSP COR NID ADMa OPTa OUR NOR\"\r\n\r\n")
        response.headers_hash["Set-Cookie"].should include("cart=8fdd6a828d9c89a737a52668be0cebaf; path=/; expires=Fri, 12-Mar-2010 18:30:19 GMT")
        response.headers_hash["Set-Cookie"].should include("_session=BAh7CToPc2Vzc2lvbl9pZCIlZTQzMDQzMDg1YjI3MTQ4MzAzMTZmMWZmMWJjMTU1NmI6CWNhcnQiJThmZGQ2YTgyOGQ5Yzg5YTczN2E1MjY2OGJlMGNlYmFmOgZyIgA6BnMiDi9jYXJ0L2FkZA%3D%3D--6b0a699625caed9597580d8e9b6ca5f5e5954125; path=/; HttpOnly")
      end
    end

    describe "multiple headers from redirect" do
      before(:each) do
        @response = Typhoeus::Response.new(:headers => "HTTP/1.1 301 Moved\r\nServer: nginx/0.7.42\r\nDate: Tue, 11 May 2010 18:56:28 GMT\r\nContent-Type: text/html; charset=utf-8\r\nConnection: keep-alive\r\nSet-Cookie: _bit=4be9a85c-002fc-06cad-91a08fa8;domain=.bit.ly;expires=Sun Nov  7 13:56:28 2010;path=/; HttpOnly\r\nLocation: http://www.threeimaginarygirls.com/contentcdreview/2010may/nothing-hurts\r\nMIME-Version: 1.0\r\nContent-Length: 334\r\n\r\nHTTP/1.1 200 OK\r\nDate: Tue, 11 May 2010 18:56:29 GMT\r\nServer: Apache/2.2.3 (CentOS)\r\nX-Powered-By: PHP/5.2.6\r\nSet-Cookie: SESS81f32fd3df70162be71c5ed176685bcb=6qotoo1vgf8gh5qerkulc2f837; expires=Thu, 03 Jun 2010 22:29:49 GMT; path=/; domain=.threeimaginarygirls.com\r\nExpires: Sun, 19 Nov 1978 05:00:00 GMT\r\nLast-Modified: Tue, 11 May 2010 18:56:29 GMT\r\nCache-Control: store, no-cache, must-revalidate\r\nCache-Control: post-check=0, pre-check=0\r\nConnection: close\r\nTransfer-Encoding: chunked\r\nContent-Type: text/html; charset=utf-8\r\n\r\n")
      end

      it "should be able to extract a hash of headers" do
        headers = @response.headers_hash
        headers['Date'].should == 'Tue, 11 May 2010 18:56:29 GMT'
      end
    end
  end
end
