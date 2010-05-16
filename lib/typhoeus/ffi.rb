path = File.dirname(__FILE__) + '/ffi/'

['lib_curl'].each do |file|
  require path + file
end
