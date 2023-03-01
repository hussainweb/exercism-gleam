import gleam/iterator.{Done, Next, to_list, unfold}
import gleam/list.{append, at}
import gleam/result.{unwrap}

pub fn rows(total_rows: Int) -> List(List(Int)) {
  do_rows(total_rows, [])
}

fn do_rows(row: Int, acc: List(List(Int))) -> List(List(Int)) {
  case row {
    1 -> [[1]]
    n -> {
      let acc = do_rows(n - 1, acc)
      // n-2 because our rows are 1-based and `at` expects 0-based
      let row_above = unwrap(at(acc, n - 2), [])
      let current_row = build_row(n, row_above)
      append(acc, [current_row])
    }
  }
}

fn build_row(row: Int, row_above: List(Int)) -> List(Int) {
  unfold(
    row,
    fn(n) {
      case n {
        0 -> Done
        n ->
          // n is 1-based and we need to convert that to 0-based below
          Next(get_left(n - 1, row_above) + get_right(n - 1, row_above), n - 1)
      }
    },
  )
  |> to_list
}

fn get_left(idx: Int, row_above: List(Int)) -> Int {
  // `unwrap` will give us 0 if the element doesn't exist, which is what we want.
  unwrap(at(row_above, idx - 1), 0)
}

fn get_right(idx: Int, row_above: List(Int)) -> Int {
  // `unwrap` will give us 0 if the element doesn't exist, which is what we want.
  unwrap(at(row_above, idx), 0)
}
