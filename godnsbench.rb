class Godnsbench < Formula
    desc "Simple DNS bench util that supports encrypted protocols."
    homepage "https://github.com/ameshkov/godnsbench"
    url "https://github.com/ameshkov/godnsbench.git",
        tag:      "v1.1",
        revision: "02ba5b38bba5c4489cf5e5eeebbfe2c159723658"
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
  