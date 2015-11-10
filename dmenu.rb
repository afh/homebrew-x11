class Dmenu < Formula
  homepage "http://tools.suckless.org/dmenu/"
  url "http://dl.suckless.org/tools/dmenu-4.6.tar.gz"
  sha256 "4a7a24008a621c3cd656155ad91ab8136db8f0d3b9ec56dafeec518cabda96b3"
  bottle do
    cellar :any
    sha1 "54caf91cc564300d67e0ced4dc8ae65584b1276a" => :mavericks
    sha1 "2630df757da0902c41254ecf4eedaa14fb5138ba" => :mountain_lion
    sha1 "364bca930070125a3cfcbf8769ef53bb20d84a92" => :lion
  end

  head "http://git.suckless.org/dmenu/", :using => :git

  depends_on :x11

  def install
    system "make", "PREFIX=#{prefix}", "install"
  end

  test do
    assert_match /#{version}/, shell_output("#{bin}/dmenu -v")
  end
end
