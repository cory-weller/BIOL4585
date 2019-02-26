## Part 1: revisiting coding homework, variables and loops.

See the files codeV1.txt, codeV2.txt, and codeV3.txt. As a group, write down:
  * What do you think the code will do? Run the code after you make an educated guess.
  * What happened? Did it match your expectations?
  * Was there a difference between them, in terms of output?
  * Was there a difference between them, in terms of how easy it was to read? How so?

For homework, you will learn about running scripts. As a teaser, you can run codeV1
and codeV2 as scripts right now by entering one of the following commands:
  * `bash codeV1.txt`
  * `bash codeV2.txt`
  * `bash codeV3.txt`


The word 'bash' tells the computer to execute the file as a script, executing it with the bash language.
  * What is the benefit or utility of running code as scripts instead of typing them yourself?

We will discuss as a class prior to moving on to part 2.

## Part 2: Superhero Genome-Wide Association Study (GWAS) activity

This activity will be conducted in class--wait for further instruction.
  

## Part 3: Superhero GWAS with data

Genetic data has been collected for 1000 individuals, for four different snps. Investigate the file
with the name superpowerGWAS.txt. We will use this data to determine if all, none, or some subset of
four genotyped alleles have an association with the superpowered phenotype.
  * What is the file contents and structure?
  * Is it easy to make any inferences from the data by simply scrolling through the file?

We'll start looking only at the first snp. In order to actually calculate a statistic for genetic association,
we need to find four separate counts:
  * Superpowered individuals with allele A
  * Superpowered individuals with allele B
  * Normal individuals with allele A
  * Normal individuals with allele B

Each member of your table should individually collect one of the above counts. The file is too large and
unsorted to actually count by eye, so you'll need to use commands to count the number of individuals that fit
each of the criteria.
  * What commands did each individual come up with, to get allele counts for each category?
  * Organize your group's data into 2x2 table. Label the axes based on phenotype and allele combinations.
  * Based on the counts, do you believe there is an association between genotype at this SNP, and phenotype?
  * Use an online Chi-square calculator to calculate a significance value of the association between genotype and phenotype.
    You can use an online calculator such as https://www.mathsisfun.com/data/chi-square-calculator.html.
    Just google "Chi square calculator" to find one.
  * What is your interpretation of the p-value?

Next, we want to find the allele counts for the four groups at the three remaining snps. That sounds like a lot of work.
I can sympathize that writing out four separate commands just for one SNP can be tedious. Let's be lazy programmers.
To make things easier, we'll write a loop with variables to do calculate all of the counts. As a group,
  * Write a loop that prints allele counts for each combination of snp, phenotype, and allele.
  * Use those allele counts in a Chi-square calculator
  * Interpret which of the snps you think could be associated with superpowers.




## Homework
  * Complete DataCamp Chapter #5 in Introduction to Shell for Data Science #5, "Creating New Tools"
  * Read the paper on GWAS and Human Disease, in the course collab Resources folder, to prepare for a discussion.
  * Submit a response on collab describing one new thing you learned or found most interesting, and one
    thing you are still unsure about or would like clarified.
