cask "animeko" do
    arch arm:   "aarch64",
         intel: "x86_64"

    version "5.2.0"
    sha256 arm:   "e3d1eb0b93c071e4da7d71733f2b07951c02a1542b73ed74d9fef450a0e70e04",
           intel: "ec068a318ca99d7e01fd21d3027eaa2274e4dfaaa8c2d29244e20b042c397e62"

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
