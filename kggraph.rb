# typed: false
# frozen_string_literal: true

class Kggraph < Formula
  desc "Knowledge graph CLI and MCP server for agents"
  homepage "https://github.com/OctoSucker/KGgraph"
<<<<<<< HEAD
  url "https://github.com/OctoSucker/KGgraph/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "fae6fcb0f40fdc96e4f51400af3e634c6a0549c73b63fc455150273332fcebe9"
=======
  url "https://github.com/OctoSucker/KGgraph/archive/refs/tags/v0.2.1.tar.gz"
  sha256 "d7817ecabf095ee6e30008c82ca3376cd1fdb4355e13e7b8475aed19cf839439"
>>>>>>> ec32120 (chore: update kggraph formula to v0.2.1)
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
