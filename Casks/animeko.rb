cask "animeko" do
  arch arm:   "aarch64",
       intel: "x86_64"

  version "6.3.0"
  sha256 arm:   "a848920dfa1a193eacbf253b41ada9e723054798c31df17c74efa29575a3864a",
         intel: "8c703ad2e9bd3ee5a823a1e1903ce136725bb71145aa965aecb4b4dd5d15d0f8"

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
    strategy :github_latest
  end

  auto_updates true
  conflicts_with cask: "animeko@alpha"
  depends_on :macos

  app "Ani.app"

  zap trash: [
    "~/Library/Application Support/me.Him188.Ani",
    "~/Library/Caches/me.Him188.Ani",
    "~/Library/Preferences/me.him188.ani.app.desktop.plist",
  ]
end
