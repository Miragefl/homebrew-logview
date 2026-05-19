# typed: false
# frozen_string_literal: true

class LogviewNightly < Formula
  desc "Terminal log viewer (nightly build)"
  homepage "https://github.com/Miragefl/logview"
  version "0.9.0-nightly-20260519"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/Miragefl/logview/releases/download/nightly/logview-darwin_amd64.tar.gz"
      sha256 "81edca878b4f79e8a7772f4bc07dc467dd8524ef90747bfca24f946b9459cf6b"

      define_method(:install) do
        bin.install "logview-darwin_amd64" => "logview"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/Miragefl/logview/releases/download/nightly/logview-darwin_arm64.tar.gz"
      sha256 "8390e4b12336af0bf20aa018bf5849f589c106445b509f2f9e193eec2d6f7b1d"

      define_method(:install) do
        bin.install "logview-darwin_arm64" => "logview"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/Miragefl/logview/releases/download/nightly/logview-linux_amd64.tar.gz"
      sha256 "80f4979ecd72c1088ec72efba5b3f5ee98da4614113d93407f00fb80d5f220d6"
      define_method(:install) do
        bin.install "logview-linux_amd64" => "logview"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/Miragefl/logview/releases/download/nightly/logview-linux_arm64.tar.gz"
      sha256 "15eedf5feb923cff4eb2d3782e783a041e5909f3de51fd13fe0944c75d966e68"
      define_method(:install) do
        bin.install "logview-linux_arm64" => "logview"
      end
    end
  end

  test do
    system "#{bin}/logview", "--help"
  end
end
