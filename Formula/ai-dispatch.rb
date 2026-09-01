class AiDispatch < Formula
  desc "Dispatch tasks to local AI coding CLIs"
  homepage "https://github.com/rennzhang/ai-dispatch"
  version "0.7.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rennzhang/ai-dispatch/releases/download/v0.7.0/ai-dispatch-darwin-arm64.tar.gz"
      sha256 "63fc40a575b60b2f79b95f7da94ba39e32178ebd9a9bd781748b816a5bcb8177"
    else
      url "https://github.com/rennzhang/ai-dispatch/releases/download/v0.7.0/ai-dispatch-darwin-amd64.tar.gz"
      sha256 "7e8350212eabf5cd973869ef1b98ab23845159a93c979619b1ef07b09191f2ec"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rennzhang/ai-dispatch/releases/download/v0.7.0/ai-dispatch-linux-arm64.tar.gz"
      sha256 "e247a4c3698a3fe93882cbb7408439a2a23fd68e02517ebe54389fa2dce67b8e"
    else
      url "https://github.com/rennzhang/ai-dispatch/releases/download/v0.7.0/ai-dispatch-linux-amd64.tar.gz"
      sha256 "47cee1788778a474308242264ad00f139c657ea39ad8e6a967b3f8754343df9d"
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
