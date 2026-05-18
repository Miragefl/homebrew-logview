# typed: false
# frozen_string_literal: true

class Logview < Formula
  desc "Terminal log viewer with real-time search, highlight and filtering"
  homepage "https://github.com/Miragefl/logview"
  version "0.8.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/Miragefl/logview/releases/download/v0.8.0/logview-darwin_amd64.tar.gz"
      sha256 "7f7a894f864d63e5e439c2585984efdacb5fc4e96ea09e3431dd9654bd239d63"

      define_method(:install) do
        bin.install "logview-darwin_amd64" => "logview"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/Miragefl/logview/releases/download/v0.8.0/logview-darwin_arm64.tar.gz"
      sha256 "9da189470e5488b738df3938f1a3749d26b038646738c0971ffef3952dacbcb8"

      define_method(:install) do
        bin.install "logview-darwin_arm64" => "logview"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/Miragefl/logview/releases/download/v0.8.0/logview-linux_amd64.tar.gz"
      sha256 "ebf723652c2c7dba96a6c5364f95faed2c1d7f10c1de1f022fbc155e8af6f034"
      define_method(:install) do
        bin.install "logview-linux_amd64" => "logview"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/Miragefl/logview/releases/download/v0.8.0/logview-linux_arm64.tar.gz"
      sha256 "21e9c9cd6b1c85fcd903d9a4a9dcbbdb29c07900707241a51abfb5615aaa8dc7"
      define_method(:install) do
        bin.install "logview-linux_arm64" => "logview"
      end
    end
  end

  test do
    system "#{bin}/logview", "--help"
  end
end
