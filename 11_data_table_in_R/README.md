# `data.table` in R

## Overview

This week's objective is to familiarize yourself with `data.table`: a fast, powerful, user-friendly package for manipulating data. There is a lot of material to cover in this section! There is no separate homework assignment; your job is to make it through the material contained below. Anything not completed in class will be completed on your own time, prior to the start of next class.

## Installing `data.table`

In your command line, you'll first need to load the necessary modules before starting `R` version 3.5.1

```bash
# Load modules
module load gcc
module load R/3.5.1

# Launch R session
R
```

You should now have an interactive `R` terminal. To install `data.table`, use the `install.packages()` function:

```R
# Note that quote marks are used here:
install.packages("data.table")
```


This may take a while as all prerequisites are loaded. If you are prompted to select a mirror, choose one that's geographically nearby. If you are prompted to use a custom library, hit enter to accept the default location.

You can now load the `data.table` package with `library()`

```R
# Note that no quote marks are necessary here:
library(data.table)

# Remember you can always access the help files for data.table and its functions with ?
?data.table
?setnames
?setcolorder
```

## Importing and Exporting Data

Although this is actually the 5th chapter of data.camp, we'll learn the `fread()` function first. `fread()` is a fast and user-friendly function for importing data into R and converting it to a `data.table` object. The most basic use case is to use a single argument: the filename that you want to read.

```R
# If you wanted to load a file named 'myfile.csv' with fread and save it to the variable named dt
dt <- fread('myfile.csv')
```

You can also explicitly define different aspects of your file:

```R
# If you wanted to load a file named 'humanGenomeData.vcf' with fread
# explicitly tell fread that data is separated by tabs
# skip to the line that beings with "#CHROM" and ignore everything before it
# use the first row as header names
# and save it to the variable named vcf
vcf <- fread('humanGenomeData.vcf', sep="\t", skip="#CHROM", header=TRUE, na.strings=".")
```

## Part 1: Introduction to `data.table`

First, complete the Data Camp *Introduction to data.table* chapter, under the **Data Minipulation in R with data.table** course, then proceed.

gunzip the `chrMT.vcf.gz` file in this week's project directory, and then launch `R`. Remember to load the `gcc` and `R/3.5.1` modules before launching `R`, if you haven't already for this session. If you are already in R, you can temporarily suspend it by pressing `CTRL` + `Z`, then perform `gunzip` on the file, then execute `fg` to bring `R` back into the *foreground*.

Next, read the contents of `chrMT.vcf` using `fread()`. Use your newfound knowledge of `data.table` to address the following questions:

1. How many sites are multi-allelic? Hint: multi-allelic sites will have the various alternate nucleotides separated by a comma. Use `%like%` to select rows that include a "," pattern in this column. Submit your command and the number of rows it gives.

2. How many sites are between position 10000 and 20000? Hint: use `%between%` or a combination of `>` and `<` with the `POS` column. Submit your command and the number of rows it gives.

3. For how many sites is the reference allele "A" ?

4. How many sites have an alternate allele that is a single nucleotide A C T or G? Hint: you can use multiple `==` tests, separated by a vertical bar `|` (which means *or*), or %in% followed by a single vector of acceptable options. Submit your command and the output it gives.

## Part 2 and 3: Selecting and Computing on Columns & Groupwise Operations

Next, complete the Data Camp *Selecting and Computing on Columns* and *Groupwise Operations* chapters, under the **Data Minipulation in R with data.table** course, then proceed.

5. Some of the columns in the vcf file are not necessary for analyses. How would you write a command to return the vcf data.table with every column *except* ID, QUAL, FILTER, INFO, and FORMAT?

6. Write up a command using `j` notation to return the median POS value. Submit your command and the output it gives.

Next, complete the Data Camp *Groupwise Operations* chapter, under the **Data Minipulation in R with data.table** course, then proceed.

The `.N` operator is extremely useful for returning the number of rows (or, the frequency). As an example, if we wanted to calculate the frequency of REF alleles across the whole table, we could run:

```R
# calculate the number of rows for each unique value of REF
dat[, .N, by=REF]
```

Which prints out the number of rows in the table (i.e., positions) that match every REF allele.

7. Use `.N` to calculate the frequency of genotypes for sample (i.e., column) HG00096. What is the frequency of the REF allele (coded as 0) and ALT allele for this sample? Submit your command, the output, and your interpretation.

## Part 4: Reference Semantics

Next, complete the Data Camp *Reference Semantics* chapter, under the **Data Minipulation in R with data.table** course, then proceed.

First, save your data.table to a new variable name,  filtering out any sites that aren't bi-allelic. (Again, these sites have a comma int he ALT column. Don't forget you can use `%like%` to search for patterns, and `!` to mean NOT, to invert matching).

Now, notice that the INFO column is hard to parse, containing multiple fields of data. We're going to pull out the VT (variant type) and AC (alternate count) values by splitting the string, and assigning the values to new columns.

Assign a new column named "VariantType" and `:=` by extracting the VT value from the INFO column.

The INFO column is formatted like `VT=M;AC=1`. In this example, we want to extract the "M" from the string. This can be done by splitting the string by both "=" and ";" characters, giving a vector of `c("VT", "M", "AC", "1")`. We would then extract the second element using the index `[2]`,

```R
# note that DT should be replaced with whatever your data.table is named (the new one you saved, after filtering multi-allelic sites)
DT[, VariantType :=  tstrsplit(INFO, split="[=;]")[2] ]
```

The above code is essentially saying "for every row; take the value of the INFO column; split it up between "=" and ";" characters; take the second element; and assign this value to a new column `VariantType`.

You should now have a new column `VariantType` which contains M or S values (for multi- or single-nucleotide polymorphism).

8. Write a similar operation to extract the AC value from the INFO column, and assign it to a new column `AlternateCounts`. Then, convert the column to a numeric type (it's still a character) by assigning the column to its own value inside `as.numeric()`. What is your command and the output showing the mean value of this newly-assigned AlternateCalls column?


Now that we're done with it, delete the INFO column by assigning it WITH `:=` to `NULL`.

## Part 5: Importing and Exporting Data

Last, complete the Data Camp *Importing and Exporting Data* chapter, under the **Data Minipulation in R with data.table** course, then proceed.



9. Save your data.table to a file using fwrite() and share the command you used to do so. This should be the table where you subset bi-allelic SNPs and then deleted the INFO column. You want your file to be:
  * named appropriately
  * separated by tabs
  * to include column names
  * to exclude row names
  * to not be quoted (see `?fwrite` for the explanation/usage of all these criteria)


Just for fun, here are some extra capabilities of `fread`:

```R
# You can use fread to import the result of a command that prints a .gz file's contents, so you don't actually need to decompress the file to the disk
dt <- fread(cmd="zcat filename.gz")
```

This can be extended to any `bash` commands you might want to operate on a file, for powerful pre-processing:

```R
# Use fread to concatenate multiple files then read in the result
dt <- fread(cmd="cat file1.csv file2.csv file3.csv")
```

```R
# Use fread to subset specific rows using grep, then subset specific columns using cut
dt <- fread(cmd="grep 'pattern' file.csv | cut -f 1-4")
```


10. Phew! That was a lot to go through. After having experienced both `bash` and `data.table`, briefly comment on your perspective on the differences between them. When might a researcher use one over the other?
