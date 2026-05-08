# typed: false
# frozen_string_literal: true

class Kggraph < Formula
  desc "Knowledge graph CLI and MCP server for agents"
  homepage "https://github.com/OctoSucker/KGgraph"
  url "https://github.com/OctoSucker/KGgraph/archive/refs/tags/v0.2.6.tar.gz"
  sha256 "9211edbc663c23e7b4fa57d651b9dc305374f49624c680ccaaf6e90da7a9cb2e"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(output: bin/"kggraph"), "./cmd/kggraph"
  end

  test do
    output = shell_output("#{bin}/kggraph list-nodes --db #{testpath}/kggraph.sqlite")
    assert_match "nodes", output
  end
end
