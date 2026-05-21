# typed: false
# frozen_string_literal: true

class LogviewNightly < Formula
  desc "Terminal log viewer (nightly build)"
  homepage "https://github.com/Miragefl/logview"
  version "0.11.0-5-g98c0d69-nightly-20260521-024655"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/Miragefl/logview/releases/download/nightly/logview-darwin_amd64.tar.gz"
      sha256 "1dad1d0a52809d6a91df39e9bb8e5e8eb2eeecdba4e4ae16c1192cc19b6f81f8"

      define_method(:install) do
        bin.install "logview-darwin_amd64" => "logview"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/Miragefl/logview/releases/download/nightly/logview-darwin_arm64.tar.gz"
      sha256 "6d9664c1cfe136b80cad735d80e9e12491823cca78b98d4d195d5b84bac1942e"

      define_method(:install) do
        bin.install "logview-darwin_arm64" => "logview"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/Miragefl/logview/releases/download/nightly/logview-linux_amd64.tar.gz"
      sha256 "08fc7af84fabaebe12f4a81b333f18c3ee2aafcd89871458c37c02e705de068b"
      define_method(:install) do
        bin.install "logview-linux_amd64" => "logview"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/Miragefl/logview/releases/download/nightly/logview-linux_arm64.tar.gz"
      sha256 "db92087ec99784b1aed09cc6f5d5ce052e88ffb9e1bc4eb7b434db2b692ff0b8"
      define_method(:install) do
        bin.install "logview-linux_arm64" => "logview"
      end
    end
  end

  test do
    system "#{bin}/logview", "--help"
  end
end
