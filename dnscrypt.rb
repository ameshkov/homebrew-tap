class Dnscrypt < Formula
    desc "DNSCrypt v2 protocol implementation + a command-line tool"
    homepage "https://github.com/ameshkov/dnscrypt"
    url "https://github.com/ameshkov/dnscrypt.git",
        tag:      "v2.2.7",
        revision: "d84a81e12d38d0269fa019cdd5a805848ff6b36d"
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
  