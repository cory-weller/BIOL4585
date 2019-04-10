## ggplot, the R language of plotting
If you use R, you'll almost certainly be using `ggplot` for generating figures, or plots. This will be a crash course in the syntax of `ggplot`.

First, complete the Data Camp chapter **Data Visualization with ggplot2 (Part 1)**. This should give you an introduction to the basic syntax of ggplot before we work with it using some biological data.

Second, work through the below exercises. The numbered questions are available under the **Tests & Quizzes** tab of collab.

## Getting ready to use ggplot on Rivanna

Log into Rivanna and start R (after loading the **gcc** and **R/3.5.1** modules).

Then, while in R, install the `ggplot2` package:

```
install.packages("ggplot2")
```

If prompted to select a mirror, choose one relatively close to us in the US for fastest downloads.

## A note on Screenshotting your plots

It's often helpful to take screenshots of your plots to save the results to look at later. Also, you'll need to do so for the homework! The method of saving plots so will differ from one operating system to another.

On **Windows**, you can search for the *Snipping Tool* to capture a portion of your screen, and save to a file. Alternatively, copy a region to your clipboard using `Windows Key` + `Shift` + `s`, which you can then save after pasting into paint.

On **Mac**, `Command` + `Shift` + `4` should let you save a portion of your screen to a file.

**Linux** users are on their own: but depending on your distribution, `Shift` + `PrintScreen` may work for you.

If the above do not work (likely due to older operating systems) you can always take a full-window screenshot with the `PrintScreen` button and crop it using your default image editing program (e.g. Paint, or Paintbrush).

(Note: You can save your plots within `ggplot` using the `ggsave()` function, though that's typically when generating final, high-resolution plots for presentations or publications. Just screenshotting is the simple way to do it for exploratory analysis.)

## Working with the **Iris** example data

We'll be Using the `iris` premade dataframe, which describes measurements for different species of flower. You can see the dataframe by executing the command `iris` in the R console. We'll be using `iris` as the name of the data for plotting within `ggplot()`.

First, let's look at the relationship between sepal length and sepal width. Sepals are the green leafy parts at the base of the flower, beneath the petals.

Plot sepal width on the x-axis and sepal length on the y. Note you'll need to match the spelling of the columns in your `data.table` to plot it, otherwise you'll get an error **object not found**. We'll want a scatter plot, using `geom_point()`

## Dimensions of Plotting

Data is plotted in multiple dimensions. The ones you're most familiar with will be the X and Y dimensions. If all we use are X and Y values, we can compare two variables at the same time.

To add another dimension to the data, we don't need to make a visually 3D plot. We can add another dimension using things like color, shape, or size. These options all go within the aesthetics, or `aes()` portion of a `ggplot` command. To visualize how sepal width and sepal length are related for each species, we'll need to add species as a dimension of the data. Try it first using `shape=`, and then using `color=`

1. Screenshot the preferred display (with either shape or color as the dimension for species). Upload your plot...

2. ...and paste the code used to generate it.

3. Does adding species as a dimension to the data provide extra information, compared to when all points looked the same? If so, what kind of patterns could you discern?

4. Was it easier to discern patterns using color or shape as the dimension for species? Why?

5. Modify your `ggplot` command (that you preferred, whether using shape or color for species) to now show the relationship between petal length and petal width. Upload a screenshot of your plot...

6. ...and submit the code used to generate it.

7. Give your interpretation on petal size as a function of species. Is this relationship more or less clear than sepal size?

## Converting from wide to long form

Currently, the data is in *wide format*. More advanced plotting techniques are typically easiest in *long format* (also called *narrow format*), where every sample * variable combination is on its own row. You can see a brief example of the difference on the [wikipedia page.](https://en.wikipedia.org/wiki/Wide_and_narrow_data)

8. Convert the data to long format using the `melt()` function, and save this long format data to a new variable. When using `melt()`, you supply a `data.table` object to convert to long format, plus a vector of column names that are being *melted* into long format. Those column names are listed using the `measure.vars=` argument. You will be melting the columns that describe sepal and petal dimensions (but not species). How many rows does this new table have?

## Facetting plots

Now that we have data in long format, we can take advantage of plot faceting. Facets separate data into groups, kind of like when using `by=` notation in `data.table`. This allows you to look at data for specific groups (or combinations of groups). We're going to facet data by species, so that each species generates its own sub-plot, separate from the others.

9. First, plot the long-format data *unfaceted* using scatter plot, `geom_point()`. The X-axis will contain the `variable` column, the y-axis will contain the `value` column, and data should be colored by species. Upload a screenshot of your plot...

10. ...and the code used to generate it.

11. Next, facet the data by `Species` by adding either `facet_wrap()` or `facet_grid()` to the code you just used. See the documentation for these in R using `?`, or search google for more help. Upload a screenshot of your plot...

12. ...and add the code used to generate it.

This recent plot is great, but there's a problem of data overlapping. With scatter plots (`geom_point()`), any points that shareidentical X and Y values will overlap. We can display the data in a couple different ways to get a better idea of the distribution.

13. Modify your code from **11** from a scatter plot to each of three other methods: a jitter plot, using `geom_jitter()`, a violin plot, using `geom_violin()`, and a boxplot, using `geom_boxplot()`. What are the differences between these three plots? What are similarities in what they tell you?

14. Currently, your plot's labels default to column names. Choose your favorite plot from **13** and tidy up the labels to your plot with better descriptors and capitalization, plus a title. For these you can use the `ggplot` elements `xlab()`, `ylab()` and `ggtitle()`, or simultaneously using `labs()`. Upload a screenshot of the plot...

15 ...as well as the code used to generate it.
