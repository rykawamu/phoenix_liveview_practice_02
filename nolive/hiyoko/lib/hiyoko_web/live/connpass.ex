defmodule HiyokoWeb.Connpass do
  use Phoenix.LiveView

  def render( assigns ) do
    HiyokoWeb.ConnpassView.render("connpasslist.html",assigns)
  end

  def mount( _params, _session, socket ) do
    { :ok, assign( socket,
                   message: "[Init]",
                   results: [], maxcnt: 0,
                   query: "20190601", keyword: "elixir" ) }
  end

  def handle_event( "submit",
        %{ "query" => query, "keyword"=>keyword }, socket ) do
    send( self(), { :submit, query, keyword } )
    {:noreply, assign( socket,
                       message: "[Searching]",
                       query: query, keyword: keyword ) }
  end

  def handle_info( { :submit, query, keyword }, socket ) do
    host = "https://connpass.com"
    path_list = ["/api/v1/event/?",
                 "ymd=#{query}&",
                 "keyword=#{keyword}&",
                 "count=50&",
                 "order=2"]
    path = Enum.join(path_list, "")
    results = Json.get("#{host}", "#{path}")
    maxcnt = results["results_available"]
    events = results["events"]

    {:noreply, assign( socket,
                       message: "[Complete!!]",
                       results: events, maxcnt: maxcnt ) }
  end
end
