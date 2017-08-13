ExUnit.start()
ExVCR.Config.cassette_library_dir("test/fixture/vcr_cassettes")
ExVCR.Config.filter_url_params(true)
ExVCR.Config.response_headers_blacklist(["Set-Cookie", "CF-RAY"])