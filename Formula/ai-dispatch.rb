class AiDispatch < Formula
  desc "Dispatch tasks to local AI coding CLIs"
  homepage "https://github.com/rennzhang/ai-dispatch"
  version "0.7.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rennzhang/ai-dispatch/releases/download/v0.7.4/ai-dispatch-darwin-arm64.tar.gz"
      sha256 "4f135448ad6a298569b6b6d7c91fd416c99c98fe028d29d73f51e742be3556ad"
    else
      url "https://github.com/rennzhang/ai-dispatch/releases/download/v0.7.4/ai-dispatch-darwin-amd64.tar.gz"
      sha256 "5b315134207fea306d95f73b9b8ac837f4a0f034deae68c637b132cdcf26c4fd"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rennzhang/ai-dispatch/releases/download/v0.7.4/ai-dispatch-linux-arm64.tar.gz"
      sha256 "3a72f47367aff029e5fb57898fec92c579edddf2c5a4c6293ecd59d169f1c310"
    else
      url "https://github.com/rennzhang/ai-dispatch/releases/download/v0.7.4/ai-dispatch-linux-amd64.tar.gz"
      sha256 "c3eecb0c39c1625ddae12754028dd84efed34b8ac221500bf6aee00ad83acf7d"
    end
  end

  def install
    bin.install "scripts/ai-dispatch-go" => "ai-dispatch"
  end

  test do
    output = shell_output("#{bin}/ai-dispatch doctor --format json")
    assert_match '"ok":true', output
  end
end
