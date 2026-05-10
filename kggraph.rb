# typed: false
# frozen_string_literal: true

class Kggraph < Formula
  desc "Knowledge graph CLI and MCP server for agents"
  homepage "https://github.com/OctoSucker/KGgraph"
  url "https://github.com/OctoSucker/KGgraph/archive/refs/tags/v0.2.7.tar.gz"
  sha256 "79f6e119a45201a05afed90e2274982a33def071e837bf2287b66f5fbdaf5bb4"
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
