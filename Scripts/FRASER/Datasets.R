#'---
#' title: Full FraseR analysis over all datasets
#' wb:
#'  params:
#'   - tmpdir: '`sm drop.getMethodPath(METHOD, "tmp_dir")`'
#'  input:
#'   - fraser_summary: '`sm expand(config["htmlOutputPath"] + 
#'                     "/aberrant_splicing/FraseR/{dataset}_summary.html", 
#'                     dataset=config["aberrantSplicing"]["groups"])`'
#' output:
#'  html_document
#'---

saveRDS(snakemake, file.path(snakemake@params$tmpdir, "FraseR_99.snakemake"))
# snakemake <- readRDS(".drop/tmp/AS/FraseR_99.snakemake")

datasets <- snakemake@config$aberrantSplicing$groups

#+ echo=FALSE, results="asis"
devNull <- sapply(datasets, function(name){
    cat(paste0(
        "<h1>Dataset: ", name, "</h1>",
        "<p>",
        "</br>", "<a href='aberrant_splicing/FraseR/", name, "_summary.html'        >FRASER Summary</a>",
        "</br>", "</p>"
    ))
})