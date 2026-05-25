import gaveta
import gleam/option
import gleeunit

pub fn main() -> Nil {
  gleeunit.main()
}

pub fn extract_page_from_link_test() -> Nil {
  let headers = [#("cache-control", "private, max-age=60, s-maxage=60")]

  let headers_with_link = [
    #("cache-control", "private, max-age=60, s-maxage=60"),
    #(
      "link",
      "<https://api.github.com/user/repos?visibility=all&affiliation=owner&per_page=100&page=2>; rel=\"next\", <https://api.github.com/user/repos?visibility=all&affiliation=owner&per_page=100&page=4>; rel=\"last\"",
    ),
  ]

  assert gaveta.extract_page_from_link(headers, "next") == option.None
  assert gaveta.extract_page_from_link(headers_with_link, "prev") == option.None

  assert gaveta.extract_page_from_link(headers_with_link, "next")
    == option.Some(2)
  assert gaveta.extract_page_from_link(headers_with_link, "last")
    == option.Some(4)
}
