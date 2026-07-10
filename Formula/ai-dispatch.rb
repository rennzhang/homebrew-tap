class AiDispatch < Formula
  desc "Dispatch tasks to local AI coding CLIs"
  homepage "https://github.com/rennzhang/ai-dispatch"
  version "0.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rennzhang/ai-dispatch/releases/download/v0.3.0/ai-dispatch-darwin-arm64.tar.gz"
      sha256 "e8cd5df14c71b1ccca8ec0270a51c790872808cc00726cef74a3607912da7d02"
    else
      url "https://github.com/rennzhang/ai-dispatch/releases/download/v0.3.0/ai-dispatch-darwin-amd64.tar.gz"
      sha256 "c52c996dfd3822ae41de8c5267c18cb446b69151c513123a343decb3f74c6c66"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rennzhang/ai-dispatch/releases/download/v0.3.0/ai-dispatch-linux-arm64.tar.gz"
      sha256 "58666613c8ce53c85b9ad06fc1220684efec85efa451583a2a53ae1c98655654"
    else
      url "https://github.com/rennzhang/ai-dispatch/releases/download/v0.3.0/ai-dispatch-linux-amd64.tar.gz"
      sha256 "9ce912ac664f44d24dff5dfaedb0b7d36a1ba1ca7e3a9024e4c3953f17f6f8ad"
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
