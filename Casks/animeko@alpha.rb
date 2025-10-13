cask "animeko@alpha" do
    arch arm:   "aarch64",
         intel: "x86_64"

    version "5.1.0-alpha02"
    sha256 arm:   "8efc0698e267de6effdca02d0efd659808851cde67ce0d341803d5fce8207e48",
           intel: "72338dae2b107eea223e0900f684a545d7e74c30f2820d1b02458af2925fc3c9"

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
