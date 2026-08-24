#import "@local/ftn77-thesis:0.1.0": style as default

// Override your styles here. You can start from default style or scratch.
// The base style is applied to all content besides forms and cover, main is applied
// only to pages with chapters, form and form-heading define uni form styling
// and cover is only for its page. Form and cover page default styles are adaptive
// (just set absolute font size) and may work sufficiently on different page sizes.

// Any style here is optional (as all defaults are included by the below line)
// including the whole file. You may use the default styling by not passing any style
// to the `thesis` function.
#import default: *

#let cover(body) = context {
  show: default.cover

  set heading(outlined: true)

  body
}

#let base(body) = {
  show: default.base

  set text(11pt)

  body
}

#let main = default.main
#let cover = default.cover
// ... see default style module
