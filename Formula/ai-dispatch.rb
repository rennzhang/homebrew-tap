class AiDispatch < Formula
  desc "Dispatch tasks to local AI coding CLIs"
  homepage "https://github.com/rennzhang/ai-dispatch"
  version "0.10.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rennzhang/ai-dispatch/releases/download/v0.10.1/ai-dispatch-darwin-arm64.tar.gz"
      sha256 "ad77975397fee86fe0805ce3539b1ad48701acc1b1756998eeca0c442a146270"
    else
      url "https://github.com/rennzhang/ai-dispatch/releases/download/v0.10.1/ai-dispatch-darwin-amd64.tar.gz"
      sha256 "6615ce7cbf63d792f959d9c494682385e32b6ae681c66dc417cf93748a2b96e4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rennzhang/ai-dispatch/releases/download/v0.10.1/ai-dispatch-linux-arm64.tar.gz"
      sha256 "0c25f55d9acac99300ba9d84e9eefe72c3d34206a3275c6aec312e98f9716fde"
    else
      url "https://github.com/rennzhang/ai-dispatch/releases/download/v0.10.1/ai-dispatch-linux-amd64.tar.gz"
      sha256 "731ca79940e3bfc7bc860aee0ce26cdbcb404f733b76d5ab85ee0e5182000168"
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
