class AiDispatch < Formula
  desc "Dispatch tasks to local AI coding CLIs"
  homepage "https://github.com/rennzhang/ai-dispatch"
  version "0.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rennzhang/ai-dispatch/releases/download/v0.4.0/ai-dispatch-darwin-arm64.tar.gz"
      sha256 "d828c0f1957e4a26e52a43a2da29f5a144d2458e7d72466cb126699569435cb2"
    else
      url "https://github.com/rennzhang/ai-dispatch/releases/download/v0.4.0/ai-dispatch-darwin-amd64.tar.gz"
      sha256 "78fdbe9db883c3b7fe381cf42081a62102ce5041e7de9a687ba781ec4c09132e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rennzhang/ai-dispatch/releases/download/v0.4.0/ai-dispatch-linux-arm64.tar.gz"
      sha256 "83bda39bba076d59a2810598c16ef8c0198fd72a427d62dbb09966a25a1b4821"
    else
      url "https://github.com/rennzhang/ai-dispatch/releases/download/v0.4.0/ai-dispatch-linux-amd64.tar.gz"
      sha256 "2c31fcf20c494dd7ead3853e446168e96986b04be691b0d01bd8fca666223b03"
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
