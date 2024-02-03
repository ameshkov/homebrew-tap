class Udptlspipe < Formula
    desc "TLS wrapper UDP connections with active probing protection."
    homepage "https://github.com/ameshkov/udptlspipe"
    url "https://github.com/ameshkov/udptlspipe.git",
        tag:      "v1.0.1",
        revision: "5594319c8d6839708e2d192851068ff07ce4a301"
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
  