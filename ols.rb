class Ols < Formula
  desc "Automatic building & install of OpenBench LogicSniffer software. After install, 'ols' command is available to start it. Does not install a .app to /Applications"
  homepage ""
  url "https://github.com/jawi/ols/archive/refs/heads/master.zip"
  version "0.9.8-SNAPSHOT"

  depends_on "maven" => :build

  def install
    system "./build.sh", "-DskipTests", "-Dmaven.test.skip=true", "clean", "install"
    prefix.install Dir["ols.distribution/target/ols-0.9.8-SNAPSHOT-full/ols-0.9.8-SNAPSHOT/*"]
    # then create run script in keg?
    bin.write_exec_script prefix/"run.sh"
    mv bin/"run.sh", bin/"ols"
  end

  test do
    system "true"
  end
end
