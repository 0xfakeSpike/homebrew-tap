# typed: false
# frozen_string_literal: true

class Kggraph < Formula
  desc "Knowledge graph CLI and MCP server for agents"
  homepage "https://github.com/OctoSucker/KGgraph"
  url "https://github.com/OctoSucker/KGgraph/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "fae6fcb0f40fdc96e4f51400af3e634c6a0549c73b63fc455150273332fcebe9"
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
