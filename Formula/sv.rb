class Sv < Formula
  desc "Terminal front end for Svartal: sign in, list machines, open shells"
  homepage "https://github.com/svartal-cli/svartal-cli"
  version "0.1.9"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/svartal-cli/svartal-cli/releases/download/v#{version}/sv-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "69be00c93368a1b74a6410212848d44788a19a069d0d1b7b3d0ec3b27046f005"
    else
      url "https://github.com/svartal-cli/svartal-cli/releases/download/v#{version}/sv-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "8eb58565269c7cbb67ba5ef1cc36da9aebd55fde11ff6f4fe4950edbda30eff0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/svartal-cli/svartal-cli/releases/download/v#{version}/sv-v#{version}-aarch64-unknown-linux-musl.tar.gz"
      sha256 "a132850dbcf706da3ea1a6550e0547823c8cf1fd17ac2c284c55f8aa25861e13"
    else
      url "https://github.com/svartal-cli/svartal-cli/releases/download/v#{version}/sv-v#{version}-x86_64-unknown-linux-musl.tar.gz"
      sha256 "b96fd26199744766f2d741496a4187035d7b99400a43d91589c928865343b3a5"
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
