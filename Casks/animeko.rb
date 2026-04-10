cask "animeko" do
  arch arm:   "aarch64",
       intel: "x86_64"

  version "5.4.1"
  sha256 arm:   "cfd484a1b6a00fef910d3063503061c59b5d0a62e94240223c937b3138622994",
         intel: "984feefff4cde6266265fe4c3d2335506821b5a4e3435a4729e0752eb600b3c1"

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
  depends_on macos: ">= :catalina"

  app "Ani.app"

  zap trash: [
    "~/Library/Application Support/me.Him188.Ani",
    "~/Library/Caches/me.Him188.Ani",
    "~/Library/Preferences/me.him188.ani.app.desktop.plist",
  ]
end
