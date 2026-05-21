# typed: false
# frozen_string_literal: true

class Logview < Formula
  desc "Terminal log viewer with real-time search, highlight and filtering"
  homepage "https://github.com/Miragefl/logview"
  version "0.12.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/Miragefl/logview/releases/download/v0.12.0/logview-darwin_amd64.tar.gz"
      sha256 "fe0b9eff3b5f0f68e31fb28fc882778d9db0cca73f1c3d9f9bc83d82cb8d44bf"

      define_method(:install) do
        bin.install "logview-darwin_amd64" => "logview"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/Miragefl/logview/releases/download/v0.12.0/logview-darwin_arm64.tar.gz"
      sha256 "3ce6c10011c2ae4c0b524e47a74bcc4cf2cc44fbff58274345528dba46920a1c"

      define_method(:install) do
        bin.install "logview-darwin_arm64" => "logview"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/Miragefl/logview/releases/download/v0.12.0/logview-linux_amd64.tar.gz"
      sha256 "7d823108a27c7d31b6ad39575a0ff1d88e40819f9ecc654178b07b90a8ad826c"
      define_method(:install) do
        bin.install "logview-linux_amd64" => "logview"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/Miragefl/logview/releases/download/v0.12.0/logview-linux_arm64.tar.gz"
      sha256 "c02ede88cb9743b97a540205ea1a2c23d7bb5bc82c37b034aa865f7a07c10e98"
      define_method(:install) do
        bin.install "logview-linux_arm64" => "logview"
      end
    end
  end

  test do
    system "#{bin}/logview", "--help"
  end
end
