class Godnsbench < Formula
    desc "Simple DNS bench util that supports encrypted protocols."
    homepage "https://github.com/ameshkov/godnsbench"
    url "https://github.com/ameshkov/godnsbench.git",
        tag:      "v1.10.0",
        revision: "f8b483df2c8298001d98022b14402500609caa68"
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
  