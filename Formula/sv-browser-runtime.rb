class SvBrowserRuntime < Formula
  desc "Private sv runtime for the sv-browser cask"
  homepage "https://github.com/svartal-cli/svartal-cli"
  version "0.1.14"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/svartal-cli/svartal-cli/releases/download/v#{version}/sv-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "0b47b94b545c1587ebcd8b9d15bf5e9a8e594c2abad536359c942efc44e21e3d"
    else
      url "https://github.com/svartal-cli/svartal-cli/releases/download/v#{version}/sv-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "2e13ea86ba8756dd4d166655085682bf30a33dc0767dbe7f12e0f43a33cb6424"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/svartal-cli/svartal-cli/releases/download/v#{version}/sv-v#{version}-aarch64-unknown-linux-musl.tar.gz"
      sha256 "ebd0d1454d3080679b2deedf0281faea6794786e5915bf449002e0fa548dc6dd"
    else
      url "https://github.com/svartal-cli/svartal-cli/releases/download/v#{version}/sv-v#{version}-x86_64-unknown-linux-musl.tar.gz"
      sha256 "a775499b4af41ef996ccac287c4b2c2469ff2536999d020872b0698e28b09979"
    end
  end

  keg_only "private runtime for the sv-browser cask"

  def install
    bin.install "sv"
  end

  test do
    assert_match "sv", shell_output("#{bin}/sv --version")
  end
end
