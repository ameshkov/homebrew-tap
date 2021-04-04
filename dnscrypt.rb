class Dnscrypt < Formula
    desc "DNSCrypt v2 protocol implementation + a command-line tool"
    homepage "https://github.com/ameshkov/dnscrypt"
    url "https://github.com/ameshkov/dnscrypt.git",
        tag:      "v2.1.0",
        revision: "d2deac62436d7c7ea60d1dc79ae4e43f360d2628"
    license "Unlicense License"
  
    depends_on "go" => :build
  
    def install
      system "go", "build", "-ldflags",
               "-X main.VersionString=#{version}",
               *std_go_args,
               "./cmd"
    end
  
    test do
      assert_match version.to_s, shell_output("#{bin}/dnscrypt version")
    end
  end
  