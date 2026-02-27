cask "animeko" do
    arch arm:   "aarch64",
         intel: "x86_64"

    version "5.3.2"
    sha256 arm:   "d3bac466fa7c8bb331beb279ffab0ab300508fbd26535fd01e8ae3bf700f7e7d",
           intel: "accbfbb439f9d92b15952ff74d8c6a8bd13dfa56735f3bd86db18267e3b650bd"

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
