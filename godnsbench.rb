class Godnsbench < Formula
    desc "Simple DNS bench util that supports encrypted protocols."
    homepage "https://github.com/ameshkov/godnsbench"
    url "https://github.com/ameshkov/godnsbench.git",
        tag:      "v1.7",
        revision: "cf30c8da1e8bc2d2ddcc84f20a050a17f0edcf83"
    license "MIT"
  
    depends_on "go" => :build
  
    def install
      system "go", "build", "-ldflags",
               "-X main.VersionString=#{version}",
               *std_go_args
    end
  
    test do
      assert_match version.to_s, shell_output("#{bin}/godnsbench --version")
    end
  end
  