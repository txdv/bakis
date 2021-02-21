package lt.vu.mif.bentkus.bachelor.compiler.parser.skylark

import lt.vu.mif.bentkus.bachelor.compiler.lexer.{Lexer, Span}
import lt.vu.mif.bentkus.bachelor.compiler.parser.Parser

object SkylarkApp extends App {
  import java.io.File
  import java.nio.file.Files

  val content = Files.readAllBytes(new File(args(0)).toPath)

  val s = Parser.parse(Skylark.expressions, Lexer.lexAll(Span(content)).toList)
  println(s)
}
