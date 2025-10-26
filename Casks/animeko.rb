cask "animeko" do
    arch arm:   "aarch64",
         intel: "x86_64"

    version "5.1.0"
    sha256 arm:   "06286f21c11c9f9b66f4f31862609ca4d68f1b98c3ad2b22e56e2e23fe6ef458",
           intel: "371ad79d2767b33327e5471fcebab5ea65e3bea9c0c2cf95235411e8b19202a7"

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
    conflicts_with cask: "animeko@alpha"

    livecheck do
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
