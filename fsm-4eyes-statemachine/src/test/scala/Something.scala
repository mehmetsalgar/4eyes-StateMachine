object Something extends App {

    val fruits = List("elma", "armut", "muz")

    val fruitLenghts = for {
      f <- fruits
      if f.length > 4
    } yield f.length

    Thread.sleep(100000L)
}