---
title: "Inline-css and abstraction in Elm"
tags: programming elm
---

On the poleprediction website I've started using inline styles (with Tailwind) to style the app. This is working pretty well so far. I've noticed a slight difference in how things are abstracted, when you want to avoid writing the same code twice. I'm not quite sure yet whether this represents a positive, or a negative for inline styling.

Suppose you wish to render a score. You might do something like the following:

```elm
viewScore : Int -> Html msg
viewScore score =
    Html.span
        []
        [ score |> String.fromInt |> Html.text ]
```

Now suppose you wish to put the score in a circle, with a blue background and white text. If you're doing this with a traditional style sheet, you might might do the following:

```diff
viewScore : Int -> Html msg
viewScore score =
    Html.span
-        []
+        [ Attributes.class "score" ]
        [ score |> String.fromInt |> Html.text ]
```

```css
.score {
    border-radius: 50%;
    background-color: blue;
    color: white;
    height: 2em;
    width: 2em;
}
```

Now, if you're doing this with inline styling you can do:


```elm
viewScore : Int -> Html msg
viewScore score =
    Html.span
        [ [ Css.borderRadius (Css.pct 50)
          , Css.backgroundColor (Css.color "blue")
          , Css.color "white"
          , Css.height (Css.em 2)
          , Css.width (Css.em 2)
          ]
            |> Attributes.css
        ]
        [ score |> String.fromInt |> Html.text ]
```

So far pretty similar. On the one hand the inline-styles let you put your styling right where you can see it. On the other hand it kind of means that the logic of styling clutters up the logic of the actual app.

Now suppose you wish the score to have a light red background and black text if it is 


