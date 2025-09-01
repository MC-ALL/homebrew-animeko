cask "animeko" do
    arch arm:   "aarch64",
         intel: "x86_64"

    version "4.11.1"
    sha256 arm:   "3054d31acf841f403ca58d2ea21c778fba93d09bc2ca75221ac50241dca93d25",
           intel: "049a8c1b413e1619fc7b24807f6d24d3bb0fdd4120b9d9fc30ae029e95e663bb"

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

    livecheck do
        url :url
        strategy :github_latest
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
