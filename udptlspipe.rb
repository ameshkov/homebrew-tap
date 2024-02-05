class Udptlspipe < Formula
    desc "TLS wrapper UDP connections with active probing protection."
    homepage "https://github.com/ameshkov/udptlspipe"
    url "https://github.com/ameshkov/udptlspipe.git",
        tag:      "v1.3.0",
        revision: "62cfee72c64921842ddb2a103d6982fe6abbf7cb"
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
  