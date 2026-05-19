# typed: false
# frozen_string_literal: true

class LogviewNightly < Formula
  desc "Terminal log viewer (nightly build)"
  homepage "https://github.com/Miragefl/logview"
  version "0.9.0-nightly-20260519"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/Miragefl/logview/releases/download/nightly/logview-darwin_amd64.tar.gz"
      sha256 "01d779a3a52ecf68c66f34cba9e2bb7d9ce03ba005cc43042d642e0306ddf134"

      define_method(:install) do
        bin.install "logview-darwin_amd64" => "logview-nightly"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/Miragefl/logview/releases/download/nightly/logview-darwin_arm64.tar.gz"
      sha256 "c9f47a71e8ebecc8dce237393440da61b2eea1ac67bf3272941885601b93d98d"

      define_method(:install) do
        bin.install "logview-darwin_arm64" => "logview-nightly"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/Miragefl/logview/releases/download/nightly/logview-linux_amd64.tar.gz"
      sha256 "67f65adb73c4ffd2f73ddc649e9a9561652aba96d43633f2bbcab89ae53a295b"
      define_method(:install) do
        bin.install "logview-linux_amd64" => "logview-nightly"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/Miragefl/logview/releases/download/nightly/logview-linux_arm64.tar.gz"
      sha256 "f8ad1033be28a982ed9c1049cd71f246e73300f2f59d4739e1f11d2060bebb67"
      define_method(:install) do
        bin.install "logview-linux_arm64" => "logview-nightly"
      end
    end
  end

  test do
    system "#{bin}/logview", "--help"
  end
end
