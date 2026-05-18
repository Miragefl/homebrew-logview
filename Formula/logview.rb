# typed: false
# frozen_string_literal: true

class Logview < Formula
  desc "Terminal log viewer with real-time search, highlight and filtering"
  homepage "https://github.com/Miragefl/logview"
  version "0.8.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/Miragefl/logview/releases/download/v0.8.0/logview-darwin_amd64.tar.gz"
      sha256 "e0a65a39fd14ac6f169728ce8f4c9fb62ff47b46252f6d0401b31d4f4860780a"

      define_method(:install) do
        bin.install "logview-darwin_amd64" => "logview"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/Miragefl/logview/releases/download/v0.8.0/logview-darwin_arm64.tar.gz"
      sha256 "de5ce9cbfbc0738d84826837dacfbc51f89748215e4deaf497f6b28856b99073"

      define_method(:install) do
        bin.install "logview-darwin_arm64" => "logview"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/Miragefl/logview/releases/download/v0.8.0/logview-linux_amd64.tar.gz"
      sha256 "b0e4f87c4776e5f60f63446d2c5c7cca4db4935c47959911c7b42b7d8b147c49"
      define_method(:install) do
        bin.install "logview-linux_amd64" => "logview"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/Miragefl/logview/releases/download/v0.8.0/logview-linux_arm64.tar.gz"
      sha256 "da4b593b51ad4f474053435de3d9162e277cccfe890e5688e8ee6ce8db42178a"
      define_method(:install) do
        bin.install "logview-linux_arm64" => "logview"
      end
    end
  end

  test do
    system "#{bin}/logview", "--help"
  end
end
