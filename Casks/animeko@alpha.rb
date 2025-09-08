cask "animeko@alpha" do
    arch arm:   "aarch64",
         intel: "x86_64"

    version "5.0.0-beta02"
    sha256 arm:   "08c529f891dbda29fe4d0ab406d8fd5250e4a8e4da0a762bd1f9054bf80f707b",
           intel: "3413c8c0e41bcf221c53f54517a1f65a002b7e01e07950f6c215cbda79c94ed0"

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
        url "https://api.github.com/repos/open-ani/animeko/releases"
        strategy :page_match
        regex(/v?(\d+(?:\.\d+)+(?:-alpha\d+))/i)
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
