class Dnscrypt < Formula
    desc "DNSCrypt v2 protocol implementation + a command-line tool"
    homepage "https://github.com/ameshkov/dnscrypt"
    url "https://github.com/ameshkov/dnscrypt.git",
        tag:      "v2.4.0",
        revision: "8dcd91eaf47df92ae153750f4ff6562dab3c51ed"
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
  