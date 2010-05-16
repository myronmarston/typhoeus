require 'ffi'

module Typhoeus
  module LibCurl
    extend FFI::Library
    ffi_lib 'curl'

    CURLcode = enum(
      :CURLE_OK, 0,
      :CURLE_UNSUPPORTED_PROTOCOL,    # 1
      :CURLE_FAILED_INIT,             # 2
      :CURLE_URL_MALFORMAT,           # 3
      :CURLE_OBSOLETE4,               # 4
      :CURLE_COULDNT_RESOLVE_PROXY,   # 5
      :CURLE_COULDNT_RESOLVE_HOST,    # 6
      :CURLE_COULDNT_CONNECT,         # 7
      :CURLE_FTP_WEIRD_SERVER_REPLY,  # 8
      :CURLE_REMOTE_ACCESS_DENIED,    # 9
      :CURLE_OBSOLETE10,              # 10 - NOT USED
      :CURLE_FTP_WEIRD_PASS_REPLY,    # 11
      :CURLE_OBSOLETE12,              # 12 - NOT USED
      :CURLE_FTP_WEIRD_PASV_REPLY,    # 13
      :CURLE_FTP_WEIRD_227_FORMAT,    # 14
      :CURLE_FTP_CANT_GET_HOST,       # 15
      :CURLE_OBSOLETE16,              # 16 - NOT USED
      :CURLE_FTP_COULDNT_SET_TYPE,    # 17
      :CURLE_PARTIAL_FILE,            # 18
      :CURLE_FTP_COULDNT_RETR_FILE,   # 19
      :CURLE_OBSOLETE20,              # 20 - NOT USED
      :CURLE_QUOTE_ERROR,             # 21 - QUOTE COMMAND FAILURE
      :CURLE_HTTP_RETURNED_ERROR,     # 22
      :CURLE_WRITE_ERROR,             # 23
      :CURLE_OBSOLETE24,              # 24 - NOT USED
      :CURLE_UPLOAD_FAILED,           # 25 - FAILED UPLOAD "COMMAND"
      :CURLE_READ_ERROR,              # 26 - COULDN'T OPEN/READ FROM FILE
      :CURLE_OUT_OF_MEMORY,           # 27
      :CURLE_OPERATION_TIMEDOUT,      # 28 - THE TIMEOUT TIME WAS REACHED
      :CURLE_OBSOLETE29,              # 29 - NOT USED
      :CURLE_FTP_PORT_FAILED,         # 30 - FTP PORT OPERATION FAILED
      :CURLE_FTP_COULDNT_USE_REST,    # 31 - THE REST COMMAND FAILED
      :CURLE_OBSOLETE32,              # 32 - NOT USED
      :CURLE_RANGE_ERROR,             # 33 - RANGE "COMMAND" DIDN'T WORK
      :CURLE_HTTP_POST_ERROR,         # 34
      :CURLE_SSL_CONNECT_ERROR,       # 35 - WRONG WHEN CONNECTING WITH SSL
      :CURLE_BAD_DOWNLOAD_RESUME,     # 36 - COULDN'T RESUME DOWNLOAD
      :CURLE_FILE_COULDNT_READ_FILE,  # 37
      :CURLE_LDAP_CANNOT_BIND,        # 38
      :CURLE_LDAP_SEARCH_FAILED,      # 39
      :CURLE_OBSOLETE40,              # 40 - NOT USED
      :CURLE_FUNCTION_NOT_FOUND,      # 41
      :CURLE_ABORTED_BY_CALLBACK,     # 42
      :CURLE_BAD_FUNCTION_ARGUMENT,   # 43
      :CURLE_OBSOLETE44,              # 44 - NOT USED
      :CURLE_INTERFACE_FAILED,        # 45 - CURLOPT_INTERFACE FAILED
      :CURLE_OBSOLETE46,              # 46 - NOT USED
      :CURLE_TOO_MANY_REDIRECTS ,     # 47 - CATCH ENDLESS RE-DIRECT LOOPS
      :CURLE_UNKNOWN_TELNET_OPTION,   # 48 - USER SPECIFIED AN UNKNOWN OPTION
      :CURLE_TELNET_OPTION_SYNTAX ,   # 49 - MALFORMED TELNET OPTION
      :CURLE_OBSOLETE50,              # 50 - NOT USED
      :CURLE_PEER_FAILED_VERIFICATION, # 51 - PEER'S CERTIFICATE OR FINGERPRINT
                                       #   WASN'T VERIFIED FINE
      :CURLE_GOT_NOTHING,             # 52 - WHEN THIS IS A SPECIFIC ERROR
      :CURLE_SSL_ENGINE_NOTFOUND,     # 53 - SSL CRYPTO ENGINE NOT FOUND
      :CURLE_SSL_ENGINE_SETFAILED,    # 54 - CAN NOT SET SSL CRYPTO ENGINE AS
                                      #   DEFAULT
      :CURLE_SEND_ERROR,              # 55 - FAILED SENDING NETWORK DATA
      :CURLE_RECV_ERROR,              # 56 - FAILURE IN RECEIVING NETWORK DATA
      :CURLE_OBSOLETE57,              # 57 - NOT IN USE
      :CURLE_SSL_CERTPROBLEM,         # 58 - PROBLEM WITH THE LOCAL CERTIFICATE
      :CURLE_SSL_CIPHER,              # 59 - COULDN'T USE SPECIFIED CIPHER
      :CURLE_SSL_CACERT,              # 60 - PROBLEM WITH THE CA CERT (PATH?)
      :CURLE_BAD_CONTENT_ENCODING,    # 61 - UNRECOGNIZED TRANSFER ENCODING
      :CURLE_LDAP_INVALID_URL,        # 62 - INVALID LDAP URL
      :CURLE_FILESIZE_EXCEEDED,       # 63 - MAXIMUM FILE SIZE EXCEEDED
      :CURLE_USE_SSL_FAILED,          # 64 - REQUESTED FTP SSL LEVEL FAILED
      :CURLE_SEND_FAIL_REWIND,        # 65 - SENDING THE DATA REQUIRES A REWIND
                                      #   THAT FAILED
      :CURLE_SSL_ENGINE_INITFAILED,   # 66 - FAILED TO INITIALISE ENGINE
      :CURLE_LOGIN_DENIED,            # 67 - USER, PASSWORD OR SIMILAR WAS NOT
                                      #   ACCEPTED AND WE FAILED TO LOGIN
      :CURLE_TFTP_NOTFOUND,           # 68 - FILE NOT FOUND ON SERVER
      :CURLE_TFTP_PERM,               # 69 - PERMISSION PROBLEM ON SERVER
      :CURLE_REMOTE_DISK_FULL,        # 70 - OUT OF DISK SPACE ON SERVER
      :CURLE_TFTP_ILLEGAL,            # 71 - ILLEGAL TFTP OPERATION
      :CURLE_TFTP_UNKNOWNID,          # 72 - UNKNOWN TRANSFER ID
      :CURLE_REMOTE_FILE_EXISTS,      # 73 - FILE ALREADY EXISTS
      :CURLE_TFTP_NOSUCHUSER,         # 74 - NO SUCH USER
      :CURLE_CONV_FAILED,             # 75 - CONVERSION FAILED
      :CURLE_CONV_REQD,               # 76 - CALLER MUST REGISTER CONVERSION
                                      #   CALLBACKS USING CURL_EASY_SETOPT OPTIONS
                                      #   CURLOPT_CONV_FROM_NETWORK_FUNCTION,
                                      #   CURLOPT_CONV_TO_NETWORK_FUNCTION, AND
                                      #   CURLOPT_CONV_FROM_UTF8_FUNCTION
      :CURLE_SSL_CACERT_BADFILE,      # 77 - COULD NOT LOAD CACERT FILE, MISSING
                                      #   OR WRONG FORMAT
      :CURLE_REMOTE_FILE_NOT_FOUND,   # 78 - REMOTE FILE NOT FOUND
      :CURLE_SSH,                     # 79 - ERROR FROM THE SSH LAYER, SOMEWHAT
                                      #   GENERIC SO THE ERROR MESSAGE WILL BE OF
                                      #   INTEREST WHEN THIS HAS HAPPENED
      :CURLE_SSL_SHUTDOWN_FAILED,     # 80 - FAILED TO SHUT DOWN THE SSL
                                      #   CONNECTION
      :CURLE_AGAIN,                   # 81 - SOCKET IS NOT READY FOR SEND/RECV,
                                      #   WAIT TILL IT'S READY AND TRY AGAIN (ADDED
                                      #   IN 7.18.2)
      :CURLE_SSL_CRL_BADFILE,         # 82 - COULD NOT LOAD CRL FILE, MISSING OR
                                      #   WRONG FORMAT (ADDED IN 7.19.0)
      :CURLE_SSL_ISSUER_ERROR,        # 83 - ISSUER CHECK FAILED.  (ADDED IN
                                      #   7.19.0)
      :CURLE_FTP_PRET_FAILED,         # 84 - A PRET COMMAND FAILED
      :CURLE_RTSP_CSEQ_ERROR,         # 85 - MISMATCH OF RTSP CSEQ NUMBERS
      :CURLE_RTSP_SESSION_ERROR,      # 86 - MISMATCH OF RTSP SESSION IDENTIFIERS 

      :CURL_LAST # NEVER USE!
    ) unless defined?(CURLcode)

    CURLINFO_STRING   = 0x100000
    CURLINFO_LONG     = 0x200000
    CURLINFO_DOUBLE   = 0x300000
    CURLINFO_SLIST    = 0x400000
    CURLINFO_MASK     = 0x0fffff
    CURLINFO_TYPEMASK = 0xf00000

    CURLINFO = enum(
      :CURLINFO_NONE, # never use this.
      :CURLINFO_EFFECTIVE_URL, CURLINFO_STRING + 1,
      :CURLINFO_RESPONSE_CODE, CURLINFO_LONG + 2,
      :CURLINFO_TOTAL_TIME, CURLINFO_DOUBLE + 3,
      :CURLINFO_NAMELOOKUP_TIME, CURLINFO_DOUBLE + 4,
      :CURLINFO_CONNECT_TIME, CURLINFO_DOUBLE + 5,
      :CURLINFO_PRETRANSFER_TIME, CURLINFO_DOUBLE + 6,
      :CURLINFO_SIZE_UPLOAD, CURLINFO_DOUBLE + 7,
      :CURLINFO_SIZE_DOWNLOAD, CURLINFO_DOUBLE + 8,
      :CURLINFO_SPEED_DOWNLOAD, CURLINFO_DOUBLE + 9,
      :CURLINFO_SPEED_UPLOAD, CURLINFO_DOUBLE + 10,
      :CURLINFO_HEADER_SIZE, CURLINFO_LONG + 11,
      :CURLINFO_REQUEST_SIZE, CURLINFO_LONG + 12,
      :CURLINFO_SSL_VERIFYRESULT, CURLINFO_LONG + 13,
      :CURLINFO_FILETIME, CURLINFO_LONG + 14,
      :CURLINFO_CONTENT_LENGTH_DOWNLOAD, CURLINFO_DOUBLE + 15,
      :CURLINFO_CONTENT_LENGTH_UPLOAD, CURLINFO_DOUBLE + 16,
      :CURLINFO_STARTTRANSFER_TIME, CURLINFO_DOUBLE + 17,
      :CURLINFO_CONTENT_TYPE, CURLINFO_STRING + 18,
      :CURLINFO_REDIRECT_TIME, CURLINFO_DOUBLE + 19,
      :CURLINFO_REDIRECT_COUNT, CURLINFO_LONG + 20,
      :CURLINFO_PRIVATE, CURLINFO_STRING + 21,
      :CURLINFO_HTTP_CONNECTCODE, CURLINFO_LONG + 22,
      :CURLINFO_HTTPAUTH_AVAIL, CURLINFO_LONG + 23,
      :CURLINFO_PROXYAUTH_AVAIL, CURLINFO_LONG + 24,
      :CURLINFO_OS_ERRNO, CURLINFO_LONG + 25,
      :CURLINFO_NUM_CONNECTS, CURLINFO_LONG + 26,
      :CURLINFO_SSL_ENGINES, CURLINFO_SLIST + 27,
      :CURLINFO_COOKIELIST, CURLINFO_SLIST + 28,
      :CURLINFO_LASTSOCKET, CURLINFO_LONG + 29,
      :CURLINFO_FTP_ENTRY_PATH, CURLINFO_STRING + 30,
      :CURLINFO_REDIRECT_URL, CURLINFO_STRING + 31,
      :CURLINFO_PRIMARY_IP, CURLINFO_STRING + 32,
      :CURLINFO_APPCONNECT_TIME, CURLINFO_DOUBLE + 33,
      :CURLINFO_CERTINFO, CURLINFO_SLIST + 34,
      :CURLINFO_CONDITION_UNMET, CURLINFO_LONG + 35,
      :CURLINFO_RTSP_SESSION_ID, CURLINFO_STRING + 36,
      :CURLINFO_RTSP_CLIENT_CSEQ, CURLINFO_LONG + 37,
      :CURLINFO_RTSP_SERVER_CSEQ, CURLINFO_LONG + 38,
      :CURLINFO_RTSP_CSEQ_RECV, CURLINFO_LONG + 39,

      :CURLINFO_LASTONE, 39
    ) unless defined?(CURLINFO)

    CURLOPT_LONG          = 0
    CURLOPT_OBJECTPOINT   = 10000
    CURLOPT_FUNCTIONPOINT = 20000
    CURLOPT_OFF_T         = 30000

    CURLoption = enum(
      :FILE, 1 + CURLOPT_OBJECTPOINT,
      :URL, 2 + CURLOPT_OBJECTPOINT,
      :PORT, 3 + CURLOPT_LONG,
      :PROXY, 4 + CURLOPT_OBJECTPOINT,
      :USERPWD, 5 + CURLOPT_OBJECTPOINT,
      :PROXYUSERPWD, 6 + CURLOPT_OBJECTPOINT,
      :RANGE, 7 + CURLOPT_OBJECTPOINT,
      :INFILE, 9 + CURLOPT_OBJECTPOINT,
      :ERRORBUFFER, 10 + CURLOPT_OBJECTPOINT,
      :WRITEFUNCTION, 11 + CURLOPT_FUNCTIONPOINT,
      :READFUNCTION, 12 + CURLOPT_FUNCTIONPOINT,
      :TIMEOUT, 13 + CURLOPT_LONG,
      :INFILESIZE, 14 + CURLOPT_LONG,
      :POSTFIELDS, 15 + CURLOPT_OBJECTPOINT,
      :REFERER, 16 + CURLOPT_OBJECTPOINT,
      :FTPPORT, 17 + CURLOPT_OBJECTPOINT,
      :USERAGENT, 18 + CURLOPT_OBJECTPOINT,
      :LOW_SPEED_LIMIT, 19 + CURLOPT_LONG,
      :LOW_SPEED_TIME, 20 + CURLOPT_LONG,
      :RESUME_FROM, 21 + CURLOPT_LONG,
      :COOKIE, 22 + CURLOPT_OBJECTPOINT,
      :HTTPHEADER, 23 + CURLOPT_OBJECTPOINT,
      :HTTPPOST, 24 + CURLOPT_OBJECTPOINT,
      :SSLCERT, 25 + CURLOPT_OBJECTPOINT,
      :KEYPASSWD, 26 + CURLOPT_OBJECTPOINT,
      :CRLF, 27 + CURLOPT_LONG,
      :QUOTE, 28 + CURLOPT_OBJECTPOINT,
      :WRITEHEADER, 29 + CURLOPT_OBJECTPOINT,
      :COOKIEFILE, 31 + CURLOPT_OBJECTPOINT,
      :SSLVERSION, 32 + CURLOPT_LONG,
      :TIMECONDITION, 33 + CURLOPT_LONG,
      :TIMEVALUE, 34 + CURLOPT_LONG,
      :CUSTOMREQUEST, 36 + CURLOPT_OBJECTPOINT,
      :STDERR, 37 + CURLOPT_OBJECTPOINT,
      :POSTQUOTE, 39 + CURLOPT_OBJECTPOINT,
      :WRITEINFO, 40 + CURLOPT_OBJECTPOINT,
      :VERBOSE, 41 + CURLOPT_LONG,
      :HEADER, 42 + CURLOPT_LONG,
      :NOPROGRESS, 43 + CURLOPT_LONG,
      :NOBODY, 44 + CURLOPT_LONG,
      :FAILONERROR, 45 + CURLOPT_LONG,
      :UPLOAD, 46 + CURLOPT_LONG,
      :POST, 47 + CURLOPT_LONG,
      :DIRLISTONLY, 48 + CURLOPT_LONG,
      :APPEND, 50 + CURLOPT_LONG,
      :NETRC, 51 + CURLOPT_LONG,
      :FOLLOWLOCATION, 52 + CURLOPT_LONG,
      :TRANSFERTEXT, 53 + CURLOPT_LONG,
      :PUT, 54 + CURLOPT_LONG,
      :PROGRESSFUNCTION, 56 + CURLOPT_FUNCTIONPOINT,
      :PROGRESSDATA, 57 + CURLOPT_OBJECTPOINT,
      :AUTOREFERER, 58 + CURLOPT_LONG,
      :PROXYPORT, 59 + CURLOPT_LONG,
      :POSTFIELDSIZE, 60 + CURLOPT_LONG,
      :HTTPPROXYTUNNEL, 61 + CURLOPT_LONG,
      :INTERFACE, 62 + CURLOPT_OBJECTPOINT,
      :KRBLEVEL, 63 + CURLOPT_OBJECTPOINT,
      :SSL_VERIFYPEER, 64 + CURLOPT_LONG,
      :CAINFO, 65 + CURLOPT_OBJECTPOINT,
      :MAXREDIRS, 68 + CURLOPT_LONG,
      :FILETIME, 69 + CURLOPT_LONG,
      :TELNETOPTIONS, 70 + CURLOPT_OBJECTPOINT,
      :MAXCONNECTS, 71 + CURLOPT_LONG,
      :CLOSEPOLICY, 72 + CURLOPT_LONG,
      :FRESH_CONNECT, 74 + CURLOPT_LONG,
      :FORBID_REUSE, 75 + CURLOPT_LONG,
      :RANDOM_FILE, 76 + CURLOPT_OBJECTPOINT,
      :EGDSOCKET, 77 + CURLOPT_OBJECTPOINT,
      :CONNECTTIMEOUT, 78 + CURLOPT_LONG,
      :HEADERFUNCTION, 79 + CURLOPT_FUNCTIONPOINT,
      :HTTPGET, 80 + CURLOPT_LONG,
      :SSL_VERIFYHOST, 81 + CURLOPT_LONG,
      :COOKIEJAR, 82 + CURLOPT_OBJECTPOINT,
      :SSL_CIPHER_LIST, 83 + CURLOPT_OBJECTPOINT,
      :HTTP_VERSION, 84 + CURLOPT_LONG,
      :FTP_USE_EPSV, 85 + CURLOPT_LONG,
      :SSLCERTTYPE, 86 + CURLOPT_OBJECTPOINT,
      :SSLKEY, 87 + CURLOPT_OBJECTPOINT,
      :SSLKEYTYPE, 88 + CURLOPT_OBJECTPOINT,
      :SSLENGINE, 89 + CURLOPT_OBJECTPOINT,
      :SSLENGINE_DEFAULT, 90 + CURLOPT_LONG,
      :DNS_USE_GLOBAL_CACHE, 91 + CURLOPT_LONG,
      :DNS_CACHE_TIMEOUT, 92 + CURLOPT_LONG,
      :PREQUOTE, 93 + CURLOPT_OBJECTPOINT,
      :DEBUGFUNCTION, 94 + CURLOPT_FUNCTIONPOINT,
      :DEBUGDATA, 95 + CURLOPT_OBJECTPOINT,
      :COOKIESESSION, 96 + CURLOPT_LONG,
      :CAPATH, 97 + CURLOPT_OBJECTPOINT,
      :BUFFERSIZE, 98 + CURLOPT_LONG,
      :NOSIGNAL, 99 + CURLOPT_LONG,
      :SHARE, 100 + CURLOPT_OBJECTPOINT,
      :PROXYTYPE, 101 + CURLOPT_LONG,
      :ENCODING, 102 + CURLOPT_OBJECTPOINT,
      :PRIVATE, 103 + CURLOPT_OBJECTPOINT,
      :HTTP200ALIASES, 104 + CURLOPT_OBJECTPOINT,
      :UNRESTRICTED_AUTH, 105 + CURLOPT_LONG,
      :FTP_USE_EPRT, 106 + CURLOPT_LONG,
      :HTTPAUTH, 107 + CURLOPT_LONG,
      :SSL_CTX_FUNCTION, 108 + CURLOPT_FUNCTIONPOINT,
      :SSL_CTX_DATA, 109 + CURLOPT_OBJECTPOINT,
      :FTP_CREATE_MISSING_DIRS, 110 + CURLOPT_LONG,
      :PROXYAUTH, 111 + CURLOPT_LONG,
      :FTP_RESPONSE_TIMEOUT, 112 + CURLOPT_LONG,
      :IPRESOLVE, 113 + CURLOPT_LONG,
      :MAXFILESIZE, 114 + CURLOPT_LONG,
      :INFILESIZE_LARGE, 115 + CURLOPT_OFF_T,
      :RESUME_FROM_LARGE, 116 + CURLOPT_OFF_T,
      :MAXFILESIZE_LARGE, 117 + CURLOPT_OFF_T,
      :NETRC_FILE, 118 + CURLOPT_OBJECTPOINT,
      :USE_SSL, 119 + CURLOPT_LONG,
      :POSTFIELDSIZE_LARGE, 120 + CURLOPT_OFF_T,
      :TCP_NODELAY, 121 + CURLOPT_LONG,
      :FTPSSLAUTH, 129 + CURLOPT_LONG,
      :IOCTLFUNCTION, 130 + CURLOPT_FUNCTIONPOINT,
      :IOCTLDATA, 131 + CURLOPT_OBJECTPOINT,
      :FTP_ACCOUNT, 134 + CURLOPT_OBJECTPOINT,
      :COOKIELIST, 135 + CURLOPT_OBJECTPOINT,
      :IGNORE_CONTENT_LENGTH, 136 + CURLOPT_LONG,
      :FTP_SKIP_PASV_IP, 137 + CURLOPT_LONG,
      :FTP_FILEMETHOD, 138 + CURLOPT_LONG,
      :LOCALPORT, 139 + CURLOPT_LONG,
      :LOCALPORTRANGE, 140 + CURLOPT_LONG,
      :CONNECT_ONLY, 141 + CURLOPT_LONG,
      :CONV_FROM_NETWORK_FUNCTION, 142 + CURLOPT_FUNCTIONPOINT,
      :CONV_TO_NETWORK_FUNCTION, 143 + CURLOPT_FUNCTIONPOINT,
      :CONV_FROM_UTF8_FUNCTION, 144 + CURLOPT_FUNCTIONPOINT,
      :MAX_SEND_SPEED_LARGE, 145 + CURLOPT_OFF_T,
      :MAX_RECV_SPEED_LARGE, 146 + CURLOPT_OFF_T,
      :FTP_ALTERNATIVE_TO_USER, 147 + CURLOPT_OBJECTPOINT,
      :SOCKOPTFUNCTION, 148 + CURLOPT_FUNCTIONPOINT,
      :SOCKOPTDATA, 149 + CURLOPT_OBJECTPOINT,
      :SSL_SESSIONID_CACHE, 150 + CURLOPT_LONG,
      :SSH_AUTH_TYPES, 151 + CURLOPT_LONG,
      :SSH_PUBLIC_KEYFILE, 152 + CURLOPT_OBJECTPOINT,
      :SSH_PRIVATE_KEYFILE, 153 + CURLOPT_OBJECTPOINT,
      :FTP_SSL_CCC, 154 + CURLOPT_LONG,
      :TIMEOUT_MS, 155 + CURLOPT_LONG,
      :CONNECTTIMEOUT_MS, 156 + CURLOPT_LONG,
      :HTTP_TRANSFER_DECODING, 157 + CURLOPT_LONG,
      :HTTP_CONTENT_DECODING, 158 + CURLOPT_LONG,
      :NEW_FILE_PERMS, 159 + CURLOPT_LONG,
      :NEW_DIRECTORY_PERMS, 160 + CURLOPT_LONG,
      :POSTREDIR, 161 + CURLOPT_LONG,
      :SSH_HOST_PUBLIC_KEY_MD5, 162 + CURLOPT_OBJECTPOINT,
      :OPENSOCKETFUNCTION, 163 + CURLOPT_FUNCTIONPOINT,
      :OPENSOCKETDATA, 164 + CURLOPT_OBJECTPOINT,
      :COPYPOSTFIELDS, 165 + CURLOPT_OBJECTPOINT,
      :PROXY_TRANSFER_MODE, 166 + CURLOPT_LONG,
      :SEEKFUNCTION, 167 + CURLOPT_FUNCTIONPOINT,
      :SEEKDATA, 168 + CURLOPT_OBJECTPOINT,
      :CRLFILE, 169 + CURLOPT_OBJECTPOINT,
      :ISSUERCERT, 170 + CURLOPT_OBJECTPOINT,
      :ADDRESS_SCOPE, 171 + CURLOPT_LONG,
      :CERTINFO, 172 + CURLOPT_LONG,
      :USERNAME, 173 + CURLOPT_OBJECTPOINT,
      :PASSWORD, 174 + CURLOPT_OBJECTPOINT,
      :PROXYUSERNAME, 175 + CURLOPT_OBJECTPOINT,
      :PROXYPASSWORD, 176 + CURLOPT_OBJECTPOINT,
      :NOPROXY, 177 + CURLOPT_OBJECTPOINT,
      :TFTP_BLKSIZE, 178 + CURLOPT_LONG,
      :SOCKS5_GSSAPI_SERVICE, 179 + CURLOPT_OBJECTPOINT,
      :SOCKS5_GSSAPI_NEC, 180 + CURLOPT_LONG,
      :PROTOCOLS, 181 + CURLOPT_LONG,
      :REDIR_PROTOCOLS, 182 + CURLOPT_LONG,
      :SSH_KNOWNHOSTS, 183 + CURLOPT_OBJECTPOINT,
      :SSH_KEYFUNCTION, 184 + CURLOPT_FUNCTIONPOINT,
      :SSH_KEYDATA, 185 + CURLOPT_OBJECTPOINT,
      :MAIL_FROM, 186 + CURLOPT_OBJECTPOINT,
      :MAIL_RCPT, 187 + CURLOPT_OBJECTPOINT,
      :FTP_USE_PRET, 188 + CURLOPT_LONG,
      :RTSP_REQUEST, 189 + CURLOPT_LONG,
      :RTSP_SESSION_ID, 190 + CURLOPT_OBJECTPOINT,
      :RTSP_STREAM_URI, 191 + CURLOPT_OBJECTPOINT,
      :RTSP_TRANSPORT, 192 + CURLOPT_OBJECTPOINT,
      :RTSP_CLIENT_CSEQ, 193 + CURLOPT_LONG,
      :RTSP_SERVER_CSEQ, 194 + CURLOPT_LONG,
      :INTERLEAVEDATA, 195 + CURLOPT_OBJECTPOINT,
      :INTERLEAVEFUNCTION, 196 + CURLOPT_FUNCTIONPOINT
    ) unless defined?(CURLoption)

    # easy
    attach_function :curl_easy_init, [], :pointer  # returns CURL*
    attach_function :curl_easy_cleanup, [:pointer], :void
    attach_function :curl_easy_setopt_long,
                    :curl_easy_setopt,
                    [:pointer, CURLoption, :long],
                    CURLcode
    attach_function :curl_easy_setopt_string,
                    :curl_easy_setopt,
                    [:pointer, CURLoption, :string],
                    CURLcode
    attach_function :curl_easy_setopt_function_ptr,
                    :curl_easy_setopt,
                    [:pointer, CURLoption, :pointer],
                    CURLcode

    # This is to suppress libCURL's write callback function.
    BlankWriteCallback = FFI::Function.new(:size_t,
        [:pointer, :size_t, :size_t, :pointer]) do |stream, size, nmemb, value_ptr|
      size * nmemb
    end

    # TODO(dbalatero): implement these for completeness/when we need them?
    # For now, just leave it commented.
    #attach_function :curl_easy_setopt_curl_off_t

    attach_function :curl_easy_perform, [:pointer], CURLcode
    attach_function :curl_easy_getinfo,
                    [:pointer, CURLINFO, :pointer],
                    CURLcode
  end
end
