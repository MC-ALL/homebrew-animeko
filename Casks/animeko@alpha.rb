cask "animeko@alpha" do
  arch arm:   "aarch64",
       intel: "x86_64"

  version "5.4.3"
  sha256 arm:   "2132a8c679cbcf5f69b4f30146bbfa9c08d1d4fad1000ce864c2a3a0f8951bca",
         intel: "54d244e785f29094f2fa3b636416d643b7031ae2c2b0c25761c5908a44209a07"

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
