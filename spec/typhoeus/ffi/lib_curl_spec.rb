require File.dirname(__FILE__) + '/../../spec_helper'

describe Typhoeus::LibCurl do
  before(:each) do
    @klass = Typhoeus::LibCurl
    @curl = @klass.curl_easy_init
  end

  after(:each) do
    @klass.curl_easy_cleanup(@curl) # free mem
  end

  describe "#curl_easy_init" do
    it "should return a valid cURL handle" do
      @curl.should be_an_instance_of(FFI::Pointer)
    end
  end

  describe "#curl_easy_setopt_long" do
    it "should return OK for a long option" do
      result = @klass.curl_easy_setopt_long(@curl, :TCP_NODELAY, 1)
      result.should == :CURLE_OK
    end
  end

  describe "#curl_easy_setopt_string" do
    it "should take a string as a value" do
      result = @klass.curl_easy_setopt_string(@curl, :URL, 'http://google.com')
      result.should == :CURLE_OK
    end
  end

  describe "full requests" do
    before(:each) do
      @klass.curl_easy_setopt_string(@curl, :URL, 'http://localhost:3000/test')
      @klass.curl_easy_setopt_function_ptr(@curl, :WRITEFUNCTION,
                                           Typhoeus::LibCurl::BlankWriteCallback)
      @result = @klass.curl_easy_perform(@curl)
    end

    it "should have an OK result" do
      @result.should == :CURLE_OK
    end

    it "should fill in info" do
      url_ptr = FFI::MemoryPointer.new(:pointer)
      info = @klass.curl_easy_getinfo(@curl, :CURLINFO_EFFECTIVE_URL, url_ptr)
      url_ptr.get_pointer(0).read_string.should == 'http://localhost:3000/test'
      url_ptr.free
    end
  end
end
