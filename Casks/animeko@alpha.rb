cask "animeko" do
    arch arm:   "aarch64",
         intel: "x86_64"

    version "5.0.0-alpha04"
    sha256 arm:   "90fc859f731ab445ea866a3ede24cb1111a58954d8329842d9e80093edf99a44",
           intel: "f89a1a3e33a88ae97c024d165075d2b9c1ec56c2370bf95c127ed4ba00d88a40"

    on_arm do
        url "https://github.com/open-ani/animeko/releases/download/v#{version}/ani-#{version}-macos-#{arch}.dmg",
            verified: "github.com/open-ani/animeko/releases/"
    end
  
    on_intel do
        url "https://github.com/open-ani/animeko/releases/ani-#{version}-macos-#{arch}.zip",
            verified: "github.com/open-ani/animeko/releases/"
    end

    name "Animeko"
    desc "集找番、追番、看番的一站式弹幕追番平台"
    homepage "https://animeko.org/"
    conflicts_with cask: "animeko"

    livecheck do
        url :url
        strategy :page_match
        regex(/v?(\d+(?:\.\d+)+(?:-alpha\d+)?)/i)
    end

    auto_updates true
    depends_on macos: ">= :catalina"

    app "Ani.app"

    zap trash: [
        "~/Library/Application Support/me.Him188.Ani",
        "~/Library/Caches/me.Him188.Ani",
        "~/Library/Preferences/me.him188.ani.app.desktop.plist",
    ]
end
