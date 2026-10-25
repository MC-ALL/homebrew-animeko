cask "animeko@alpha" do
  arch arm:   "aarch64",
       intel: "x86_64"

  version "6.4.0"
  sha256 arm:   "7786595edad99dc2f82d9de552d0b7151236a2a8a48f1aeeaa913b92f0fd8810",
         intel: "fb4805450305699088c7679bfc5c333289c78a8d5c1ccf2ada946ee3cc078f61"

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
