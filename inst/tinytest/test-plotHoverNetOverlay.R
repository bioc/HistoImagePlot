# Test matchHoverNetToTiles

# Create mock SpatialExperiment for HoverNet data
library(SpatialExperiment)
library(S4Vectors)

# Mock nuclei data (100 nuclei)
set.seed(123)
n_nuclei <- 100
coords_mat <- matrix(
    c(runif(n_nuclei, 0, 10000), runif(n_nuclei, 0, 10000)),
    ncol = 2,
    dimnames = list(NULL, c("x_centroid", "y_centroid"))
)

cell_types <- sample(0:5, n_nuclei, replace = TRUE)

# Create minimal SpatialExperiment
mock_spe <- SpatialExperiment(
    assays = list(counts = matrix(0, nrow = 1, ncol = n_nuclei)),
    spatialCoords = coords_mat,
    colData = DataFrame(type = cell_types)
)

# Mock tiles data (25 tiles in 5x5 grid)
tile_coords <- expand.grid(
    tile_x = seq(0, 800, by = 224),
    tile_y = seq(0, 800, by = 224)
)
mock_tiles <- data.frame(
    tile_id = paste0("tile_", seq_len(nrow(tile_coords))),
    tile_x = tile_coords$tile_x,
    tile_y = tile_coords$tile_y,
    embedding_1 = runif(nrow(tile_coords))
)

