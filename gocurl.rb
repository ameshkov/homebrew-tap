class Gocurl < Formula
    desc "Simplified version of curl written in pure Go with additional features."
    homepage "https://github.com/ameshkov/gocurl"
    url "https://github.com/ameshkov/gocurl.git",
        tag:      "v1.5.1",
        revision: "2378b32ba42869a866ae1a6b915b86284ed02248"
    license "MIT"
  
    depends_on "go" => :build
  
    def install
      system "go", "build", "-ldflags",
               "-X github.com/ameshkov/gocurl/internal/version.version=#{version}",
               *std_go_args
    end
  
    test do
      assert_match version.to_s, shell_output("#{bin}/gocurl --version")
    end
  end
  