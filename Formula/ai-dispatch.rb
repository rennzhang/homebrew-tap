class AiDispatch < Formula
  desc "Dispatch tasks to local AI coding CLIs"
  homepage "https://github.com/rennzhang/ai-dispatch"
  version "0.10.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rennzhang/ai-dispatch/releases/download/v0.10.0/ai-dispatch-darwin-arm64.tar.gz"
      sha256 "138cbbe86839f4a2dfba7e9f2940730ff2943b6cb912d46fcb9c235e9111a821"
    else
      url "https://github.com/rennzhang/ai-dispatch/releases/download/v0.10.0/ai-dispatch-darwin-amd64.tar.gz"
      sha256 "780b8416784d957c6232cea2416a3a26fa202b85311f9387dd82d543a9428e53"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rennzhang/ai-dispatch/releases/download/v0.10.0/ai-dispatch-linux-arm64.tar.gz"
      sha256 "36abbe57631e6777541739e61e761d90a0e0a22835ca4d1f1cae4cfc5a703b27"
    else
      url "https://github.com/rennzhang/ai-dispatch/releases/download/v0.10.0/ai-dispatch-linux-amd64.tar.gz"
      sha256 "b9eab45e6b392eeeed2927fce3451e6f9c2c5e9dd1fed64e5b281e09ba1292ed"
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
