class I3lock < Formula
  desc "Simple screen locker"
  homepage "http://i3wm.org/i3lock"
  url "http://i3wm.org/i3lock/i3lock-2.8.tar.bz2"
  sha256 "028fc0f74df10826514d5a4ed38f6895935d1f5d47ca9fcffc64b076aaf6e2f4"

  depends_on :x11
  depends_on "libev"
  depends_on "libxkbcommon"
  depends_on "cairo" => ["with-x11"]
  depends_on "pkg-config" => :build

  def install
    system "make", "PREFIX=#{prefix}", "SYSCONFDIR=#{prefix}/etc", "install"
    man1.install "i3lock.1"
  end

  def caveats; <<-EOS.undent
    In order to use #{name} with Mac OS X symlink the following file to
    the required system location:

    % sudo ln -s #{HOMEBREW_PREFIX}/etc/pam.d/i3lock /etc/pam.d/i3lock

    NOTE: When uninstalling #{name} the symlink needs to be removed manually.
    EOS
  end

  test do
    result = shell_output("#{bin}/i3lock -v 2>&1")
    result.force_encoding("UTF-8") if result.respond_to?(:force_encoding)
    assert_match version.to_s, result
  end
end
