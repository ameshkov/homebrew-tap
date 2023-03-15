class Sniproxy < Formula
    desc "SNI proxy with embedded DNS server that supports blocking and forwarding rules."
    homepage "https://github.com/ameshkov/sniproxy"
    url "https://github.com/ameshkov/sniproxy.git",
        tag:      "v1.3",
        revision: "f66c64cf81ec694745883ab279042d506caa9c82"
    license "Apache-2.0"
  
    depends_on "go" => :build
  
    def install
      system "go", "build", "-ldflags",
               "-X github.com/ameshkov/sniproxy/internal/cmd.VersionString=#{version}",
               *std_go_args
    end
  
    test do
      assert_match version.to_s, shell_output("#{bin}/sniproxy --version")
    end
  end
  