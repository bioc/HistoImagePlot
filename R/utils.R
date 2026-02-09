#' @importFrom BiocBaseUtils isScalarCharacter
.is_url <- function(url) {
    stopifnot(
        isScalarCharacter(url)
    )
    grepl("^https?://|^ftp://", url)
}

.json_to_png_path <- function(json_path) {
    if (!grepl("\\.json$|\\.json\\.gz$", json_path))
        stop("The file path does not have extension '.json' or '.json.gz'")
    gsub("\\.json$|\\.json\\.gz$", ".png", json_path) |>
        gsub("json", "thumb", x = _)
}
