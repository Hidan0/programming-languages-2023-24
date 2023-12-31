object Ex1 {
  def is_palindrome(str: String): Boolean = {
    var parsed = str.map((c: Char) => c.toLower).filter((c: Char) => c.isLetter)
    parsed == parsed.reverse
  }

  def is_an_anagram(str: String, dict: List[String]): Boolean = {
    dict
      .map((s: String) => s.toSeq.sorted.unwrap)
      .filter((s: String) => s.equals(str.toSeq.sorted.unwrap))
      .lengthIs >= 1
  }

  def factors(
      num: BigInt,
      start: BigInt = 2,
      acc: List[BigInt] = Nil
  ): List[BigInt] = {
    LazyList
      .iterate(start)(i => i + 1)
      .takeWhile(n => n <= num)
      .find(n => num % n == 0)
      .map(n => factors(num / n, n, acc :+ n))
      .getOrElse(acc)
  }

  def is_proper(number: Int): Boolean = {
    ((2 until number).collect { case x if number % x == 0 => x}).sum == number - 1
  }
}

object Main extends App {
  List("detartrated", "Do geese see God?", "Rise to vote, sir.", "nope.")
    .map((input: String) =>
      f"is_palindrome(\"$input\") = ${Ex1.is_palindrome(input)}\n"
    )
    .foreach(print)

  val dict =
    List(
      "incerta",
      "trincea",
      "cartine",
      "citarne",
      "pratesi",
      "espatrio",
      "tar"
    )

  List("", "carenti", "sparite", "luigi", "rat")
    .map((input: String) =>
      f"is_an_anagram(\"$input\") = ${Ex1.is_an_anagram(input, dict)}\n"
    )
    .foreach(print)

  List(25, 400, 1970, 42, 7, 32523, 534587)
    .map(num => f"factors(\"$num\") = ${Ex1.factors(num)}\n")
    .foreach(print)
 
  List(6, 7, 28, 41, 496)
    .map(num => f"is_proper(\"$num\") = ${Ex1.is_proper(num)}\n")
    .foreach(print)   
}
