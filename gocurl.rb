class Gocurl < Formula
    desc "SNI proxy with embedded DNS server that supports blocking and forwarding rules."
    homepage "https://github.com/ameshkov/gocurl"
    url "https://github.com/ameshkov/gocurl.git",
        tag:      "v1.0.0",
        revision: "230186554b998226718699a5cd815db3f3664bad"
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
  