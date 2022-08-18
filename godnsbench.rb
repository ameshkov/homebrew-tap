class Dnslookup < Formula
    desc "Simple DNS bench util that supports encrypted protocols."
    homepage "https://github.com/ameshkov/godnsbench"
    url "https://github.com/ameshkov/godnsbench.git",
        tag:      "v1.0",
        revision: "18edc1f3d6c945ea8699b44e464db1eb5e1c95fa"
    license "MIT"
  
    depends_on "go" => :build
  
    def install
      system "go", "build", "-ldflags",
               "-X main.VersionString=#{version}",
               *std_go_args
    end
  
    test do
      assert_match version.to_s, shell_output("#{bin}/godnsbench -v")
    end
  end
  