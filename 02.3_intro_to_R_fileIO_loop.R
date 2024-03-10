## example R code (intro to R part 3)
## author: alice yue


## file manipulation ####

# specify path to folder containing all .fcs files you want to analyze
folder_path <- "path/to/folder"
# e.g. linux: "/home/alice/projects/20220729 physalia course/flowcytometry_R"
# e.g. you can also right click your file and click "Copy path" to see here your file is located

# list all files in folder
fcs_paths <- list.files(folder_path, full.names=TRUE)
# list only files that end ($) in ".fcs"
fcs_paths <- fcs_paths[grepl("[.]fcs$", fcs_paths, ignore.case=TRUE)]


## loop review
# loop through each .fcs file path
for (fcs_path in fcs_paths) {
    print(fcs_path)
    
    # load fcs file
    f <- flowCore::read.FCS(fcs_path)
    
    # you can add code to manipulate fcs file here
    
    # save file
    fcs_path_new <- gsub("[.]fcs", "_new.fcs", fcs_path)
    flowCore::write.FCS(f, fcs_path_new)
    # go verify that you saved your file with the new file name!
    # check that your new file has the same file size as your original file,
    # it should, because it is a copy!
    
    # sometimes you will also want to save a matrix as .csv files:
    new_matrix <- matrix(c(1, 2, 3, 4), ncol=1) # 1 column matrix
    colnames(new_matrix) <- "my_column"
    csv_path <- gsub("[.]fcs", "_matrix.csv", fcs_path)
    print(csv_path)
    write.table(new_matrix, file=csv_path, quote=FALSE, sep=",", row.names=FALSE, col.names=TRUE)
    # go verify your new csv file!
    
    ## TRY: practice problems ####
    
    # 1. try manipulating the arguments of "write.table()" to see what you get!
    # e.g. write.table(new_matrix, file=csv_path, quote=TRUE, sep=" ", row.names=TRUE, col.names=FALSE)
}
