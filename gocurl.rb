class Gocurl < Formula
    desc "SNI proxy with embedded DNS server that supports blocking and forwarding rules."
    homepage "https://github.com/ameshkov/gocurl"
    url "https://github.com/ameshkov/gocurl.git",
        tag:      "v1.4.1",
        revision: "1c1070a975566f073ae7d72271c28c6a9bbac40d"
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
  