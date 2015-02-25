class Cwm < Formula
  homepage "https://github.com/chneukirchen/cwm"
  url "https://github.com/chneukirchen/cwm/archive/v5.6.tar.gz"
  sha1 "637f615a2a5944070cfe2a5fd0125daa461967b5"

  bottle do
    cellar :any
    sha1 "4794ec9443e9ff59c3af6f85ba0bbac08fad496e" => :mavericks
    sha1 "2750622d8304cc2a008586e4b7b3cc6bfa82b3e2" => :mountain_lion
    sha1 "28a681a7185ab875e77eb664679c21751e871855" => :lion
  end

  depends_on :x11
  depends_on "pkg-config" => :build

  patch do
    # Fix 10.10 build. Merged upstream.
    url "https://github.com/chneukirchen/cwm/commit/81c05b3.diff"
    sha1 "adf1c676b693051d3c5dc964d8681eaf45b11dd7"
  end

  def install
    system "make", "PREFIX=#{prefix}", "install"
  end
end
