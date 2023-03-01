pub fn square_of_sum(n: Int) -> Int {
  let sum = summation(n)
  sum * sum
}

pub fn sum_of_squares(n: Int) -> Int {
  case n {
    1 -> 1
    n -> n * n + sum_of_squares(n - 1)
  }
}

pub fn difference(n: Int) -> Int {
  square_of_sum(n) - sum_of_squares(n)
}

fn summation(n: Int) -> Int {
  n * { n + 1 } / 2
}
