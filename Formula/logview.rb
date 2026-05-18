# typed: false
# frozen_string_literal: true

class Logview < Formula
  desc "Terminal log viewer with real-time search, highlight and filtering"
  homepage "https://github.com/Miragefl/logview"
  version "0.9.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/Miragefl/logview/releases/download/v0.9.0/logview-darwin_amd64.tar.gz"
      sha256 "6b50db5a664745218349a23935bc7dbfcd350d8a700fcd5b515321d6403b07fe"

      define_method(:install) do
        bin.install "logview-darwin_amd64" => "logview"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/Miragefl/logview/releases/download/v0.9.0/logview-darwin_arm64.tar.gz"
      sha256 "56af12e5f9c26c4a49d3b780c7f341b26a1535275c27c0431a3a83dcd14e4ee2"

      define_method(:install) do
        bin.install "logview-darwin_arm64" => "logview"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/Miragefl/logview/releases/download/v0.9.0/logview-linux_amd64.tar.gz"
      sha256 "616fa42aabce363fb4e0bd28548350de1fb21288cad21d056fb60b3dff624b05"
      define_method(:install) do
        bin.install "logview-linux_amd64" => "logview"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/Miragefl/logview/releases/download/v0.9.0/logview-linux_arm64.tar.gz"
      sha256 "0cfca6ddfb7d31e5165d3c05e411442aaa782ec2144a90c214337ee969282279"
      define_method(:install) do
        bin.install "logview-linux_arm64" => "logview"
      end
    end
  end

  test do
    system "#{bin}/logview", "--help"
  end
end
