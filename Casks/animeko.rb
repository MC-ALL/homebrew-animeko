cask "animeko" do
  arch arm:   "aarch64",
       intel: "x86_64"

  version "5.5.2"
  sha256 arm:   "dd93e487c242ae70b640dc79353af50085df8bdced72896c7a63b666b7060f45",
         intel: "eca39aa00534b529e35692743e1b960c61b843041b010d49f8ad5eac70a7c191"

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
