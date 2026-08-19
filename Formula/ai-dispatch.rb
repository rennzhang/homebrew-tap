class AiDispatch < Formula
  desc "Dispatch tasks to local AI coding CLIs"
  homepage "https://github.com/rennzhang/ai-dispatch"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rennzhang/ai-dispatch/releases/download/v0.6.2/ai-dispatch-darwin-arm64.tar.gz"
      sha256 "1162270defd7ce05c45dfbcd3456844ceec1393ba7ba3ab765b7e1c6f7be4245"
    else
      url "https://github.com/rennzhang/ai-dispatch/releases/download/v0.6.2/ai-dispatch-darwin-amd64.tar.gz"
      sha256 "a1a940330d29c732a2f7dc35f9fc8014dee4799942fa522de40b54e187995c62"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rennzhang/ai-dispatch/releases/download/v0.6.2/ai-dispatch-linux-arm64.tar.gz"
      sha256 "af9a21b31d7a93c5c6e83b778c7da56d1f27c4e444193cab9df9d2f4bf0f4c29"
    else
      url "https://github.com/rennzhang/ai-dispatch/releases/download/v0.6.2/ai-dispatch-linux-amd64.tar.gz"
      sha256 "7ac3a7de3bac12e866442103d4d715828a76d670d0c20cf735aae280afc75882"
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
