cask "sv-browser" do
  version "0.1.14"
  sha256 "e54bf6d8e0d7b41fa2e8059e55fa9c0e669983af91829ea7b8fab6fa12aa9f59"
  url "https://github.com/svartal-cli/svartal-cli/releases/download/v#{version}/sv-v#{version}-browser.tar.gz"

  name "Svartal CLI browser integration"
  desc "sv:// link handler built and owned by the Svartal CLI"
  homepage "https://github.com/svartal-cli/svartal-cli"
  depends_on formula: ["svartal-cli/tap/sv", "svartal-cli/tap/sv-browser-runtime"]

  preflight do
    system_command "#{HOMEBREW_PREFIX}/opt/sv-browser-runtime/bin/sv",
                   args: ["browser", "build",
                          "--app-path", "#{staged_path}/Svartal CLI.app",
                          "--client", "#{HOMEBREW_PREFIX}/opt/sv-browser-runtime/bin/sv"]
  end

  app "Svartal CLI.app"
end
