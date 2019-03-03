# Retrieving data in the command-line

## Overview
Many research projects involve using publicly available data. But, that data has to be transferred from its source (hosted on some server somewhere) to your personal directory (on Rivanna). Here, you will be retrieving publicly available data published with the **1000 Genomes Project**.

During this activity, you will practice:
  * Accessing an online file system, in this case one that hosts **1000 Genomes Project** data
  * Downloading compressed data to your directory via the command-line
  * Decompressing files (such that we can then process the files)
  * Investigating the structure and contents of a file with command-line tools

## Download the mitochondrial genome from the 1000 Genomes FTP
To download a file while in bash, you’ll need
  * A `bash` shell
  * A command to retrieve a file from the internet
  * An address for the file you wish to retrieve

1. **Connect to Rivanna** and then open up a browser window to do some google searches. You’ll come back to Rivanna in a moment, but first you need to learn which command to use to download a file directly to Rivanna.

2. **Search for how to download files using `bash`**. Your tutorials so far haven’t taught you how to download a file using `bash`. Often, you’ll run into the problem of not knowing how to do something. Here, Google is your friend. Many examples will be posted on Stack Overflow and Stack Exchange, websites where people ask for help with coding. Odds are somebody as asked your question before: you just need to search the right terms. Because you’re curious how to download a file using `bash`, perform a Google search for bash download file which will return some examples. This is a pretty standard process: if you want to learn how to do task using language, search language task. If you want to only see results posted on stackoverflow, you can search site:stackoverflow.com language thing. Once you know what command(s) you could use, the manual pages can inform you of detailed instructions of how to use the command’s options.

3. **Locate the address of the file to download**. Once you have an idea of which command you’ll use, you need the file's address. The 1000 Genomes data is located on an FTP server, a computer with a File Transfer Protocol address. Basically, this means you can download files from it using a web address. You can view the list of 1000 genomes files in your browser: ftp://ftp.1000genomes.ebi.ac.uk/vol1/ftp/release/20130502/

Clicking the above link opens up a very plain directory listing of available files. Copy the link to the mitochondrial genome file. We want the file `ALL.chrMT.<morestuffhere>.genotypes.vcf.gz`. Note that left clicking will download the file to your own computer, which is not what you want! You only need to copy the link to the file and combine it with the command you found via Google. Run the command in `bash` to download the file. Be sure you’re getting the `.vcf.gz` file and not the `.vcf.gz.tbi` file.

4. **Download the file to your Rivanna directory** using the command and file location.

5. **Double-check that it worked.** You can see if the file has been downloaded by listing the contents of your folder with `ls`. Notice the `.vcf.gz` file name is long and complicated. You won’t want to type the whole thing out every time you manipulate the file. There a few options here: First, you could have specified a filename at the same time that you download the file (see examples or manual pages for the command you’re using to download the file). Second, you could download the file with the name it has now, and then rename it to something less complicated using `mv`., e.g.

```bash
mv oldFileName newFileName
```
In either case, be sure the new file name communicates that it’s a mitochondrial genome, and that the name ends with the same file extension, `.vcf.gz`). Third option, you can keep the full file name and use tab-completion after typing the first character(s).

6. **Decompress the `.gz` file containing the mitochondrial genome.** The file extension `.gz` indicates that the file has been compressed via `gzip` to take up less space on the hard drive. You’ll need to decompress the file to read its contents. Perform the necessary Google search and/or use manual pages to learn how to decompress a `.gz` file. **Side note**: because data compression is most effective on highly repetitive information, it can be used to measure how repetitive a pop song is. See https://pudding.cool/2017/05/song-repetition/ for a very well made web page briefly explaining data compression using stunning visual displays, plus evidence that Mariah Carey is more lyrically complicated than Beyonce (if only slightly).

7. **Investigate the contents of `.VCF` file.** You might first think to look at the contents by printing the file with `cat`. Give it a try and see what happens. Remember you can press `CTRL+C` to cancel commands that are currently running.
  * Try looking at the file using the `less` command. Is this more effective?
  * Try using `less` with the `-S` option (note it is a capital S) to turn off word wrap. Is this more effective? The data seems to “line up” nicely when using `less -S` because fields are separated by tab characters (that is, it uses a tab delimiter). It is very common for data to be delimited by tab characters because it’s much easier to read than being separated by commas.
  * Notice how the “real” data begins on the header line containing `CHROM`, `POS`, `ID`, `REF`, `ALT` etc. The lines above that are metadata that we can ignore for now.
  * count the number of rows within the file using `wc` command with the `-l` option
  * extract the header row using `grep #CHROM` to pull out all rows that include the "word" `#CHROM`
  * count the number of columns with the command `grep #CHROM filename.vcf | wc -w`. This first extracts the header row because it matches the `#CHROM` pattern, then counts the number of 'words' in that row.
