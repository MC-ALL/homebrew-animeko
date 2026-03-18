cask "animeko@alpha" do
    arch arm:   "aarch64",
         intel: "x86_64"

    version "5.4.0-beta02"
    sha256 arm:   "f348b3db975ef71727e5e276c62da2a35c9be25a240de50519d3773838347654",
           intel: "88fcffa86e1aebfdcc7fec66aebf58e6dddbf98f1cb81c270b14624dcad439cc"

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
