---
title: "Template for ioslides"
author: Thomas Girke
date: November 21, 2020
output: 
  ioslides_presentation:
    keep_md: yes
    logo: ./images/ucr_logo.png
    widescreen: yes
    df_print: paged
    smaller: true
subtitle: "How create ioslides with Rmarkdown" 
bibliography: bibtex.bib
---

<!---
- ioslides manual: 
   https://bookdown.org/yihui/rmarkdown/ioslides-presentation.html

- Compile from command-line
Rscript -e "rmarkdown::render('ioslide_template.Rmd'); knitr::knit('ioslide_template.Rmd', tangle=TRUE)"
-->

<!---
  Note: following css chunks are required for scrolling support beyond slide boundaries
-->

<style>
slides > slide {
  overflow-x: auto !important;
  overflow-y: auto !important;
}
</style>

<style type="text/css">
pre {
  max-height: 300px;
  overflow-y: auto;
}

pre[class] {
  max-height: 100px;
}
</style>

<style type="text/css">
.scroll-100 {
  max-height: 100px;
  overflow-y: auto;
  background-color: inherit;
}
</style>


# Outline

- <div class="white">__Basics__</div>
- Scalable Complexity via Scrolling
- Images and Graphics
- References

## Introduction 

- The tutorial for ioslides is [here](https://bookdown.org/yihui/rmarkdown/ioslides-presentation.html) 
- To render the slides to html and also extract the code chunks to a separate file, run from the command-line:


```sh
Rscript -e "rmarkdown::render('ioslide_template.Rmd'); knitr::knit('ioslide_template.Rmd', tangle=TRUE)"
```

- Shortcuts for different display modes
    - 'f': enable fullscreen mode
    - 'w': toggle widescreen mode
    - 'o': enable overview mode
    - 'h': enable code highlight mode
    - 'p': show presenter notes

## Math Expressions

$$f(k) = {n \choose k} p^{k} (1-p)^{n-k} \tag{1}$$
$$\sigma_{M} = \frac{\sigma}{\sqrt(N)} \tag{2}$$

## Citations and Bibliographies

- Citations can be included autmatically by including them in BibTex format in file `bibtex.bib` and then citing the them in the text with this syntax 
  __[\@refid1; \@refid2]__
- For example, the citation syntax __[\@Huber2015-ag; \@Howard2013-fq]__ renders to: [@Huber2015-ag; @Howard2013-fq], and the corresponding references will then automatically 
  be included at the end on a slide entitled 'References'.
- More citations [@Kim2013-vg; @Langmead2012-bs; @Li2009-oc; @Li2013-oy; @Liao2013-bn; @Lawrence2013-kt]

# Outline

- Basics
- <div class="white">__Scalable Complexity via Scrolling __</div>
- Images and Graphics
- References

## Scrolling within Code Blocks, Tables and Beyond Slide Boundaries

- Scrolling of code chunks supported by css code after preamble.


```r
z <- "dajfdfkfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff"
z
z
z
z
z
z
z
z
z
```

- Note: the print behavior of `data.frames` is autmatically paged when including `df_print: paged` in preamble. 
  In addition, one can set how many rows are shown on each page by assigning the desired number to the `rows.print` 
  argument in the header of the corresponding code chunk (_e.g._ below it is set to 75 rows).


```r
x <- cbind(iris, iris[,5:1])
x
```

<div data-pagedtable="false">
  <script data-pagedtable-source type="application/json">
{"columns":[{"label":["Sepal.Length"],"name":[1],"type":["dbl"],"align":["right"]},{"label":["Sepal.Width"],"name":[2],"type":["dbl"],"align":["right"]},{"label":["Petal.Length"],"name":[3],"type":["dbl"],"align":["right"]},{"label":["Petal.Width"],"name":[4],"type":["dbl"],"align":["right"]},{"label":["Species"],"name":[5],"type":["fct"],"align":["left"]},{"label":["Species"],"name":[6],"type":["fct"],"align":["left"]},{"label":["Petal.Width"],"name":[7],"type":["dbl"],"align":["right"]},{"label":["Petal.Length"],"name":[8],"type":["dbl"],"align":["right"]},{"label":["Sepal.Width"],"name":[9],"type":["dbl"],"align":["right"]},{"label":["Sepal.Length"],"name":[10],"type":["dbl"],"align":["right"]}],"data":[{"1":"5.1","2":"3.5","3":"1.4","4":"0.2","5":"setosa","6":"setosa","7":"0.2","8":"1.4","9":"3.5","10":"5.1"},{"1":"4.9","2":"3.0","3":"1.4","4":"0.2","5":"setosa","6":"setosa","7":"0.2","8":"1.4","9":"3.0","10":"4.9"},{"1":"4.7","2":"3.2","3":"1.3","4":"0.2","5":"setosa","6":"setosa","7":"0.2","8":"1.3","9":"3.2","10":"4.7"},{"1":"4.6","2":"3.1","3":"1.5","4":"0.2","5":"setosa","6":"setosa","7":"0.2","8":"1.5","9":"3.1","10":"4.6"},{"1":"5.0","2":"3.6","3":"1.4","4":"0.2","5":"setosa","6":"setosa","7":"0.2","8":"1.4","9":"3.6","10":"5.0"},{"1":"5.4","2":"3.9","3":"1.7","4":"0.4","5":"setosa","6":"setosa","7":"0.4","8":"1.7","9":"3.9","10":"5.4"},{"1":"4.6","2":"3.4","3":"1.4","4":"0.3","5":"setosa","6":"setosa","7":"0.3","8":"1.4","9":"3.4","10":"4.6"},{"1":"5.0","2":"3.4","3":"1.5","4":"0.2","5":"setosa","6":"setosa","7":"0.2","8":"1.5","9":"3.4","10":"5.0"},{"1":"4.4","2":"2.9","3":"1.4","4":"0.2","5":"setosa","6":"setosa","7":"0.2","8":"1.4","9":"2.9","10":"4.4"},{"1":"4.9","2":"3.1","3":"1.5","4":"0.1","5":"setosa","6":"setosa","7":"0.1","8":"1.5","9":"3.1","10":"4.9"},{"1":"5.4","2":"3.7","3":"1.5","4":"0.2","5":"setosa","6":"setosa","7":"0.2","8":"1.5","9":"3.7","10":"5.4"},{"1":"4.8","2":"3.4","3":"1.6","4":"0.2","5":"setosa","6":"setosa","7":"0.2","8":"1.6","9":"3.4","10":"4.8"},{"1":"4.8","2":"3.0","3":"1.4","4":"0.1","5":"setosa","6":"setosa","7":"0.1","8":"1.4","9":"3.0","10":"4.8"},{"1":"4.3","2":"3.0","3":"1.1","4":"0.1","5":"setosa","6":"setosa","7":"0.1","8":"1.1","9":"3.0","10":"4.3"},{"1":"5.8","2":"4.0","3":"1.2","4":"0.2","5":"setosa","6":"setosa","7":"0.2","8":"1.2","9":"4.0","10":"5.8"},{"1":"5.7","2":"4.4","3":"1.5","4":"0.4","5":"setosa","6":"setosa","7":"0.4","8":"1.5","9":"4.4","10":"5.7"},{"1":"5.4","2":"3.9","3":"1.3","4":"0.4","5":"setosa","6":"setosa","7":"0.4","8":"1.3","9":"3.9","10":"5.4"},{"1":"5.1","2":"3.5","3":"1.4","4":"0.3","5":"setosa","6":"setosa","7":"0.3","8":"1.4","9":"3.5","10":"5.1"},{"1":"5.7","2":"3.8","3":"1.7","4":"0.3","5":"setosa","6":"setosa","7":"0.3","8":"1.7","9":"3.8","10":"5.7"},{"1":"5.1","2":"3.8","3":"1.5","4":"0.3","5":"setosa","6":"setosa","7":"0.3","8":"1.5","9":"3.8","10":"5.1"},{"1":"5.4","2":"3.4","3":"1.7","4":"0.2","5":"setosa","6":"setosa","7":"0.2","8":"1.7","9":"3.4","10":"5.4"},{"1":"5.1","2":"3.7","3":"1.5","4":"0.4","5":"setosa","6":"setosa","7":"0.4","8":"1.5","9":"3.7","10":"5.1"},{"1":"4.6","2":"3.6","3":"1.0","4":"0.2","5":"setosa","6":"setosa","7":"0.2","8":"1.0","9":"3.6","10":"4.6"},{"1":"5.1","2":"3.3","3":"1.7","4":"0.5","5":"setosa","6":"setosa","7":"0.5","8":"1.7","9":"3.3","10":"5.1"},{"1":"4.8","2":"3.4","3":"1.9","4":"0.2","5":"setosa","6":"setosa","7":"0.2","8":"1.9","9":"3.4","10":"4.8"},{"1":"5.0","2":"3.0","3":"1.6","4":"0.2","5":"setosa","6":"setosa","7":"0.2","8":"1.6","9":"3.0","10":"5.0"},{"1":"5.0","2":"3.4","3":"1.6","4":"0.4","5":"setosa","6":"setosa","7":"0.4","8":"1.6","9":"3.4","10":"5.0"},{"1":"5.2","2":"3.5","3":"1.5","4":"0.2","5":"setosa","6":"setosa","7":"0.2","8":"1.5","9":"3.5","10":"5.2"},{"1":"5.2","2":"3.4","3":"1.4","4":"0.2","5":"setosa","6":"setosa","7":"0.2","8":"1.4","9":"3.4","10":"5.2"},{"1":"4.7","2":"3.2","3":"1.6","4":"0.2","5":"setosa","6":"setosa","7":"0.2","8":"1.6","9":"3.2","10":"4.7"},{"1":"4.8","2":"3.1","3":"1.6","4":"0.2","5":"setosa","6":"setosa","7":"0.2","8":"1.6","9":"3.1","10":"4.8"},{"1":"5.4","2":"3.4","3":"1.5","4":"0.4","5":"setosa","6":"setosa","7":"0.4","8":"1.5","9":"3.4","10":"5.4"},{"1":"5.2","2":"4.1","3":"1.5","4":"0.1","5":"setosa","6":"setosa","7":"0.1","8":"1.5","9":"4.1","10":"5.2"},{"1":"5.5","2":"4.2","3":"1.4","4":"0.2","5":"setosa","6":"setosa","7":"0.2","8":"1.4","9":"4.2","10":"5.5"},{"1":"4.9","2":"3.1","3":"1.5","4":"0.2","5":"setosa","6":"setosa","7":"0.2","8":"1.5","9":"3.1","10":"4.9"},{"1":"5.0","2":"3.2","3":"1.2","4":"0.2","5":"setosa","6":"setosa","7":"0.2","8":"1.2","9":"3.2","10":"5.0"},{"1":"5.5","2":"3.5","3":"1.3","4":"0.2","5":"setosa","6":"setosa","7":"0.2","8":"1.3","9":"3.5","10":"5.5"},{"1":"4.9","2":"3.6","3":"1.4","4":"0.1","5":"setosa","6":"setosa","7":"0.1","8":"1.4","9":"3.6","10":"4.9"},{"1":"4.4","2":"3.0","3":"1.3","4":"0.2","5":"setosa","6":"setosa","7":"0.2","8":"1.3","9":"3.0","10":"4.4"},{"1":"5.1","2":"3.4","3":"1.5","4":"0.2","5":"setosa","6":"setosa","7":"0.2","8":"1.5","9":"3.4","10":"5.1"},{"1":"5.0","2":"3.5","3":"1.3","4":"0.3","5":"setosa","6":"setosa","7":"0.3","8":"1.3","9":"3.5","10":"5.0"},{"1":"4.5","2":"2.3","3":"1.3","4":"0.3","5":"setosa","6":"setosa","7":"0.3","8":"1.3","9":"2.3","10":"4.5"},{"1":"4.4","2":"3.2","3":"1.3","4":"0.2","5":"setosa","6":"setosa","7":"0.2","8":"1.3","9":"3.2","10":"4.4"},{"1":"5.0","2":"3.5","3":"1.6","4":"0.6","5":"setosa","6":"setosa","7":"0.6","8":"1.6","9":"3.5","10":"5.0"},{"1":"5.1","2":"3.8","3":"1.9","4":"0.4","5":"setosa","6":"setosa","7":"0.4","8":"1.9","9":"3.8","10":"5.1"},{"1":"4.8","2":"3.0","3":"1.4","4":"0.3","5":"setosa","6":"setosa","7":"0.3","8":"1.4","9":"3.0","10":"4.8"},{"1":"5.1","2":"3.8","3":"1.6","4":"0.2","5":"setosa","6":"setosa","7":"0.2","8":"1.6","9":"3.8","10":"5.1"},{"1":"4.6","2":"3.2","3":"1.4","4":"0.2","5":"setosa","6":"setosa","7":"0.2","8":"1.4","9":"3.2","10":"4.6"},{"1":"5.3","2":"3.7","3":"1.5","4":"0.2","5":"setosa","6":"setosa","7":"0.2","8":"1.5","9":"3.7","10":"5.3"},{"1":"5.0","2":"3.3","3":"1.4","4":"0.2","5":"setosa","6":"setosa","7":"0.2","8":"1.4","9":"3.3","10":"5.0"},{"1":"7.0","2":"3.2","3":"4.7","4":"1.4","5":"versicolor","6":"versicolor","7":"1.4","8":"4.7","9":"3.2","10":"7.0"},{"1":"6.4","2":"3.2","3":"4.5","4":"1.5","5":"versicolor","6":"versicolor","7":"1.5","8":"4.5","9":"3.2","10":"6.4"},{"1":"6.9","2":"3.1","3":"4.9","4":"1.5","5":"versicolor","6":"versicolor","7":"1.5","8":"4.9","9":"3.1","10":"6.9"},{"1":"5.5","2":"2.3","3":"4.0","4":"1.3","5":"versicolor","6":"versicolor","7":"1.3","8":"4.0","9":"2.3","10":"5.5"},{"1":"6.5","2":"2.8","3":"4.6","4":"1.5","5":"versicolor","6":"versicolor","7":"1.5","8":"4.6","9":"2.8","10":"6.5"},{"1":"5.7","2":"2.8","3":"4.5","4":"1.3","5":"versicolor","6":"versicolor","7":"1.3","8":"4.5","9":"2.8","10":"5.7"},{"1":"6.3","2":"3.3","3":"4.7","4":"1.6","5":"versicolor","6":"versicolor","7":"1.6","8":"4.7","9":"3.3","10":"6.3"},{"1":"4.9","2":"2.4","3":"3.3","4":"1.0","5":"versicolor","6":"versicolor","7":"1.0","8":"3.3","9":"2.4","10":"4.9"},{"1":"6.6","2":"2.9","3":"4.6","4":"1.3","5":"versicolor","6":"versicolor","7":"1.3","8":"4.6","9":"2.9","10":"6.6"},{"1":"5.2","2":"2.7","3":"3.9","4":"1.4","5":"versicolor","6":"versicolor","7":"1.4","8":"3.9","9":"2.7","10":"5.2"},{"1":"5.0","2":"2.0","3":"3.5","4":"1.0","5":"versicolor","6":"versicolor","7":"1.0","8":"3.5","9":"2.0","10":"5.0"},{"1":"5.9","2":"3.0","3":"4.2","4":"1.5","5":"versicolor","6":"versicolor","7":"1.5","8":"4.2","9":"3.0","10":"5.9"},{"1":"6.0","2":"2.2","3":"4.0","4":"1.0","5":"versicolor","6":"versicolor","7":"1.0","8":"4.0","9":"2.2","10":"6.0"},{"1":"6.1","2":"2.9","3":"4.7","4":"1.4","5":"versicolor","6":"versicolor","7":"1.4","8":"4.7","9":"2.9","10":"6.1"},{"1":"5.6","2":"2.9","3":"3.6","4":"1.3","5":"versicolor","6":"versicolor","7":"1.3","8":"3.6","9":"2.9","10":"5.6"},{"1":"6.7","2":"3.1","3":"4.4","4":"1.4","5":"versicolor","6":"versicolor","7":"1.4","8":"4.4","9":"3.1","10":"6.7"},{"1":"5.6","2":"3.0","3":"4.5","4":"1.5","5":"versicolor","6":"versicolor","7":"1.5","8":"4.5","9":"3.0","10":"5.6"},{"1":"5.8","2":"2.7","3":"4.1","4":"1.0","5":"versicolor","6":"versicolor","7":"1.0","8":"4.1","9":"2.7","10":"5.8"},{"1":"6.2","2":"2.2","3":"4.5","4":"1.5","5":"versicolor","6":"versicolor","7":"1.5","8":"4.5","9":"2.2","10":"6.2"},{"1":"5.6","2":"2.5","3":"3.9","4":"1.1","5":"versicolor","6":"versicolor","7":"1.1","8":"3.9","9":"2.5","10":"5.6"},{"1":"5.9","2":"3.2","3":"4.8","4":"1.8","5":"versicolor","6":"versicolor","7":"1.8","8":"4.8","9":"3.2","10":"5.9"},{"1":"6.1","2":"2.8","3":"4.0","4":"1.3","5":"versicolor","6":"versicolor","7":"1.3","8":"4.0","9":"2.8","10":"6.1"},{"1":"6.3","2":"2.5","3":"4.9","4":"1.5","5":"versicolor","6":"versicolor","7":"1.5","8":"4.9","9":"2.5","10":"6.3"},{"1":"6.1","2":"2.8","3":"4.7","4":"1.2","5":"versicolor","6":"versicolor","7":"1.2","8":"4.7","9":"2.8","10":"6.1"},{"1":"6.4","2":"2.9","3":"4.3","4":"1.3","5":"versicolor","6":"versicolor","7":"1.3","8":"4.3","9":"2.9","10":"6.4"},{"1":"6.6","2":"3.0","3":"4.4","4":"1.4","5":"versicolor","6":"versicolor","7":"1.4","8":"4.4","9":"3.0","10":"6.6"},{"1":"6.8","2":"2.8","3":"4.8","4":"1.4","5":"versicolor","6":"versicolor","7":"1.4","8":"4.8","9":"2.8","10":"6.8"},{"1":"6.7","2":"3.0","3":"5.0","4":"1.7","5":"versicolor","6":"versicolor","7":"1.7","8":"5.0","9":"3.0","10":"6.7"},{"1":"6.0","2":"2.9","3":"4.5","4":"1.5","5":"versicolor","6":"versicolor","7":"1.5","8":"4.5","9":"2.9","10":"6.0"},{"1":"5.7","2":"2.6","3":"3.5","4":"1.0","5":"versicolor","6":"versicolor","7":"1.0","8":"3.5","9":"2.6","10":"5.7"},{"1":"5.5","2":"2.4","3":"3.8","4":"1.1","5":"versicolor","6":"versicolor","7":"1.1","8":"3.8","9":"2.4","10":"5.5"},{"1":"5.5","2":"2.4","3":"3.7","4":"1.0","5":"versicolor","6":"versicolor","7":"1.0","8":"3.7","9":"2.4","10":"5.5"},{"1":"5.8","2":"2.7","3":"3.9","4":"1.2","5":"versicolor","6":"versicolor","7":"1.2","8":"3.9","9":"2.7","10":"5.8"},{"1":"6.0","2":"2.7","3":"5.1","4":"1.6","5":"versicolor","6":"versicolor","7":"1.6","8":"5.1","9":"2.7","10":"6.0"},{"1":"5.4","2":"3.0","3":"4.5","4":"1.5","5":"versicolor","6":"versicolor","7":"1.5","8":"4.5","9":"3.0","10":"5.4"},{"1":"6.0","2":"3.4","3":"4.5","4":"1.6","5":"versicolor","6":"versicolor","7":"1.6","8":"4.5","9":"3.4","10":"6.0"},{"1":"6.7","2":"3.1","3":"4.7","4":"1.5","5":"versicolor","6":"versicolor","7":"1.5","8":"4.7","9":"3.1","10":"6.7"},{"1":"6.3","2":"2.3","3":"4.4","4":"1.3","5":"versicolor","6":"versicolor","7":"1.3","8":"4.4","9":"2.3","10":"6.3"},{"1":"5.6","2":"3.0","3":"4.1","4":"1.3","5":"versicolor","6":"versicolor","7":"1.3","8":"4.1","9":"3.0","10":"5.6"},{"1":"5.5","2":"2.5","3":"4.0","4":"1.3","5":"versicolor","6":"versicolor","7":"1.3","8":"4.0","9":"2.5","10":"5.5"},{"1":"5.5","2":"2.6","3":"4.4","4":"1.2","5":"versicolor","6":"versicolor","7":"1.2","8":"4.4","9":"2.6","10":"5.5"},{"1":"6.1","2":"3.0","3":"4.6","4":"1.4","5":"versicolor","6":"versicolor","7":"1.4","8":"4.6","9":"3.0","10":"6.1"},{"1":"5.8","2":"2.6","3":"4.0","4":"1.2","5":"versicolor","6":"versicolor","7":"1.2","8":"4.0","9":"2.6","10":"5.8"},{"1":"5.0","2":"2.3","3":"3.3","4":"1.0","5":"versicolor","6":"versicolor","7":"1.0","8":"3.3","9":"2.3","10":"5.0"},{"1":"5.6","2":"2.7","3":"4.2","4":"1.3","5":"versicolor","6":"versicolor","7":"1.3","8":"4.2","9":"2.7","10":"5.6"},{"1":"5.7","2":"3.0","3":"4.2","4":"1.2","5":"versicolor","6":"versicolor","7":"1.2","8":"4.2","9":"3.0","10":"5.7"},{"1":"5.7","2":"2.9","3":"4.2","4":"1.3","5":"versicolor","6":"versicolor","7":"1.3","8":"4.2","9":"2.9","10":"5.7"},{"1":"6.2","2":"2.9","3":"4.3","4":"1.3","5":"versicolor","6":"versicolor","7":"1.3","8":"4.3","9":"2.9","10":"6.2"},{"1":"5.1","2":"2.5","3":"3.0","4":"1.1","5":"versicolor","6":"versicolor","7":"1.1","8":"3.0","9":"2.5","10":"5.1"},{"1":"5.7","2":"2.8","3":"4.1","4":"1.3","5":"versicolor","6":"versicolor","7":"1.3","8":"4.1","9":"2.8","10":"5.7"},{"1":"6.3","2":"3.3","3":"6.0","4":"2.5","5":"virginica","6":"virginica","7":"2.5","8":"6.0","9":"3.3","10":"6.3"},{"1":"5.8","2":"2.7","3":"5.1","4":"1.9","5":"virginica","6":"virginica","7":"1.9","8":"5.1","9":"2.7","10":"5.8"},{"1":"7.1","2":"3.0","3":"5.9","4":"2.1","5":"virginica","6":"virginica","7":"2.1","8":"5.9","9":"3.0","10":"7.1"},{"1":"6.3","2":"2.9","3":"5.6","4":"1.8","5":"virginica","6":"virginica","7":"1.8","8":"5.6","9":"2.9","10":"6.3"},{"1":"6.5","2":"3.0","3":"5.8","4":"2.2","5":"virginica","6":"virginica","7":"2.2","8":"5.8","9":"3.0","10":"6.5"},{"1":"7.6","2":"3.0","3":"6.6","4":"2.1","5":"virginica","6":"virginica","7":"2.1","8":"6.6","9":"3.0","10":"7.6"},{"1":"4.9","2":"2.5","3":"4.5","4":"1.7","5":"virginica","6":"virginica","7":"1.7","8":"4.5","9":"2.5","10":"4.9"},{"1":"7.3","2":"2.9","3":"6.3","4":"1.8","5":"virginica","6":"virginica","7":"1.8","8":"6.3","9":"2.9","10":"7.3"},{"1":"6.7","2":"2.5","3":"5.8","4":"1.8","5":"virginica","6":"virginica","7":"1.8","8":"5.8","9":"2.5","10":"6.7"},{"1":"7.2","2":"3.6","3":"6.1","4":"2.5","5":"virginica","6":"virginica","7":"2.5","8":"6.1","9":"3.6","10":"7.2"},{"1":"6.5","2":"3.2","3":"5.1","4":"2.0","5":"virginica","6":"virginica","7":"2.0","8":"5.1","9":"3.2","10":"6.5"},{"1":"6.4","2":"2.7","3":"5.3","4":"1.9","5":"virginica","6":"virginica","7":"1.9","8":"5.3","9":"2.7","10":"6.4"},{"1":"6.8","2":"3.0","3":"5.5","4":"2.1","5":"virginica","6":"virginica","7":"2.1","8":"5.5","9":"3.0","10":"6.8"},{"1":"5.7","2":"2.5","3":"5.0","4":"2.0","5":"virginica","6":"virginica","7":"2.0","8":"5.0","9":"2.5","10":"5.7"},{"1":"5.8","2":"2.8","3":"5.1","4":"2.4","5":"virginica","6":"virginica","7":"2.4","8":"5.1","9":"2.8","10":"5.8"},{"1":"6.4","2":"3.2","3":"5.3","4":"2.3","5":"virginica","6":"virginica","7":"2.3","8":"5.3","9":"3.2","10":"6.4"},{"1":"6.5","2":"3.0","3":"5.5","4":"1.8","5":"virginica","6":"virginica","7":"1.8","8":"5.5","9":"3.0","10":"6.5"},{"1":"7.7","2":"3.8","3":"6.7","4":"2.2","5":"virginica","6":"virginica","7":"2.2","8":"6.7","9":"3.8","10":"7.7"},{"1":"7.7","2":"2.6","3":"6.9","4":"2.3","5":"virginica","6":"virginica","7":"2.3","8":"6.9","9":"2.6","10":"7.7"},{"1":"6.0","2":"2.2","3":"5.0","4":"1.5","5":"virginica","6":"virginica","7":"1.5","8":"5.0","9":"2.2","10":"6.0"},{"1":"6.9","2":"3.2","3":"5.7","4":"2.3","5":"virginica","6":"virginica","7":"2.3","8":"5.7","9":"3.2","10":"6.9"},{"1":"5.6","2":"2.8","3":"4.9","4":"2.0","5":"virginica","6":"virginica","7":"2.0","8":"4.9","9":"2.8","10":"5.6"},{"1":"7.7","2":"2.8","3":"6.7","4":"2.0","5":"virginica","6":"virginica","7":"2.0","8":"6.7","9":"2.8","10":"7.7"},{"1":"6.3","2":"2.7","3":"4.9","4":"1.8","5":"virginica","6":"virginica","7":"1.8","8":"4.9","9":"2.7","10":"6.3"},{"1":"6.7","2":"3.3","3":"5.7","4":"2.1","5":"virginica","6":"virginica","7":"2.1","8":"5.7","9":"3.3","10":"6.7"},{"1":"7.2","2":"3.2","3":"6.0","4":"1.8","5":"virginica","6":"virginica","7":"1.8","8":"6.0","9":"3.2","10":"7.2"},{"1":"6.2","2":"2.8","3":"4.8","4":"1.8","5":"virginica","6":"virginica","7":"1.8","8":"4.8","9":"2.8","10":"6.2"},{"1":"6.1","2":"3.0","3":"4.9","4":"1.8","5":"virginica","6":"virginica","7":"1.8","8":"4.9","9":"3.0","10":"6.1"},{"1":"6.4","2":"2.8","3":"5.6","4":"2.1","5":"virginica","6":"virginica","7":"2.1","8":"5.6","9":"2.8","10":"6.4"},{"1":"7.2","2":"3.0","3":"5.8","4":"1.6","5":"virginica","6":"virginica","7":"1.6","8":"5.8","9":"3.0","10":"7.2"},{"1":"7.4","2":"2.8","3":"6.1","4":"1.9","5":"virginica","6":"virginica","7":"1.9","8":"6.1","9":"2.8","10":"7.4"},{"1":"7.9","2":"3.8","3":"6.4","4":"2.0","5":"virginica","6":"virginica","7":"2.0","8":"6.4","9":"3.8","10":"7.9"},{"1":"6.4","2":"2.8","3":"5.6","4":"2.2","5":"virginica","6":"virginica","7":"2.2","8":"5.6","9":"2.8","10":"6.4"},{"1":"6.3","2":"2.8","3":"5.1","4":"1.5","5":"virginica","6":"virginica","7":"1.5","8":"5.1","9":"2.8","10":"6.3"},{"1":"6.1","2":"2.6","3":"5.6","4":"1.4","5":"virginica","6":"virginica","7":"1.4","8":"5.6","9":"2.6","10":"6.1"},{"1":"7.7","2":"3.0","3":"6.1","4":"2.3","5":"virginica","6":"virginica","7":"2.3","8":"6.1","9":"3.0","10":"7.7"},{"1":"6.3","2":"3.4","3":"5.6","4":"2.4","5":"virginica","6":"virginica","7":"2.4","8":"5.6","9":"3.4","10":"6.3"},{"1":"6.4","2":"3.1","3":"5.5","4":"1.8","5":"virginica","6":"virginica","7":"1.8","8":"5.5","9":"3.1","10":"6.4"},{"1":"6.0","2":"3.0","3":"4.8","4":"1.8","5":"virginica","6":"virginica","7":"1.8","8":"4.8","9":"3.0","10":"6.0"},{"1":"6.9","2":"3.1","3":"5.4","4":"2.1","5":"virginica","6":"virginica","7":"2.1","8":"5.4","9":"3.1","10":"6.9"},{"1":"6.7","2":"3.1","3":"5.6","4":"2.4","5":"virginica","6":"virginica","7":"2.4","8":"5.6","9":"3.1","10":"6.7"},{"1":"6.9","2":"3.1","3":"5.1","4":"2.3","5":"virginica","6":"virginica","7":"2.3","8":"5.1","9":"3.1","10":"6.9"},{"1":"5.8","2":"2.7","3":"5.1","4":"1.9","5":"virginica","6":"virginica","7":"1.9","8":"5.1","9":"2.7","10":"5.8"},{"1":"6.8","2":"3.2","3":"5.9","4":"2.3","5":"virginica","6":"virginica","7":"2.3","8":"5.9","9":"3.2","10":"6.8"},{"1":"6.7","2":"3.3","3":"5.7","4":"2.5","5":"virginica","6":"virginica","7":"2.5","8":"5.7","9":"3.3","10":"6.7"},{"1":"6.7","2":"3.0","3":"5.2","4":"2.3","5":"virginica","6":"virginica","7":"2.3","8":"5.2","9":"3.0","10":"6.7"},{"1":"6.3","2":"2.5","3":"5.0","4":"1.9","5":"virginica","6":"virginica","7":"1.9","8":"5.0","9":"2.5","10":"6.3"},{"1":"6.5","2":"3.0","3":"5.2","4":"2.0","5":"virginica","6":"virginica","7":"2.0","8":"5.2","9":"3.0","10":"6.5"},{"1":"6.2","2":"3.4","3":"5.4","4":"2.3","5":"virginica","6":"virginica","7":"2.3","8":"5.4","9":"3.4","10":"6.2"},{"1":"5.9","2":"3.0","3":"5.1","4":"1.8","5":"virginica","6":"virginica","7":"1.8","8":"5.1","9":"3.0","10":"5.9"}],"options":{"columns":{"min":{},"max":[10]},"rows":{"min":[75],"max":[75]},"pages":{}}}
  </script>
</div>

## Job Submission with `sbatch`

Print information about queues/partitions available on a cluster.


```bash
sinfo 
```

Compute jobs are submitted with `sbatch` via a submission script (here `script_name.sh`).


```bash
sbatch script_name.sh
```

Sample submission script


```bash
#!/bin/bash -l

#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=1G
#SBATCH --time=1-00:15:00 # 1 day and 15 minutes
#SBATCH --mail-user=useremail@address.com
#SBATCH --mail-type=ALL
#SBATCH --job-name="some_test"
#SBATCH -p batch # Choose queue/parition from: intel, batch, highmem, gpu, short

myscript.sh
```

Interactive session with specific resource requests


```bash
srun --x11 --partition=short --mem=2gb --cpus-per-task 4 --ntasks 1 --time 1:00:00 --pty bash -l
```

## DataTables support


```r
library(DT)
datatable(iris)
```

<!--html_preserve--><div id="htmlwidget-1f89505ebf0205d56878" style="width:100%;height:auto;" class="datatables html-widget"></div>
<script type="application/json" data-for="htmlwidget-1f89505ebf0205d56878">{"x":{"filter":"none","data":[["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40","41","42","43","44","45","46","47","48","49","50","51","52","53","54","55","56","57","58","59","60","61","62","63","64","65","66","67","68","69","70","71","72","73","74","75","76","77","78","79","80","81","82","83","84","85","86","87","88","89","90","91","92","93","94","95","96","97","98","99","100","101","102","103","104","105","106","107","108","109","110","111","112","113","114","115","116","117","118","119","120","121","122","123","124","125","126","127","128","129","130","131","132","133","134","135","136","137","138","139","140","141","142","143","144","145","146","147","148","149","150"],[5.1,4.9,4.7,4.6,5,5.4,4.6,5,4.4,4.9,5.4,4.8,4.8,4.3,5.8,5.7,5.4,5.1,5.7,5.1,5.4,5.1,4.6,5.1,4.8,5,5,5.2,5.2,4.7,4.8,5.4,5.2,5.5,4.9,5,5.5,4.9,4.4,5.1,5,4.5,4.4,5,5.1,4.8,5.1,4.6,5.3,5,7,6.4,6.9,5.5,6.5,5.7,6.3,4.9,6.6,5.2,5,5.9,6,6.1,5.6,6.7,5.6,5.8,6.2,5.6,5.9,6.1,6.3,6.1,6.4,6.6,6.8,6.7,6,5.7,5.5,5.5,5.8,6,5.4,6,6.7,6.3,5.6,5.5,5.5,6.1,5.8,5,5.6,5.7,5.7,6.2,5.1,5.7,6.3,5.8,7.1,6.3,6.5,7.6,4.9,7.3,6.7,7.2,6.5,6.4,6.8,5.7,5.8,6.4,6.5,7.7,7.7,6,6.9,5.6,7.7,6.3,6.7,7.2,6.2,6.1,6.4,7.2,7.4,7.9,6.4,6.3,6.1,7.7,6.3,6.4,6,6.9,6.7,6.9,5.8,6.8,6.7,6.7,6.3,6.5,6.2,5.9],[3.5,3,3.2,3.1,3.6,3.9,3.4,3.4,2.9,3.1,3.7,3.4,3,3,4,4.4,3.9,3.5,3.8,3.8,3.4,3.7,3.6,3.3,3.4,3,3.4,3.5,3.4,3.2,3.1,3.4,4.1,4.2,3.1,3.2,3.5,3.6,3,3.4,3.5,2.3,3.2,3.5,3.8,3,3.8,3.2,3.7,3.3,3.2,3.2,3.1,2.3,2.8,2.8,3.3,2.4,2.9,2.7,2,3,2.2,2.9,2.9,3.1,3,2.7,2.2,2.5,3.2,2.8,2.5,2.8,2.9,3,2.8,3,2.9,2.6,2.4,2.4,2.7,2.7,3,3.4,3.1,2.3,3,2.5,2.6,3,2.6,2.3,2.7,3,2.9,2.9,2.5,2.8,3.3,2.7,3,2.9,3,3,2.5,2.9,2.5,3.6,3.2,2.7,3,2.5,2.8,3.2,3,3.8,2.6,2.2,3.2,2.8,2.8,2.7,3.3,3.2,2.8,3,2.8,3,2.8,3.8,2.8,2.8,2.6,3,3.4,3.1,3,3.1,3.1,3.1,2.7,3.2,3.3,3,2.5,3,3.4,3],[1.4,1.4,1.3,1.5,1.4,1.7,1.4,1.5,1.4,1.5,1.5,1.6,1.4,1.1,1.2,1.5,1.3,1.4,1.7,1.5,1.7,1.5,1,1.7,1.9,1.6,1.6,1.5,1.4,1.6,1.6,1.5,1.5,1.4,1.5,1.2,1.3,1.4,1.3,1.5,1.3,1.3,1.3,1.6,1.9,1.4,1.6,1.4,1.5,1.4,4.7,4.5,4.9,4,4.6,4.5,4.7,3.3,4.6,3.9,3.5,4.2,4,4.7,3.6,4.4,4.5,4.1,4.5,3.9,4.8,4,4.9,4.7,4.3,4.4,4.8,5,4.5,3.5,3.8,3.7,3.9,5.1,4.5,4.5,4.7,4.4,4.1,4,4.4,4.6,4,3.3,4.2,4.2,4.2,4.3,3,4.1,6,5.1,5.9,5.6,5.8,6.6,4.5,6.3,5.8,6.1,5.1,5.3,5.5,5,5.1,5.3,5.5,6.7,6.9,5,5.7,4.9,6.7,4.9,5.7,6,4.8,4.9,5.6,5.8,6.1,6.4,5.6,5.1,5.6,6.1,5.6,5.5,4.8,5.4,5.6,5.1,5.1,5.9,5.7,5.2,5,5.2,5.4,5.1],[0.2,0.2,0.2,0.2,0.2,0.4,0.3,0.2,0.2,0.1,0.2,0.2,0.1,0.1,0.2,0.4,0.4,0.3,0.3,0.3,0.2,0.4,0.2,0.5,0.2,0.2,0.4,0.2,0.2,0.2,0.2,0.4,0.1,0.2,0.2,0.2,0.2,0.1,0.2,0.2,0.3,0.3,0.2,0.6,0.4,0.3,0.2,0.2,0.2,0.2,1.4,1.5,1.5,1.3,1.5,1.3,1.6,1,1.3,1.4,1,1.5,1,1.4,1.3,1.4,1.5,1,1.5,1.1,1.8,1.3,1.5,1.2,1.3,1.4,1.4,1.7,1.5,1,1.1,1,1.2,1.6,1.5,1.6,1.5,1.3,1.3,1.3,1.2,1.4,1.2,1,1.3,1.2,1.3,1.3,1.1,1.3,2.5,1.9,2.1,1.8,2.2,2.1,1.7,1.8,1.8,2.5,2,1.9,2.1,2,2.4,2.3,1.8,2.2,2.3,1.5,2.3,2,2,1.8,2.1,1.8,1.8,1.8,2.1,1.6,1.9,2,2.2,1.5,1.4,2.3,2.4,1.8,1.8,2.1,2.4,2.3,1.9,2.3,2.5,2.3,1.9,2,2.3,1.8],["setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica"]],"container":"<table class=\"display\">\n  <thead>\n    <tr>\n      <th> <\/th>\n      <th>Sepal.Length<\/th>\n      <th>Sepal.Width<\/th>\n      <th>Petal.Length<\/th>\n      <th>Petal.Width<\/th>\n      <th>Species<\/th>\n    <\/tr>\n  <\/thead>\n<\/table>","options":{"columnDefs":[{"className":"dt-right","targets":[1,2,3,4]},{"orderable":false,"targets":0}],"order":[],"autoWidth":false,"orderClasses":false}},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

## Font Size 

- Note: the default in ioslides uses larger font sizes where `'smaller: false'` is used. You usually have it set to `'smaller: true'`
- With default turned one can also set smaller font sizes on a per slide basis by specifying `'{.smaller}'` at the end of a slide title
- To have more fine control over font size use embedded HTML code. Here are some examples:
   + <span style="font-size: 28px;">
        HTML font size 28px
     </span>
   + <span style="font-size: 18px;">
        HTML font size 18px
     </span>
   + <span style="font-size: 14px;">
        HTML font size 14px
     </span>
   + <span style="font-size: 12px;">
        HTML font size 12px
     </span>

## Center Text {.flexbox .vcenter}

- To vertically center content, use the `{.flexbox .vcenter}` option after the title of a slide
- <div class="centered">HTML tags can also be used. </div>

## Two Column Layout

This can be useful to have a figure on the right and bullets describing it on the left.

<div class="columns-2">
  - Bullet 1
  - Bullet 2
  - Bullet 3
  
  ![](./images/nia_logo.png)
</div>


# Outline

- Basics
- Scalable Complexity via Scrolling 
- <div class="white">__Images and Graphics __</div>
- References

## Images {.flexbox .vcenter .smaller}

<img src="./images/DSC02629.jpg" alt="Drawing" style="width: 800px;"/>
</div><br></br>

- Using HTML code to insert image is most flexible

## Background Images {data-background=./images/DSC02629.jpg data-background-size=cover}

- Bullet 1
- Bullet 2
- Bullet 3

## Real-time Graphics Code Evaluation {.flexbox .vcenter .smaller}


```r
library(dplyr); library(ggplot2); library(reshape2)
iris %>% 
    group_by(Species) %>% 
    summarize_all(mean) %>% 
    reshape2::melt(id.vars=c("Species"), variable.name = "Samples", value.name="Values") %>%
    ggplot(aes(Samples, Values, fill = Species)) + 
    geom_bar(position="dodge", stat="identity")
```

![](ioslide_template_files/figure-html/plyr_chaining1-1.png)<!-- -->

# Outline

- Basics
- Scalable Complexity via Scrolling 
- Images and Graphics
- <div class="white">__References __</div>


## References {.smaller}

