class Xcprune < Formula
  desc "Find unused images, colors, and localization keys in an Xcode project"
  homepage "https://github.com/helgafinn/xcprune"
  url "https://github.com/helgafinn/xcprune/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "500646663f841b3855d37498bd2fc0bb97f7666002d495922e25e2863f9ad6c8"
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
