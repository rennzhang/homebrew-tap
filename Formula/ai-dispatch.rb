class AiDispatch < Formula
  desc "Dispatch tasks to local AI coding CLIs"
  homepage "https://github.com/rennzhang/ai-dispatch"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rennzhang/ai-dispatch/releases/download/v0.5.0/ai-dispatch-darwin-arm64.tar.gz"
      sha256 "05d3f5412705620bad47b7ed05a76e654716aaadabbcdf068644e377e26a53cb"
    else
      url "https://github.com/rennzhang/ai-dispatch/releases/download/v0.5.0/ai-dispatch-darwin-amd64.tar.gz"
      sha256 "b5a6d596cd1607f7249f13178840b65bcd5c59195c4be59d6ef802320c2bc9eb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rennzhang/ai-dispatch/releases/download/v0.5.0/ai-dispatch-linux-arm64.tar.gz"
      sha256 "59759895a25db5646a13cf28804064c24f58ee76b441eab459c340e8e7a04670"
    else
      url "https://github.com/rennzhang/ai-dispatch/releases/download/v0.5.0/ai-dispatch-linux-amd64.tar.gz"
      sha256 "c9d214586e730017cc3812cdc3b443fe1f4f99e75bb427dce94755e132514f0e"
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
