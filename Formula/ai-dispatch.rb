class AiDispatch < Formula
  desc "Dispatch tasks to local AI coding CLIs"
  homepage "https://github.com/rennzhang/ai-dispatch"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rennzhang/ai-dispatch/releases/download/v0.6.1/ai-dispatch-darwin-arm64.tar.gz"
      sha256 "1b69c1c3504792741194ef81b5f41bea962a830173df8f927bef7cbe947c4e82"
    else
      url "https://github.com/rennzhang/ai-dispatch/releases/download/v0.6.1/ai-dispatch-darwin-amd64.tar.gz"
      sha256 "a4113547c48b8ab606de0e24fd74df0f105041f486905a2e8ef74950a538fa0c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rennzhang/ai-dispatch/releases/download/v0.6.1/ai-dispatch-linux-arm64.tar.gz"
      sha256 "60c1b2b3c9f93df93a92611928935d9124e4da1a2d437c78a3b9061b080c19f7"
    else
      url "https://github.com/rennzhang/ai-dispatch/releases/download/v0.6.1/ai-dispatch-linux-amd64.tar.gz"
      sha256 "ba08756ddc6eea109a7778b0e46319f9f02624a8469b727a4b98c828b4a73bf5"
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
