class XcbUtilXrm < Formula
  desc "XCB utility functions for the X resource manager"
  homepage "https://github.com/Airblader/xcb-util-xrm"
  url "https://github.com/Airblader/xcb-util-xrm/releases/download/v1.0/xcb-util-xrm-1.0.tar.bz2"
  sha256 "9400ac1ecefdb469b2f6ef6bf0460643b6c252fb8406e91377b89dd12eefbbc0"

  depends_on :x11
  depends_on "pkg-config" => :build

  def install
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    (testpath/"test.c").write <<-EOS.undent
    #include <stdlib.h>
    #include <xcb/xcb_xrm.h>
    int main() {
      return (xcb_xrm_database_from_string("") == NULL)
             ? EXIT_FAILURE
             : EXIT_SUCCESS;
    }
    EOS
    system ENV.cc, "test.c", "-L#{lib}", "-I#{MacOS::X11.include}", "-lxcb-xrm", "-o", "test"
    system "./test"
  end
end
