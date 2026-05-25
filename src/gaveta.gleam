import gleam/int
import gleam/list
import gleam/option
import gleam/result
import gleam/string

pub fn extract_page_from_link(
  headers: List(#(String, String)),
  rel: String,
) -> option.Option(Int) {
  headers
  |> list.find_map(fn(h) {
    let #(name, value) = h

    case name == "link" {
      False -> Error(Nil)
      True ->
        value
        |> string.split(", ")
        |> list.find_map(fn(part) {
          let rel_param = "rel=\"" <> rel <> "\""

          case string.split_once(part, "; ") {
            Ok(#(url, r)) if r == rel_param ->
              url
              |> string.drop_start(1)
              |> string.drop_end(1)
              |> string.split("page=")
              |> list.last
              |> result.try(int.parse)
            _ -> Error(Nil)
          }
        })
    }
  })
  |> option.from_result
}
