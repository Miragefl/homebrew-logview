# typed: false
# frozen_string_literal: true

class Logview < Formula
  desc "Terminal log viewer with real-time search, highlight and filtering"
  homepage "https://github.com/Miragefl/logview"
  version "0.7.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/Miragefl/logview/releases/download/v0.7.0/logview-darwin_amd64.tar.gz"
      sha256 "5b943925459236de2009d273f307624b0809df5b0e5475d97a57b8a711ae6f00"

      define_method(:install) do
        bin.install "logview-darwin_amd64" => "logview"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/Miragefl/logview/releases/download/v0.7.0/logview-darwin_arm64.tar.gz"
      sha256 "79f89f8628b8bce995bb4e4f3a8f8b9d5cdcb3c0f5ed57eed513817b710c2c00"

      define_method(:install) do
        bin.install "logview-darwin_arm64" => "logview"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/Miragefl/logview/releases/download/v0.7.0/logview-linux_amd64.tar.gz"
      sha256 "cc95527d9c6030e224ee4ef2ebee55f12d156da6148173b66b73f9075f57d7f5"
      define_method(:install) do
        bin.install "logview-linux_amd64" => "logview"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/Miragefl/logview/releases/download/v0.7.0/logview-linux_arm64.tar.gz"
      sha256 "6a0381beeb6c96ddb2f2ca22b64ad6429784dcf04acae7fc7a4de4b0514fa776"
      define_method(:install) do
        bin.install "logview-linux_arm64" => "logview"
      end
    end
  end

  test do
    system "#{bin}/logview", "--help"
  end
end
