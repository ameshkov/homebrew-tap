class Godnsbench < Formula
    desc "Simple DNS bench util that supports encrypted protocols."
    homepage "https://github.com/ameshkov/godnsbench"
    url "https://github.com/ameshkov/godnsbench.git",
        tag:      "v1.9.0",
        revision: "1c6b9b87ea246da0e40e07a622879b423763b027"
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
  