cask "animeko" do
    arch arm:   "aarch64",
         intel: "x86_64"

    version "5.0.1"
    sha256 arm:   "cf4d9860ad2606d18c675775c19244f93fbaa681084b19e90a82de0520538842",
           intel: "4786975e55efde836d8040b58888dd4aa6b281947ba4d3b48a2191d6ca338504"

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
