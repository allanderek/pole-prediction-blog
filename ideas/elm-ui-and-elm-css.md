---
title: "Elm ui and Elm css"
tags: elm 
---

I think that Elm-ui and Elm-css both start from a similar premise: Writing code in Elm is really nice, but CSS is often frustrating, wouldn't it be great if I could just write my styling in Elm instead. Elm-css approaches this by basically saying: *we still want to write CSS, we just want to do it in a type-safe and functional manner (functions being good for abstraction, css is already declarative)*. Elm-ui is something of an abstraction of CSS, which is a kin to attempting to provide a library that states *Just declare what you're trying to achieve, and this library will achieve it*. 

Whilst I have looked into elm-ui a little, I haven't given it much of a fair chance, so I'm going to focus on Elm-css here. However, I'm talking about the more general principle of having your styling code mixed into your document code. As such this mostly applies to both styles.


Here, I'm going to be talking about using elm-css in a similar way to elm-ui, that is to define inline styling on HTML elements. As opposed to defining your CSS in elm which is then used to generate a `styles.css` file. 

## Inline advantages

The major advantage here is that it's possible to write an entirely self-contained *element*. Here is an example taken from the elm-css documentation:

```elm
{-| A logo image, with inline styles that change on hover.
-}
logo : Html msg
logo =
    img
        [ src "logo.png"
        , css
            [ display inlineBlock
            , padding (px 20)
            , border3 (px 5) solid (rgb 120 120 120)
            , hover
                [ borderColor theme.primary
                , borderRadius (px 10)
                ]
            ]
        ]
        []

```

If you were to do this in Elm + ordinary css, you would have to do something like:

```elm
logo : Html msg
logo =
    img
        [ src "logo.png"
        , class "logo"
        ]
        []
```
and then in your `styles.css` (or wherever you write your styles):

```css
.logo {
    display: inline-block;
    padding: 20px;
    border: 5px solid rgb(120, 120, 120) 
}
```

In a complex project, this can go wrong. If you change, or remove the class `logo` from the logo image, your styling won't apply. Obviously this is probably a touch unlikely for an element named `logo`, but much less common/central elements it's certainly possible. You might also just entirely remove the `logo` element from your design, but you're left with some needless css. Finally you might think the associated css is now unused and remove it, when in fact this element is displayed in some uncommon scenario such as an error message.
