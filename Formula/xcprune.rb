class Xcprune < Formula
  desc "Find unused images, colors, and localization keys in an Xcode project"
  homepage "https://github.com/helgafinn/xcprune"
  url "https://github.com/helgafinn/xcprune/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "269fe15e4067314320148aeb062fa0bd85a01a4c1917d4a0c4ce9128bc8419bc"
  license "MIT"
  head "https://github.com/helgafinn/xcprune.git", branch: "main"

  depends_on xcode: ["14.0", :build]
  depends_on :macos

  def install
    system "swift", "build", "--disable-sandbox", "-c", "release"
    bin.install ".build/release/xcprune"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/xcprune --version")

    # A tree with one asset nothing references should report exactly that.
    (testpath/"Assets.xcassets/orphan.imageset").mkpath
    (testpath/"Assets.xcassets/orphan.imageset/Contents.json").write(
      '{"info":{"version":1,"author":"xcode"}}',
    )
    (testpath/"View.swift").write("let unrelated = 1\n")

    output = shell_output("#{bin}/xcprune #{testpath}")
    assert_match "orphan", output
  end
end
