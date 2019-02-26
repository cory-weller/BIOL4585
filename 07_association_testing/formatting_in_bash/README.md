# Formatting files in bash

Often, files will not come pre-formatted in the exact way you need them. Instead, you will need to use command-line tools in `bash` to format things in the necessary manner. You are already familiar with extracting columns with `cut`, extracting rows with `grep` and organizing rows with `sort`. Recall that you can direct output to a file using `>` and *append* to an existing file using `>>`. Here, we will introduce three methods of restructuring and adding content to files.

*Note*: These examples make use of the text file `fruits.txt` included in the `formatting_in_bash` subdirectory. Check the contents of `fruits.txt` using `less` or `cat`, so you know what the file's structure is. As you read through the examples, make sure to actually execute the commands in your own command-line so you can see the output and practice using the commands.

## Looping through a file

If you know how many columns are in a file, you can assign each column a variable name, and then refer to the variable while reading line-by-line. Similar to how you can *write* to files using `> outfile.name`, you can *read* files using `< infile.name`

Now, say you wanted to loop through the file and perform some operation on each line. You could do the following:

```bash
while read fruit_name fruit_color fruit_size; do
    echo $fruit_name $fruit_color $fruit_size
done < fruits.txt
```

Or, you could print a subset of columns, in any order you want:

```bash
while read fruit_name fruit_color fruit_size; do
    echo $fruit_color $fruit_name
done < fruits.txt
```

Or adding extra text as well:

```bash
while read fruit_name fruit_color fruit_size; do
    echo some text here $fruit_color $fruit_name more text here
done < fruits.txt
```

The output can be directed to a file with `>` at the end, like you might expect:

```bash
while read fruit_name fruit_color fruit_size; do
    echo some text here $fruit_color $fruit_name more text here
done < fruits.txt > output.txt
```

## Substitutions using `sed`

`sed` is a useful substitution command that lets you change one regular expression pattern into another, and has the following general format:
```bash
sed 's/<pattern_to_remove>/<pattern_to_add>/g' fruits.txt
```

`sed` searches through the file, and replaces <pattern_to_remove>. Because it matches regular expressions, you can make alterations using complex patterns and anchors. You can prepend to the start of every line by replacing `^`, or append the end of every line by replacing `$`.

```bash
sed 's/^/prepended_values\t/g' fruits.txt
sed 's/$/\tappended_values/g' fruits.txt
```

Of course, `sed` commands can be chained together with pipes:

```bash
sed 's/^/prepended_values\t/g' fruits.txt | sed 's/$/\tappended_values/g'
```


## Printing using `awk`

`awk` is a scripting language that allows you to print contents of a file in various ways.

Say you have a  tab-delimited file that contains 3 columns You can print only column 1:
```bash
awk '{FS="\t"} {print $1}' fruits.txt
```
Here, `FS="\t"` is setting the field separator (delimiter) to tab. This tells `awk` to identify columns as being separated by a tab. If the file had columns separated by commas, you would instead use `FS=","`. By default, `awk` treats whitespace as a delimiter, but specifying it explicitly is a good habit, if you know what it should be.

`$1` identifies 'column one' or any other column number if you change the digit.

You can also use `$0` to refer to all columns at once (i.e., an entire row of a file):
```bash
awk '{FS="\t"} {print $0}' fruits.txt
```


If you wanted to rearrange the columns, you can change the order they are printed:
```bash
awk '{FS="\t"} {print $3,$2,$1}' fruits.txt
```

Note that `awk` separates columns by a single space by default. You can change this behavior by setting the Output Field Separator value:
```bash
awk '{FS="\t"} {OFS="\t"} {print $3,$2,$1}' fruits.txt
```

You can add text with `awk` by enclosing it within double-quote marks:
```bash
awk '{FS="\t"} {OFS="\t"} {print $3,$2,$1,"NewData"}' fruits.txt
```
