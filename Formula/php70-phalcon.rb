require File.expand_path("../../Abstract/abstract-php-extension", __FILE__)

class Php70Phalcon < AbstractPhp70Extension
  init
  desc "Full-stack PHP framework"
  homepage "https://phalconphp.com/"
  url "https://github.com/phalcon/cphalcon/archive/v3.3.2.tar.gz"
  sha256 "823fd693a7e9e8999edfd405970a81b7bf731fa28109a64774216fc5f68d2975"
  head "https://github.com/phalcon/cphalcon.git"

  bottle do
    cellar :any_skip_relocation
    rebuild 1
    sha256 "bab2d8887398b130e055a86f5f272a2efdb38e4a27cc66cd76a348133c111b65" => :high_sierra
  end

  depends_on "pcre"

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
