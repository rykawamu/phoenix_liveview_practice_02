# phoenix_liveview_practice_02

「[phoenix_liveview_practice_01](https://github.com/rykawamu/phoenix_liveview_practice_01)」を、Elixir1.10系およびPhoenix 1.5系向けに改修。

 * live : `--live`オプションを付与して、LiveView対応にしたプロジェクト
 * nolive :  `--live`オプションをつけないで、LiveView非対応にしたプロジェクト

Phoenix LiveViewを利用した検索機能の例。

以下の順にコマンドを実行する。

 * $ cd hiyoko
 * $ mix deps.get
 * $ npm install --prefix assets
 * $ iex -S mix phx.server

サーバが起動したら、以下のURLにアクセスする。

<http://localhost:4000/connpass>
