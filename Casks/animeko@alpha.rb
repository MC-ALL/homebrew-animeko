cask "animeko@alpha" do
    arch arm:   "aarch64",
         intel: "x86_64"

    version "5.3.0-alpha02"
    sha256 arm:   "c2d24ffe3af221b4aaba8e74e92a79f1e1f57a0861bbbe22934663814b31bd7a",
           intel: "8154a2d2db05c634cf0a70077bedb9a8763fc62b362a354f26ba567e349b8239"

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
    conflicts_with cask: "animeko"

    livecheck do
        url "https://api.github.com/repos/open-ani/animeko/releases"
        strategy :page_match
        regex(/v?(\d+(?:\.\d+)+(?:-(?:alpha|beta)\d+))/i)
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
