class Dnscrypt < Formula
    desc "DNSCrypt v2 protocol implementation + a command-line tool"
    homepage "https://github.com/ameshkov/dnscrypt"
    url "https://github.com/ameshkov/dnscrypt.git",
        tag:      "v2.2.5",
        revision: "aeff5955671d7e1198cd1d388d343d6992232f4c"
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
  