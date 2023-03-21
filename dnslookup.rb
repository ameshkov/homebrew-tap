class Dnslookup < Formula
    desc "Simple command-line utility to make DNS lookups using any protocol"
    homepage "https://github.com/ameshkov/dnslookup"
    url "https://github.com/ameshkov/dnslookup.git",
        tag:      "v1.9.0",
        revision: "dad41048670b1f00c9dad5f20f4ff339a02b8c37"
    license "GPL-3.0-only"
  
    depends_on "go" => :build
  
    def install
      system "go", "build", "-ldflags",
               "-X main.VersionString=#{version}",
               *std_go_args
    end
  
    test do
      assert_match version.to_s, shell_output("#{bin}/dnslookup --version")
      assert_match "dnslookup result", shell_output("#{bin}/dnslookup example.org tls://dns.google")
    end
  end
  