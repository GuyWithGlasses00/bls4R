# Declare source path
fpath <- base::file.path("data-raw", "BLS_SERIES.csv")

# Read data
BLS_SERIES <- data.table::fread(fpath)

# Save object
usethis::use_data(BLS_SERIES, overwrite = TRUE)
