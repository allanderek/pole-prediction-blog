module Posts exposing (main)

import Elmstatic
import Html
import Html.Attributes as Attributes
import Page
import Post


main : Elmstatic.Layout
main =
    let
        postItem post =
            Html.div
                []
                [ Html.a
                    [ Attributes.href ("/" ++ post.link) ]
                    [ Html.h2 [] [ Html.text post.title ] ]
                , Post.metadataHtml post
                ]

        postListContent posts =
            if List.isEmpty posts then
                [ Html.text "No posts yet!" ]

            else
                List.map postItem posts

        sortPosts posts =
            List.sortBy .date posts
                |> List.reverse
    in
    Elmstatic.layout Elmstatic.decodePostList <|
        \content ->
            Ok <| Page.layout content.title <| postListContent <| sortPosts content.posts
