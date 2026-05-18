# typed: false
# frozen_string_literal: true

class Logview < Formula
  desc "Terminal log viewer with real-time search, highlight and filtering"
  homepage "https://github.com/Miragefl/logview"
  version "0.5.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/Miragefl/logview/releases/download/v0.5.0/logview_0.5.0_darwin_amd64.tar.gz"
      sha256 "4600a4eebd0b019823b7d5c70042c2710f488ac1dcccaf66f1b748129e933fca"

      define_method(:install) do
        bin.install "logview-amd64" => "logview"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/Miragefl/logview/releases/download/v0.5.0/logview_0.5.0_darwin_arm64.tar.gz"
      sha256 "7af27af5b86b5c8a5e9446cd4ebf83f56811d03cd46e579eeb2e31d07ddf10e6"

      define_method(:install) do
        bin.install "logview-arm64" => "logview"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/Miragefl/logview/releases/download/v0.5.0/logview_0.5.0_linux_amd64.tar.gz"
      sha256 "0244401c01903e0d64e6aaf7c7c7fbfbeb10069b0e46b2339294aab7109f3fb3"
      define_method(:install) do
        bin.install "logview-linux-amd64" => "logview"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/Miragefl/logview/releases/download/v0.5.0/logview_0.5.0_linux_arm64.tar.gz"
      sha256 "3d2752c234a010a86eb4a32518df8fffe6896c76d31876c16c1570a5dabc6158"
      define_method(:install) do
        bin.install "logview-linux-arm64" => "logview"
      end
    end
  end

  test do
    system "#{bin}/logview", "--help"
  end
end
