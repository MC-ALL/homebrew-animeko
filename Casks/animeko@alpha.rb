cask "animeko@alpha" do
  arch arm:   "aarch64",
       intel: "x86_64"

  version "6.4.0-beta02"
  sha256 arm:   "5bf9f39dbc5d03ba4a7f00e23e6f316475df0048ddada812029bd460dfc52e1d",
         intel: "50c411da4aa8cfd950b52c9310080d664b07bae3ef11b1419b92f9ec3855ff7b"

  on_arm do
    url "https://github.com/open-ani/animeko/releases/download/v#{version}/ani-#{version}-macos-#{arch}.dmg"
  end
  on_intel do
    url "https://github.com/open-ani/animeko/releases/download/v#{version}/ani-#{version}-macos-#{arch}.zip"
  end

  name "Animeko"
  desc "集找番、追番、看番的一站式弹幕追番平台"
  homepage "https://animeko.org/"

  livecheck do
    url "https://api.github.com/repos/open-ani/animeko/releases"
    strategy :page_match
    regex(/v?(\d+(?:\.\d+)+(?:-(?:alpha|beta)\d+))/i)
  end

  auto_updates true
  conflicts_with cask: "animeko"
  depends_on :macos

  app "Ani.app"

  zap trash: [
    "~/Library/Application Support/me.Him188.Ani",
    "~/Library/Caches/me.Him188.Ani",
    "~/Library/Preferences/me.him188.ani.app.desktop.plist",
  ]
end
