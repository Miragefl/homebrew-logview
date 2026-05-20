# typed: false
# frozen_string_literal: true

class Logview < Formula
  desc "Terminal log viewer with real-time search, highlight and filtering"
  homepage "https://github.com/Miragefl/logview"
  version "0.11.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/Miragefl/logview/releases/download/v0.11.0/logview-darwin_amd64.tar.gz"
      sha256 "41b7267c189bf10d0dc5bf91247df42e4fa7233b29d20904bccd7c04a8ff04d4"

      define_method(:install) do
        bin.install "logview-darwin_amd64" => "logview"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/Miragefl/logview/releases/download/v0.11.0/logview-darwin_arm64.tar.gz"
      sha256 "d0f9f02687a1ed49c95a540027fc7cfe09b19e590247033ba2f488570ce77fb1"

      define_method(:install) do
        bin.install "logview-darwin_arm64" => "logview"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/Miragefl/logview/releases/download/v0.11.0/logview-linux_amd64.tar.gz"
      sha256 "93f1cfe9719f7cac2546bf703619834a7a2e175b9164d99ca6723b987cc36c7f"
      define_method(:install) do
        bin.install "logview-linux_amd64" => "logview"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/Miragefl/logview/releases/download/v0.11.0/logview-linux_arm64.tar.gz"
      sha256 "6ef53c8a6206dc49233bee49820ed0c7465ffc560425628476efc3036127ad7b"
      define_method(:install) do
        bin.install "logview-linux_arm64" => "logview"
      end
    end
  end

  test do
    system "#{bin}/logview", "--help"
  end
end
