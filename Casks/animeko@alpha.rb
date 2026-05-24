cask "animeko@alpha" do
  arch arm:   "aarch64",
       intel: "x86_64"

  version "5.5.1"
  sha256 arm:   "0ae4c7cb58ecc6f17fa5734196f56796c555af9b0aff0309bb2e26c6401d0320",
         intel: "1660c998a45612e0de95bfcecbd860f66148e4cfaf09bfec5110e9f5be4d8f1f"

  on_arm do
    url "https://github.com/open-ani/animeko/releases/download/v#{version}/ani-#{version}-macos-#{arch}.dmg",
        verified: "github.com/open-ani/animeko/releases/"
  end
  on_intel do
    url "https://github.com/open-ani/animeko/releases/download/v#{version}/ani-#{version}-macos-#{arch}.zip",
        verified: "github.com/open-ani/animeko/releases/"
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
  depends_on macos: :catalina

  app "Ani.app"

  zap trash: [
    "~/Library/Application Support/me.Him188.Ani",
    "~/Library/Caches/me.Him188.Ani",
    "~/Library/Preferences/me.him188.ani.app.desktop.plist",
  ]
end
