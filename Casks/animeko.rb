cask "animeko" do
  arch arm:   "aarch64",
       intel: "x86_64"

  version "5.6.0"
  sha256 arm:   "c1c0e23a4d30ddef4aa6b19bee415f81e20ba2b5cbc3a84ea763ced08776f8ff",
         intel: "9977dc104529845c3c2fe50aed66a2de92449d84c94c375c8505b9a8b6b44119"

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
    strategy :github_latest
  end

  auto_updates true
  conflicts_with cask: "animeko@alpha"
  depends_on macos: :catalina

  app "Ani.app"

  zap trash: [
    "~/Library/Application Support/me.Him188.Ani",
    "~/Library/Caches/me.Him188.Ani",
    "~/Library/Preferences/me.him188.ani.app.desktop.plist",
  ]
end
