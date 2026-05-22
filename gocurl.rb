class Gocurl < Formula
    desc "Simplified version of curl written in pure Go with additional features."
    homepage "https://github.com/ameshkov/gocurl"
    url "https://github.com/ameshkov/gocurl.git",
        tag:      "v1.5.2",
        revision: "6cc2ad5027900a33ac8e4af9d3f2ff98ebd65757"
    license "MIT"
  
    depends_on "go" => :build
  
    def install
      system "go", "build", "-ldflags",
               "-X github.com/ameshkov/gocurl/internal/version.version=#{version}",
               *std_go_args
    end
  
    test do
      assert_match version.to_s, shell_output("#{bin}/gocurl --version")
    end
  end
  