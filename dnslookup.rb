class Dnslookup < Formula
    desc "Simple command-line utility to make DNS lookups using any protocol"
    homepage "https://github.com/ameshkov/dnslookup"
    url "https://github.com/ameshkov/dnslookup.git",
        tag:      "v1.10.0",
        revision: "0acf48e76e643c5c87af3f7ebb02cb0d01bb4842"
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
  