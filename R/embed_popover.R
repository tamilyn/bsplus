#' Popover
#'
#' A popover can be a useful way to add a somewhat-verbose explanation to a tag.
#'
#' To activate the use of popovers in your page, you will need to call
#' the \code{use_bs_popover()} function somewhere.
#'
#' The verb \emph{embed} is used to signify that you are embedding information
#' into a \code{tag}. This implies that you can embed, at most, one "thing"
#' into a particular \code{tag}. You should not, for example, expect to embed both a tooltip
#' and a popover into a \code{tag}.
#'
#' @param tag        \code{htmltools::\link[htmltools]{tag}}, generally
#'   \code{<button/>} or \code{<a/>}, into which to embed the popover
#' @param title      character, title for the popover, generally text
#' @param content    character, content for the popover body, can be HTML
#' @param placement  character, placement of the popover with respect to \code{tag}
#' @param ...        other named arguments, passed to \code{bs_set_data()}
#'
#' @return  \code{htmltools::\link[htmltools]{tag}}, modified copy of \code{tag}
#' @seealso \code{\link{bs_embed_tooltip}},
#'   \url{http://getbootstrap.com/javascript/#popovers}
#' @examples
#' library("htmltools")
#'
#' tags$button(type = "button", class = "btn btn-default", "A button") %>%
#'   bs_embed_popover(title = "I'm a popover", content = "Really!")
#' @export
#'
bs_embed_popover <- function(tag, title = NULL, content = NULL,
                             placement = "top", ...){

  tag %>%
    .tag_validate() %>%
    htmltools::tagAppendAttributes(title = title) %>%
    bs_set_data(
      toggle = "popover",
      content = content,
      placement = placement,
      ...
    )
}

#' @rdname bs_embed_popover
#' @export
#'
use_bs_popover <- function(){

  # this will be a rough equivalent to useShinyjs() - just not as good for now.
  system.file("js", "popover.js", package = "bsplus") %>%
    htmltools::includeScript()
}
