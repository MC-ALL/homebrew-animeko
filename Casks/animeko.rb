cask "animeko" do
    arch arm:   "aarch64",
         intel: "x86_64"

    version "5.3.1"
    sha256 arm:   "95c8f953fc3ea81a8ed28800f3742afa0db2f90568426211232a1382e0568db6",
           intel: "fdf24bc06269d7cbe677b90878a61a20cfa1433d88f77b6fc26dc9e33b3b1a08"

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
