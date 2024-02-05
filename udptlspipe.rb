class Udptlspipe < Formula
    desc "TLS wrapper UDP connections with active probing protection."
    homepage "https://github.com/ameshkov/udptlspipe"
    url "https://github.com/ameshkov/udptlspipe.git",
        tag:      "v1.2.2",
        revision: "59d5faaa8a5ada529fc8824415670b50e73c2c37"
    license "MIT"
  
    depends_on "go" => :build
  
    def install
      system "go", "build", "-ldflags",
               "-X github.com/ameshkov/udptlspipe/internal/version.version=#{version}",
               *std_go_args
    end
  
    test do
      assert_match version.to_s, shell_output("#{bin}/udptlspipe --version")
    end
  end
  