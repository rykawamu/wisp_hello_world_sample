# wisp_hello_world

[![Package Version](https://img.shields.io/hexpm/v/wisp_hello_world)](https://hex.pm/packages/wisp_hello_world)
[![Hex Docs](https://img.shields.io/badge/hex-docs-ffaff3)](https://hexdocs.pm/wisp_hello_world/)

```sh
gleam add wisp_hello_world
```
```gleam
import wisp_hello_world

pub fn main() {
  // TODO: An example of the project in use
}
```

Further documentation can be found at <https://hexdocs.pm/wisp_hello_world>.

## Development

```sh
gleam run   # Run the project
gleam test  # Run the tests
gleam shell # Run an Erlang shell
```

## アクセスについて

### Fizzbuzzについて

### peopleについて

#### localhost:8080/people

GETでアクセスすると、peopleの一覧がjson形式で返ってくる。

データが登録されている場合には、生データとしては以下のようなデータが返ってくる。

```sh
{"people":[{"id":"wnriN_ByHYAFw5HY9vFE3"},{"id":"2YEXjqcV75lYhHPi9q68R"},{"id":"dKS6i2hDdJHAspA_mctqA"}]}
```

POSTでアクセスすると、データを登録できる。
登録に成功すると、`tmp/data`ディレクトリ配下に、`id`がファイル名となって、jsonデータがファイル中に記録されている。

以下、データ投入例。

```sh
curl -X POST -H "Content-Type: application/json" -d '{"name" : "saya" , "favourite-colour" : "blue"}' localhost:8080/people
```

失敗時には、405、413、400のいずれかのHTTPレスポンスが返ってくる。

成功すると、レスポンスにはidの値がjson形式で返ってくる。

```sh
{"id":"wnriN_ByHYAFw5HY9vFE3"}
```

#### localhost:8080/people/id

idを指定すると、該当するidを持つデータが表示される。

ここで、idとは数字（0や1）ではなく、ファイル名にも利用されている`wnriN_ByHYAFw5HY9vFE3`なので、注意。

「localhost:8080/people/wnriN_ByHYAFw5HY9vFE3」のようにアクセスする。

レスポンスには、idに即したデータが返ってくる。

```sh
{"id":"wnriN_ByHYAFw5HY9vFE3","name":"saya","favourite-colour":"blue"}
```
