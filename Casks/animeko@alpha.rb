cask "animeko@alpha" do
  arch arm:   "aarch64",
       intel: "x86_64"

  version "5.4.0-beta04"
  sha256 arm:   "febb22e1ddf253ecfd34acec95fdfc0bd812e370bbe5b1edf1a49fdbc86538cf",
         intel: "dcecb2ee825885f9d4966b1ff9864facf3b6bc4216c0778b9374af4d5f1b233e"

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
  depends_on macos: ">= :catalina"

  app "Ani.app"

  zap trash: [
    "~/Library/Application Support/me.Him188.Ani",
    "~/Library/Caches/me.Him188.Ani",
    "~/Library/Preferences/me.him188.ani.app.desktop.plist",
  ]
end
