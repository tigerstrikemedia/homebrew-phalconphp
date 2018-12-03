require File.expand_path("../../Abstract/abstract-php-extension", __FILE__)

class Php56Phalcon < AbstractPhp56Extension
  init
  desc "Full-stack PHP framework"
  homepage "https://phalconphp.com/"
  url "https://github.com/phalcon/cphalcon/archive/v3.4.2.zip"
  sha256 "be73da92f75609aef8a56dd7d906df559fa6de82fbc2668b74aba125389a0d93"
  head "https://github.com/phalcon/cphalcon.git"

  depends_on "pcre"

  bottle do
    cellar :any_skip_relocation
    sha256 "23efebbdab8c44b6811fa9cdac23a8c176de85c5b66fb93ed0bf959ae82d06d3" => :high_sierra
  end

  def install
    Dir.chdir "build/php5/64bits"

    safe_phpize
    system "./configure", "--prefix=#{prefix}",
                          phpconfig,
                          "--enable-phalcon"
    system "make"
    prefix.install "modules/phalcon.so"
    write_config_file if build.with? "config-file"
  end
end
