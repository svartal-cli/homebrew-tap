class Sv < Formula
  desc "Terminal front end for Svartal: sign in, list machines, open shells"
  homepage "https://github.com/svartal-cli/svartal-cli"
  version "0.1.13"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/svartal-cli/svartal-cli/releases/download/v#{version}/sv-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "95d7bc4866ff8fb16a1488af548da2aeab1c128780d9732057c0679835f9e078"
    else
      url "https://github.com/svartal-cli/svartal-cli/releases/download/v#{version}/sv-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "18138d7081c4828cbfbc904f2179c554571f4aa5f0ae8a30979a5d6451b78075"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/svartal-cli/svartal-cli/releases/download/v#{version}/sv-v#{version}-aarch64-unknown-linux-musl.tar.gz"
      sha256 "1744a67c8e27840a1439eba6fd4e143b9c5c509a0c3ea861e33a9aa55a3c5791"
    else
      url "https://github.com/svartal-cli/svartal-cli/releases/download/v#{version}/sv-v#{version}-x86_64-unknown-linux-musl.tar.gz"
      sha256 "d113c6e9f8d27eab53c2fe10c6a712df169bd9684e90ba5bc1d57fbb638719c9"
    end
  end

  def install
    bin.install "sv"
    # Archives carry completions/ from v0.1.1 on; v0.1.0 is the binary alone.
    bash_completion.install "completions/sv.bash" => "sv" if File.exist?("completions/sv.bash")
    zsh_completion.install "completions/sv.zsh" => "_sv" if File.exist?("completions/sv.zsh")
  end

  def post_install
    return unless OS.mac?

    system opt_bin/"sv", "browser", "install", "--app-path", opt_prefix/"Svartal CLI.app"
  end

  test do
    assert_match "sv", shell_output("#{bin}/sv --version")
  end
end
