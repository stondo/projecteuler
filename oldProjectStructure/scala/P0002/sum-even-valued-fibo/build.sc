// build.sc
import mill._, scalalib._, scalafmt._

object SumEvenValuedFibo extends ScalaModule with ScalafmtModule {
  def scalaVersion = "2.13.1"

  object test extends Tests {
    def ivyDeps = Agg(ivy"org.scalatest::scalatest:3.1.1")
    def testFrameworks = Seq("org.scalatest.tools.Framework")
  }
}
