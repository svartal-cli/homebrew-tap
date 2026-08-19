class Sv < Formula
  desc "Terminal front end for Svartal: sign in, list machines, open shells"
  homepage "https://github.com/svartal-cli/svartal-cli"
  version "0.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/svartal-cli/svartal-cli/releases/download/v#{version}/sv-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "1f82d2d6ecf1d0f0a68635b375a500088557efae8b78d092f818d8e84e9c5d78"
    else
      url "https://github.com/svartal-cli/svartal-cli/releases/download/v#{version}/sv-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "cc05f9a6281fc1b8af38764d84e66b798ee254eb9db05c1c07d0f22582398188"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/svartal-cli/svartal-cli/releases/download/v#{version}/sv-v#{version}-aarch64-unknown-linux-musl.tar.gz"
      sha256 "01542c1f1fa7ce30880cf133e81a894acb577df239928b6009ac4122ef38918e"
    else
      url "https://github.com/svartal-cli/svartal-cli/releases/download/v#{version}/sv-v#{version}-x86_64-unknown-linux-musl.tar.gz"
      sha256 "9f794884e9dd962be52ef93ab7945b990a9564cbf7ab3022de622351d2eb27e3"
    end
  end

  def install
    bin.install "sv"
    # Archives carry completions/ from v0.1.1 on; v0.1.0 is the binary alone.
    bash_completion.install "completions/sv.bash" => "sv" if File.exist?("completions/sv.bash")
    zsh_completion.install "completions/sv.zsh" => "_sv" if File.exist?("completions/sv.zsh")
  end

  test do
    assert_match "sv", shell_output("#{bin}/sv --version")
  end
end
