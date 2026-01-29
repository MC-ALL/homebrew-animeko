cask "animeko@alpha" do
    arch arm:   "aarch64",
         intel: "x86_64"

    version "5.3.0-beta01"
    sha256 arm:   "2569edc10934d5e7e919b1b6a19f7cd6a07924a43b3d51b56288867df3d7ac89",
           intel: "f43543679cc6f41add34a0d014abdf1fd7d721b139cab2cd15a7ca8768efcf6f"

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
