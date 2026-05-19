# typed: false
# frozen_string_literal: true

class Logview < Formula
  desc "Terminal log viewer with real-time search, highlight and filtering"
  homepage "https://github.com/Miragefl/logview"
  version "0.10.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/Miragefl/logview/releases/download/v0.10.0/logview-darwin_amd64.tar.gz"
      sha256 "431f895f4970d5927adba68ed435158287ddf93fec0aea2386a049352fa3e3dd"

      define_method(:install) do
        bin.install "logview-darwin_amd64" => "logview"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/Miragefl/logview/releases/download/v0.10.0/logview-darwin_arm64.tar.gz"
      sha256 "a47fed39b35fa35913a296d3826e4996f82b38f3ffb00dc8a42ef001602834de"

      define_method(:install) do
        bin.install "logview-darwin_arm64" => "logview"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/Miragefl/logview/releases/download/v0.10.0/logview-linux_amd64.tar.gz"
      sha256 "8ef5ad507a26aa68b974b1f11711bdbfc626faccf16bca7127f97266af96b157"
      define_method(:install) do
        bin.install "logview-linux_amd64" => "logview"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/Miragefl/logview/releases/download/v0.10.0/logview-linux_arm64.tar.gz"
      sha256 "ad7646ab0d6b1aa7a7584535e76129acc6bfec128a089b661e114ac1f77fe6d8"
      define_method(:install) do
        bin.install "logview-linux_arm64" => "logview"
      end
    end
  end

  test do
    system "#{bin}/logview", "--help"
  end
end
