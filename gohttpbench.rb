class Gohttpbench < Formula
    desc "Simple HTTP benchmarking tool that actually works."
    homepage "https://github.com/ameshkov/gohttpbench"
    url "https://github.com/ameshkov/gohttpbench.git",
        tag:      "v1.0.0",
        revision: "ae357bf1d2ed057dc639b6780e61a19f7daa7be0"
    license "MIT"
  
    depends_on "go" => :build
  
    def install
      system "go", "build", "-ldflags",
               "-X main.VersionString=#{version}",
               *std_go_args
    end
  
    test do
      assert_match version.to_s, shell_output("#{bin}/gohttpbench --version")
    end
  end
  