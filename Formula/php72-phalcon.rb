require File.expand_path("../../Abstract/abstract-php-extension", __FILE__)

class Php72Phalcon < AbstractPhp72Extension
  init
  desc "Full-stack PHP framework"
  homepage "https://phalconphp.com/"
  url "https://github.com/phalcon/cphalcon/archive/v3.4.2.zip"
  sha256 "be73da92f75609aef8a56dd7d906df559fa6de82fbc2668b74aba125389a0d93"
  head "https://github.com/phalcon/cphalcon.git"

  depends_on "pcre"

  bottle do
    cellar :any_skip_relocation
    rebuild 1
    sha256 "28b76f11d151c70959c40d47c8916a0a8621a5e8b04ca3748de2215a9c3a7525" => :high_sierra
  end

  def install
    Dir.chdir "build/php7/64bits"

    safe_phpize
    system "./configure", "--prefix=#{prefix}",
                          phpconfig,
                          "--enable-phalcon"
    system "make"
    prefix.install "modules/phalcon.so"
    write_config_file if build.with? "config-file"
  end
end
