class Udptlspipe < Formula
    desc "TLS wrapper UDP connections with active probing protection."
    homepage "https://github.com/ameshkov/udptlspipe"
    url "https://github.com/ameshkov/udptlspipe.git",
        tag:      "v1.3.1",
        revision: "2704c3e9b764304ee32a9bc6cca9a4a2ed139a2d"
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
  