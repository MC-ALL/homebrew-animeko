cask "animeko@alpha" do
  arch arm:   "aarch64",
       intel: "x86_64"

  version "6.4.0-beta01"
  sha256 arm:   "f0d3cbf46f8e74edd6920bcf80ce5a1428d862b3aaf27e192dd72d7eecf3992b",
         intel: "02579ba2bcfca04571c660be1c84780ba9c956d95bf6ef6ce8825fb75f260071"

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
