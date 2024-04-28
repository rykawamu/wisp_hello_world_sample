import gleam/io
import gleam/erlang/process
import mist
import wisp
import app/router

pub fn main() {
  io.println("Hello from wisp_hello_world!")
  wisp.configure_logger()
  let secret_key_base = wisp.random_string(64)

  let assert Ok(_) =
    wisp.mist_handler(router.handle_request, secret_key_base)
    |> mist.new
    |> mist.port(8080)
    |> mist.start_http

  process.sleep_forever()
}
