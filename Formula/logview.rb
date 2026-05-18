# typed: false
# frozen_string_literal: true

class Logview < Formula
  desc "Terminal log viewer with real-time search, highlight and filtering"
  homepage "https://github.com/Miragefl/logview"
  version "0.6.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/Miragefl/logview/releases/download/v0.6.0/logview-darwin_amd64.tar.gz"
      sha256 "20797ba6a781645007f107c5afc4162d5b04922aa9218cc6bc002d229a854616"

      define_method(:install) do
        bin.install "logview-darwin_amd64" => "logview"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/Miragefl/logview/releases/download/v0.6.0/logview-darwin_arm64.tar.gz"
      sha256 "afc982f4bb7e6e372630fd9f935a92ea6b4bbdb74054ef300a777fe8ebe8ca3f"

      define_method(:install) do
        bin.install "logview-darwin_arm64" => "logview"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/Miragefl/logview/releases/download/v0.6.0/logview-linux_amd64.tar.gz"
      sha256 "4c4d3c6a4c700dbb158ccf734ee74c537e61673825247b970f80a465a2553ad7"
      define_method(:install) do
        bin.install "logview-linux_amd64" => "logview"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/Miragefl/logview/releases/download/v0.6.0/logview-linux_arm64.tar.gz"
      sha256 "44c2dd615378ffe413da6d747ec4e3000a4d834b9a69040365638c3d5a3cca84"
      define_method(:install) do
        bin.install "logview-linux_arm64" => "logview"
      end
    end
  end

  test do
    system "#{bin}/logview", "--help"
  end
end
