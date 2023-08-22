class Sniproxy < Formula
    desc "SNI proxy with embedded DNS server that supports blocking and forwarding rules."
    homepage "https://github.com/ameshkov/sniproxy"
    url "https://github.com/ameshkov/sniproxy.git",
        tag:      "v1.5.1",
        revision: "4885ba054218fc95805b364c74577c152626eb58"
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
  