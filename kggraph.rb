# typed: false
# frozen_string_literal: true

class Kggraph < Formula
  desc "Knowledge graph CLI and MCP server for agents"
  homepage "https://github.com/OctoSucker/KGgraph"
  url "https://github.com/OctoSucker/KGgraph/archive/refs/tags/v0.2.8.tar.gz"
  sha256 "0c1894056d3b140be8498a4a299efa44baf3ffc7c2ca8a5821e103779e707410"
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
