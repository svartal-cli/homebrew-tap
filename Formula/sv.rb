class Sv < Formula
  desc "Terminal front end for Svartal: sign in, list machines, open shells"
  homepage "https://github.com/svartal-cli/svartal-cli"
  version "0.1.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/svartal-cli/svartal-cli/releases/download/v#{version}/sv-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "043afe5b695a5d1be5e41da502c01c3c40c5be1c5303e054a305528580cc7824"
    else
      url "https://github.com/svartal-cli/svartal-cli/releases/download/v#{version}/sv-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "65e7f19f5fa0d082402ab67b377264815e4f574ee7066433c352ebe3e99100a0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/svartal-cli/svartal-cli/releases/download/v#{version}/sv-v#{version}-aarch64-unknown-linux-musl.tar.gz"
      sha256 "bc95bfab7a938bc7a992fd2427c22839e6d7717e0a7b2f5d7c5f9e03080b1e53"
    else
      url "https://github.com/svartal-cli/svartal-cli/releases/download/v#{version}/sv-v#{version}-x86_64-unknown-linux-musl.tar.gz"
      sha256 "0a20fcd16e403db7ee9385f400d6570ffd8ed42d02f549face5ab8d45d221ced"
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
