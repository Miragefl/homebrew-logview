# typed: false
# frozen_string_literal: true

class LogviewNightly < Formula
  desc "Terminal log viewer (nightly build)"
  homepage "https://github.com/Miragefl/logview"
  version "0.9.0-nightly-20260519-085455"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/Miragefl/logview/releases/download/nightly/logview-darwin_amd64.tar.gz"
      sha256 "d94f799cd75c25de877c3172da5b8b1e48fbc03dcd7fae796b145ebe1ca0c25e"

      define_method(:install) do
        bin.install "logview-darwin_amd64" => "logview"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/Miragefl/logview/releases/download/nightly/logview-darwin_arm64.tar.gz"
      sha256 "88df73e133c466f5ce13ca46f8e6e72cd05872838cfe35effd98eaff31884571"

      define_method(:install) do
        bin.install "logview-darwin_arm64" => "logview"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/Miragefl/logview/releases/download/nightly/logview-linux_amd64.tar.gz"
      sha256 "c06e3e36a2566b7b450098351b81ec88fdb4de49a750e3571a6e15d033029cee"
      define_method(:install) do
        bin.install "logview-linux_amd64" => "logview"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/Miragefl/logview/releases/download/nightly/logview-linux_arm64.tar.gz"
      sha256 "6b5eb53c613df4bc48e2ab738377825e54112358e8128d85cdfa5f6acda4c4b6"
      define_method(:install) do
        bin.install "logview-linux_arm64" => "logview"
      end
    end
  end

  test do
    system "#{bin}/logview", "--help"
  end
end
