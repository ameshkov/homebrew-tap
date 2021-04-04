class Dnslookup < Formula
    desc "Simple command-line utility to make DNS lookups using any protocol"
    homepage "https://github.com/ameshkov/dnslookup"
    url "https://github.com/ameshkov/dnslookup.git",
        tag:      "v1.4.8",
        revision: "b0feb9b2afa3fed00bd19fd2d21935b4d666d75d"
    license "GPL-3.0-only"
  
    depends_on "go" => :build
  
    def install
      system "go", "build", "-ldflags",
               "-X main.VersionString=#{version}",
               *std_go_args
    end
  
    test do
      assert_match version.to_s, shell_output("#{bin}/dnslookup -v")
      assert_match "dnslookup result", shell_output("#{bin}/dnslookup example.org tls://dns.google")
    end
  end
  