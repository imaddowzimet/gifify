#' Convert video to GIF (with subtitles)
#'
#' `gifify` lets you import video files and create subtitled GIFs from them, for all of your meme-ing needs.
#'
#' @param file File path to video file
#' @param text Subtitle text (one or two text strings)
#' @param cut If using multiple subtitles, the frame of the video when the subtitles should switch
#' @param gifname Name of exported file. Defaults to "brilliant.gif"
#' @param width width of exported file
#' @param color color of subtitle text
#' @param size size of subtitle text
#' @param gravity position of subtitle text. "south" is default.
#' @param style font family.
#' @param weight thickness of font.
#' @return Returns a brilliant GIF.
#' @export
#'

gifify <- function(file, text = "", cut = NULL,  gifname = "brilliant.gif",
                   width = "400", color = "yellow", size = 22,
                   gravity = "south", style = "italic", weight = 700) {
  assertthat::assert_that(length(text) <=2, msg = "More than two text strings provided")
  if (length(text) == 2)  {assertthat::assert_that(length(cut)==1, msg = "More one than one text string provided; please provide a cut point for when they should switch")}
  video       <- magick::image_read_video(file, fps=30)
  video_small <- magick::image_scale(video, width)
  if (length(text) == 1) {
    video_full <- magick::image_annotate(video_small,
                                 text[1],
                                 size = size,
                                 gravity = gravity,
                                 color = color, style = style, weight = weight)

  }
  if (length(text) == 2) {

    # Split video
    video_list <- list()
    video_list[[1]] <- video_small[1:cut]
    video_list[[2]] <- video_small[(cut+1):length(video_small)]

    # Annotate videos
    video_list[[1]] <- magick::image_annotate(video_list[[1]],
                                      text[1],
                                      size = size,
                                      gravity = gravity,
                                      color = color, style = style, weight = weight)
    video_list[[2]] <- magick::image_annotate(video_list[[2]],
                                      text[2],
                                      size = size,
                                      gravity = gravity,
                                      color = color, style = style, weight = weight)

    # Combine
    video_full      <- c(video_list[[1]], video_list[[2]])

  }

  magick::image_write_gif(video_full, gifname, delay = 1/25)

}





