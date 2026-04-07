cask "animeko" do
  arch arm:   "aarch64",
       intel: "x86_64"

  version "5.4.0"
  sha256 arm:   "4c00e7b73cd1f84b0df7a5e225eb5b771568e7eac7ff2b559c36e11ececad253",
         intel: "670bdfa285f57821d6835e12813fd112636df7ec202370c2e763d3003a257732"

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
