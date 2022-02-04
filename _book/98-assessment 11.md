

# Papers



## Paper One

### Task

Working individually and in an entirely reproducible way, please find a dataset of interest on [Open Data Toronto](https://open.toronto.ca) and write a short paper telling a story about the data.

### Guidance

Recommended steps:

1. Find a dataset of interest on [Open Data Toronto](https://open.toronto.ca) and download it in a reproducible way using `opendatatoronto` [@citeSharla]. 
2. Create a folder with appropriate sub-folders, add it to GitHub, and then prepare a PDF using R Markdown with these sections (you are welcome to use the [starter folder](https://github.com/RohanAlexander/starter_folder)): title, author, date, abstract, introduction, data, and references. 
3. In the data section thoroughly and precisely discuss the source of the data and the bias this brings (ethical, statistical, and otherwise). Comprehensively describe and summarize the data using text and at least one graph and one table. Graphs must be made with `ggplot2` [@citeggplot] and tables must be made with `knitr` [@citeknitr] or `gt` [@citegt]. Graphs must show the actual data, or as close to it as possible, not summary statistics. Make sure to cross-reference graphs and tables.
4. Add references by using a bib file. Be sure to reference R and any R packages you use, as well as the dataset. Check that you have referenced everything. Strong submissions will draw on related literature and would also reference those. There are various options in R Markdown for references style; just pick one that you are used to.
5. Go back and write an introduction. This should be two or three paragraphs. The last paragraph should set out the remainder of the paper.
6. Add an abstract. This should be three or four sentences. If your abstract is longer than four sentences, then you need to think a lot about whether it is too long. It may be fine (there are always exceptions) but you should probably have a good reason. Your abstract must tell the reader your top-level finding. What is the one thing that we learn about the world because of your paper? 
7. Add a descriptive title.

Additional points:

- There should not be any sign this is a school paper.
- Add a link to your GitHub repo using a footnote.
- Check that your GitHub repo is well-organized, and add an informative README. Comment your code. Make sure that you have got at least one R script in there, in addition, to your R Markdown file.
- Pull this all together as a PDF and check that the paper is well-written and able to be understood by the average reader of, say, FiveThirtyEight. This means that you are allowed to use mathematical notation, but you must explain all of it in plain language. All statistical concepts and terminology must be explained. Your reader is someone with a university education, but not necessarily someone who understands what a p-value is.
- Check there is no evidence that this is a class assignment.
- Via Quercus, submit the PDF.


### Checks

- Check you have not included any R code or raw R output in the final PDF.
- Check that although you will probably have most of your code in the R Markdown, make sure that you have at least one R script in the 'scripts' folder.
- Check there is thoroughly commented code that directly creates your PDF. Do not 'knit to html' and then save as a PDF. Do not 'knit to Word' and then save as a PDF
- Check that your graphs, tables, and text are extremely clear, and of comparable quality to those of FiveThirtyEight.
- Check that the date is updated.
- Check your entire workflow is entirely reproducible.
- Check for typos.


### FAQ

- Can I use a dataset from Kaggle instead? No, because they have done the hard work for you.
- I cannot use code to download my dataset, can I just manually download it? No, because your entire workflow needs to be reproducible. Please fix the download problem or pick a different dataset.
- How much should I write? Most students submit something in the two-to-six-page range, but it is up to you. Be precise and thorough.
- My data is about apartment blocks/NBA/League of Legends so there's no ethical or bias aspect, what do I do? Please re-read the readings to better understand bias and ethics. If you really cannot think of something, then it might be worth picking a different dataset.
- Can I use Python? No. If you already know Python then it doesn't hurt to learn another language.
- Why do I need to cite R, when I don't need to cite Word? R is a free statistical programming language with academic origins, so it is appropriate to acknowledge the work of others. it is also important for reproducibility.

### Rubric


```{=html}
<div id="fzaertcflw" style="overflow-x:auto;overflow-y:auto;width:auto;height:auto;">
<style>html {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
}

#fzaertcflw .gt_table {
  display: table;
  border-collapse: collapse;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
  font-weight: normal;
  font-style: normal;
  background-color: #FFFFFF;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}

#fzaertcflw .gt_heading {
  background-color: #FFFFFF;
  text-align: center;
  border-bottom-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#fzaertcflw .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}

#fzaertcflw .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 0;
  padding-bottom: 6px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}

#fzaertcflw .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#fzaertcflw .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#fzaertcflw .gt_col_heading {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}

#fzaertcflw .gt_column_spanner_outer {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}

#fzaertcflw .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#fzaertcflw .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#fzaertcflw .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 5px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}

#fzaertcflw .gt_group_heading {
  padding: 8px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
}

#fzaertcflw .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}

#fzaertcflw .gt_from_md > :first-child {
  margin-top: 0;
}

#fzaertcflw .gt_from_md > :last-child {
  margin-bottom: 0;
}

#fzaertcflw .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}

#fzaertcflw .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 12px;
}

#fzaertcflw .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#fzaertcflw .gt_first_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
}

#fzaertcflw .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#fzaertcflw .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#fzaertcflw .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#fzaertcflw .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#fzaertcflw .gt_footnotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#fzaertcflw .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding: 4px;
}

#fzaertcflw .gt_sourcenotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#fzaertcflw .gt_sourcenote {
  font-size: 90%;
  padding: 4px;
}

#fzaertcflw .gt_left {
  text-align: left;
}

#fzaertcflw .gt_center {
  text-align: center;
}

#fzaertcflw .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#fzaertcflw .gt_font_normal {
  font-weight: normal;
}

#fzaertcflw .gt_font_bold {
  font-weight: bold;
}

#fzaertcflw .gt_font_italic {
  font-style: italic;
}

#fzaertcflw .gt_super {
  font-size: 65%;
}

#fzaertcflw .gt_footnote_marks {
  font-style: italic;
  font-weight: normal;
  font-size: 65%;
}
</style>
<table class="gt_table">
  
  <thead class="gt_col_headings">
    <tr>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1">Component</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1">Range</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1">Requirement</th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr><td class="gt_row gt_left">R is appropriately cited</td>
<td class="gt_row gt_left">0 - 'No'; 1 - 'Yes'</td>
<td class="gt_row gt_left">Both referred to in the main content and included in the reference list. If not, no need to continue marking, just give paper 0 overall.</td></tr>
    <tr><td class="gt_row gt_left">Title</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 1 - 'Yes'; 2 - 'Exceptional'</td>
<td class="gt_row gt_left">An informative title is included. Tell the reader what your story is don't waste their time. Ideally tell them what happens at the end of the story. 'Problem Set X' is not an informative title. There should be no evidence this is a school paper.</td></tr>
    <tr><td class="gt_row gt_left">Author, date, and repo</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 2 - 'Yes'</td>
<td class="gt_row gt_left">The author, date of submission, and a link to a GitHub repo are clearly included. (The later likely, but not necessarily, through a statement such as: 'Code and data supporting this analysis is available at: LINK').</td></tr>
    <tr><td class="gt_row gt_left">Abstract</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 1 - 'Gets job done'; 2 - 'Fine'; 3 - 'Great'; 4 - 'Exceptional'</td>
<td class="gt_row gt_left">An abstract is included and appropriately pitched to a general audience. The abstract answers: 1) what was done, 2) what was found, and 3) why this matters (all at a high level). If your abstract is longer than four sentences then you need to think a lot about whether it is too long. It may be fine (there are always exceptions) but you should probably have a good reason. Your abstract must tell the reader your top-level finding. What is the one thing that we learn about the world because of your paper?</td></tr>
    <tr><td class="gt_row gt_left">Introduction</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 1 - 'Gets job done'; 2 - 'Fine'; 3 - 'Great'; 4 - 'Exceptional'</td>
<td class="gt_row gt_left">The introduction is self-contained and tells a reader everything they need to know, including putting it into a broader context. Your introduction should provide a bit of broader context to motivate the reader, as well as providing a bit more detail about what you're interested in, what you did, what you found, why it's important, etc. A reader should be able to read only your introduction and have a good idea about the research that you carried out. It would be rare that you would have tables or figures in your introduction (again there are always exceptions but think deeply about whether yours is one). It must outline the structure of the paper. For instance (and this is just a rough guide) an introduction for a 10 page paper, should probably be about 3 or 4 paragraphs, or 10 per cent, but it depends on specifics.</td></tr>
    <tr><td class="gt_row gt_left">Data</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 2 - 'Many issues'; 4 - 'Some issues'; 6 - 'Good'; 8 - 'Great'; 10 - 'Exceptional'</td>
<td class="gt_row gt_left">You should thoroughly discuss the variables in the dataset that you use. Are there any that are very similar that you nonetheless don't use? Did you construct any variables by combining various ones? What do the data look like? Plot the actual data that you're using (or as close as you can get to it). Discuss these plots and the other features of these data. These are just some of the issues strong submissions will consider. Show off your knowledge. If this becomes too detailed, then you should push some of this to footnotes or an appendix. 'Exceptional' means that when I read your submission I learn something about the dataset that I don't learn from any other submission (within a reasonable measure of course).</td></tr>
    <tr><td class="gt_row gt_left">Cross-references</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 2 - 'Yes'</td>
<td class="gt_row gt_left">All figures, tables, equations, etc are numbered, cross-referenced, and referred to in the text.</td></tr>
    <tr><td class="gt_row gt_left">Proofreading</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 2 - 'Yes'</td>
<td class="gt_row gt_left">All aspects of submission are free of noticeable typos.</td></tr>
    <tr><td class="gt_row gt_left">Graphs/tables/etc</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 1 - 'Gets job done'; 2 - 'Fine'; 3 - 'Great'; 4 - 'Exceptional'</td>
<td class="gt_row gt_left">You must include graphs and tables in your paper and they must be to a high standard. They must be well formatted and camera-ready They should be clear and digestible. They must: 1) serve a clear purpose; 2) be fully self-contained through appropriate use of labels/explanations, etc; and 3) appropriately sized and coloured (or appropriate significant figures in the case of stats).</td></tr>
    <tr><td class="gt_row gt_left">References</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 3 - 'One minor issue'; 4 - 'Perfect'</td>
<td class="gt_row gt_left">All data/software/literature/etc are appropriately noted and cited. You must cite the software and software packages that you use. You must cite the datasets that you use. You must cite literature that you refer to (and you should refer to literature). If you take a small chunk of code from Stack Overflow then add the page in a comment next to the code. If you take a large chunk of code then cite it fully. 3 means one minor issue. More than one minor issue receives 0.</td></tr>
    <tr><td class="gt_row gt_left">Reproducibility</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 1 - 'Gets job done'; 2 - 'Fine'; 3 - 'Great'; 4 - 'Exceptional'</td>
<td class="gt_row gt_left">The paper and analysis must be fully reproducible. A detailed README is included. All code should be thoroughly documented. An R project is used. Do not use `setwd()`. The code must appropriately read data, prepare it, create plots, conduct analysis, generate documents, etc. Seeds are used where needed. Code must have a preamble etc. You must appropriately document your scripts such that someone coming in could follow them. Your repo must be thoroughly organized and not contain extraneous files.</td></tr>
    <tr><td class="gt_row gt_left">General excellence</td>
<td class="gt_row gt_left">0 - 'None'; 1 - 'Huh, that's interesting'; 2 - 'Wow'; 3 - 'Exceptional'</td>
<td class="gt_row gt_left">There are always students that excel in a way that is not anticipated in the rubric. This item accounts for that.</td></tr>
  </tbody>
  
  
</table>
</div>
```

### Previous examples

Some examples of papers that well in the past include those by: [Amy Farrow](inputs/pdfs/Mandatory_minimums-Amy_Farrow.pdf), [Morgaine Westin](inputs/pdfs/Mandatory_minimums-Morgaine_Westin.pdf), and [Rachel Lam](inputs/pdfs/Mandatory_minimums-Rachel_Lam.pdf).

\newpage




## Paper Two

### Task

- Working as part of a small team of 1-3 people, and in an entirely reproducible way, please pick a paper with code and data, published anytime since 2019, in an American Economic Association journal. These journals are: 'American Economic Review', 'AER: Insights', 'AEJ: Applied Economics', 'AEJ: Economic Policy', 'AEJ: Macroeconomics', 'AEJ: Microeconomics', 'Journal of Economic Literature', 'Journal of Economic Perspectives', 'AEA Papers & Proceedings'. And then can be seen here: https://www.aeaweb.org/journals.
- Following the [*Guide for Accelerating Computational Reproducibility in the Social Sciences*](https://bitss.github.io/ACRE/), please conduct a **replication**^[Note that our language follows @barba2018terminologies, however it is the opposite of that used by BITSS.] of at least three graphs or tables using the [Social Science Reproduction Platform](https://www.socialsciencereproduction.org). Submit the DOI of your replication.
- Then conduct a **reproduction** of a few aspects, and write a short paper about that.

### Guidance


Recommended steps:

1. Form a team of 1-3 people.
2. Pick a paper that is of interest and appropriate. The paper should be based on data, and those data should be available to you.
3. Follow the *Guide for Accelerating Computational Reproducibility in the Social Sciences* to replicate at least three graphs or tables using the Social Science Reproduction Platform. Note the DOI of the replication.
4. Having done a **replication**, we now turn to **reproduction**.
5. Create a folder with appropriate sub-folders, add it to GitHub, and then prepare a PDF using R Markdown with these sections (you are welcome to use this starter folder: https://github.com/RohanAlexander/starter_folder): title, author, date, abstract, introduction, data, results, discussion, and references. 
6. Pick an aspect of the paper to focus on reproducing (these could be the same aspects that you replicated). Follow the lead of the paper, but make it your own. That means you should ask a slightly different question, or answer the same question in a slightly different way.


Other points:

- In the discussion section and any other relevant section, please be sure to discuss ethics and bias with reference to relevant literature.
- Thoroughly think about, and discuss, what you are doing. 
- Your paper must be well-written, draw on relevant literature, and show your statistical skills by explaining all statistical concepts that you draw on. 
- You are welcome to use appendices for supporting, but not critical, material. Your discussion must include sub-sections that focus on three or four interesting points, and also sub-sections on weaknesses and next steps.
- In your paper you must provide a link to a GitHub repo that fully contains your analysis and also include the DOI to your replication. 
- Code must be entirely reproducible, documented, and readable. The repository must be well-organized and appropriately use folders.
- Your graphs and tables must be of a high standard. Graphs and tables should be well formatted and report-ready. They should be clean and digestible. Furthermore, you should label and describe each table/figure.


- Check that you have referenced everything. Strong submissions will draw on related literature in the discussion (and other sections) and would be sure to also reference those. The style of references does not matter, provided it is consistent.
- As a team, via Quercus, submit a PDF of your paper. Again, in your paper you must have a link to the associated GitHub repository and the DOI of the Social Science Reproduction Platform replication. 
- The repository must be well-organized and have a detailed README.
- A good way to work as a team would be to split up the work, so that one person is doing each section. The people doing the sections that rely on data (such as the analysis and the graphs) could just simulate it while they are waiting for the person putting together the data to finish.
- It is expected that your submission be well written and able to be understood by the average reader of say 538. This means that you are allowed to use mathematical notation, but you must be able to explain it all in plain English. Similarly, you can (and hint: you should) use survey, sampling, observational, and statistical terminology, but again you need to explain it. Your work should have flow and should be easy to follow and understand. To communicate well, anyone at the university level should be able to read your report once and relay back the methodology, overall results, findings, weaknesses and next steps without confusion. 
- Everyone in the team receives the same mark.
- There should be no evidence that this is a class assignment.


### Checks

- Check that in your paper you have not just copy/pasted the code from the original paper, but have instead used that as a foundation to work from.

### FAQ

- How much should I write? Most students submit something in the 10-to-15-page range, but it is up to you. Be precise and thorough.

### Rubric



```{=html}
<div id="eelszoxshx" style="overflow-x:auto;overflow-y:auto;width:auto;height:auto;">
<style>html {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
}

#eelszoxshx .gt_table {
  display: table;
  border-collapse: collapse;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
  font-weight: normal;
  font-style: normal;
  background-color: #FFFFFF;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}

#eelszoxshx .gt_heading {
  background-color: #FFFFFF;
  text-align: center;
  border-bottom-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#eelszoxshx .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}

#eelszoxshx .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 0;
  padding-bottom: 6px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}

#eelszoxshx .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#eelszoxshx .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#eelszoxshx .gt_col_heading {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}

#eelszoxshx .gt_column_spanner_outer {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}

#eelszoxshx .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#eelszoxshx .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#eelszoxshx .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 5px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}

#eelszoxshx .gt_group_heading {
  padding: 8px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
}

#eelszoxshx .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}

#eelszoxshx .gt_from_md > :first-child {
  margin-top: 0;
}

#eelszoxshx .gt_from_md > :last-child {
  margin-bottom: 0;
}

#eelszoxshx .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}

#eelszoxshx .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 12px;
}

#eelszoxshx .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#eelszoxshx .gt_first_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
}

#eelszoxshx .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#eelszoxshx .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#eelszoxshx .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#eelszoxshx .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#eelszoxshx .gt_footnotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#eelszoxshx .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding: 4px;
}

#eelszoxshx .gt_sourcenotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#eelszoxshx .gt_sourcenote {
  font-size: 90%;
  padding: 4px;
}

#eelszoxshx .gt_left {
  text-align: left;
}

#eelszoxshx .gt_center {
  text-align: center;
}

#eelszoxshx .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#eelszoxshx .gt_font_normal {
  font-weight: normal;
}

#eelszoxshx .gt_font_bold {
  font-weight: bold;
}

#eelszoxshx .gt_font_italic {
  font-style: italic;
}

#eelszoxshx .gt_super {
  font-size: 65%;
}

#eelszoxshx .gt_footnote_marks {
  font-style: italic;
  font-weight: normal;
  font-size: 65%;
}
</style>
<table class="gt_table">
  
  <thead class="gt_col_headings">
    <tr>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1">Component</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1">Range</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1">Requirement</th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr><td class="gt_row gt_left">R is appropriately cited</td>
<td class="gt_row gt_left">0 - 'No'; 1 - 'Yes'</td>
<td class="gt_row gt_left">Both referred to in the main content and included in the reference list. If not, no need to continue marking, just give paper 0 overall.</td></tr>
    <tr><td class="gt_row gt_left">Title</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 1 - 'Yes'; 2 - 'Exceptional'</td>
<td class="gt_row gt_left">An informative title is included. Tell the reader what your story is don't waste their time. Ideally tell them what happens at the end of the story. 'Problem Set X' is not an informative title. There should be no evidence this is a school paper.</td></tr>
    <tr><td class="gt_row gt_left">Author, date, and repo</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 2 - 'Yes'</td>
<td class="gt_row gt_left">The author, date of submission, and a link to a GitHub repo are clearly included. (The later likely, but not necessarily, through a statement such as: 'Code and data supporting this analysis is available at: LINK').</td></tr>
    <tr><td class="gt_row gt_left">Abstract</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 1 - 'Gets job done'; 2 - 'Fine'; 3 - 'Great'; 4 - 'Exceptional'</td>
<td class="gt_row gt_left">An abstract is included and appropriately pitched to a general audience. The abstract answers: 1) what was done, 2) what was found, and 3) why this matters (all at a high level). If your abstract is longer than four sentences then you need to think a lot about whether it is too long. It may be fine (there are always exceptions) but you should probably have a good reason. Your abstract must tell the reader your top-level finding. What is the one thing that we learn about the world because of your paper?</td></tr>
    <tr><td class="gt_row gt_left">Introduction</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 1 - 'Gets job done'; 2 - 'Fine'; 3 - 'Great'; 4 - 'Exceptional'</td>
<td class="gt_row gt_left">The introduction is self-contained and tells a reader everything they need to know, including putting it into a broader context. Your introduction should provide a bit of broader context to motivate the reader, as well as providing a bit more detail about what you're interested in, what you did, what you found, why it's important, etc. A reader should be able to read only your introduction and have a good idea about the research that you carried out. It would be rare that you would have tables or figures in your introduction (again there are always exceptions but think deeply about whether yours is one). It must outline the structure of the paper. For instance (and this is just a rough guide) an introduction for a 10 page paper, should probably be about 3 or 4 paragraphs, or 10 per cent, but it depends on specifics.</td></tr>
    <tr><td class="gt_row gt_left">Data</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 2 - 'Many issues'; 4 - 'Some issues'; 6 - 'Good'; 8 - 'Great'; 10 - 'Exceptional'</td>
<td class="gt_row gt_left">You should thoroughly discuss the variables in the dataset that you use. Are there any that are very similar that you nonetheless don't use? Did you construct any variables by combining various ones? What do the data look like? Plot the actual data that you're using (or as close as you can get to it). Discuss these plots and the other features of these data. These are just some of the issues strong submissions will consider. Show off your knowledge. If this becomes too detailed, then you should push some of this to footnotes or an appendix. 'Exceptional' means that when I read your submission I learn something about the dataset that I don't learn from any other submission (within a reasonable measure of course).</td></tr>
    <tr><td class="gt_row gt_left">Results</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 2 - 'Many issues'; 4 - 'Some issues'; 6 - 'Good'; 8 - 'Great'; 10 - 'Exceptional'</td>
<td class="gt_row gt_left">Results will likely require summary statistics, tables, graphs, images, and possibly statistical analysis or maps. To be clear, you should also have text associated with all these aspects. Show the reader the results by plotting them. Talk about them. Explain them. That said, this section should strictly relay results.</td></tr>
    <tr><td class="gt_row gt_left">Discussion</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 2 - 'Many issues'; 4 - 'Some issues'; 6 - 'Good'; 8 - 'Great'; 10 - 'Exceptional'</td>
<td class="gt_row gt_left">Some questions that a good discussion would cover include (each of these would be a sub-section of something like half a page to a page): What is done in this this paper? What is something that we learn about the world? What is another thing that we learn about the world? What are some weaknesses of what was done? What is left to learn or how should we proceed in the future?</td></tr>
    <tr><td class="gt_row gt_left">Cross-references</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 2 - 'Yes'</td>
<td class="gt_row gt_left">All figures, tables, equations, etc are numbered, cross-referenced, and referred to in the text.</td></tr>
    <tr><td class="gt_row gt_left">Proofreading</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 2 - 'Yes'</td>
<td class="gt_row gt_left">All aspects of submission are free of noticeable typos.</td></tr>
    <tr><td class="gt_row gt_left">Graphs/tables/etc</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 1 - 'Gets job done'; 2 - 'Fine'; 3 - 'Great'; 4 - 'Exceptional'</td>
<td class="gt_row gt_left">You must include graphs and tables in your paper and they must be to a high standard. They must be well formatted and camera-ready They should be clear and digestible. They must: 1) serve a clear purpose; 2) be fully self-contained through appropriate use of labels/explanations, etc; and 3) appropriately sized and coloured (or appropriate significant figures in the case of stats).</td></tr>
    <tr><td class="gt_row gt_left">References</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 3 - 'One minor issue'; 4 - 'Perfect'</td>
<td class="gt_row gt_left">All data/software/literature/etc are appropriately noted and cited. You must cite the software and software packages that you use. You must cite the datasets that you use. You must cite literature that you refer to (and you should refer to literature). If you take a small chunk of code from Stack Overflow then add the page in a comment next to the code. If you take a large chunk of code then cite it fully. 3 means one minor issue. More than one minor issue receives 0.</td></tr>
    <tr><td class="gt_row gt_left">Reproducibility</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 1 - 'Gets job done'; 2 - 'Fine'; 3 - 'Great'; 4 - 'Exceptional'</td>
<td class="gt_row gt_left">The paper and analysis must be fully reproducible. A detailed README is included. All code should be thoroughly documented. An R project is used. Do not use `setwd()`. The code must appropriately read data, prepare it, create plots, conduct analysis, generate documents, etc. Seeds are used where needed. Code must have a preamble etc. You must appropriately document your scripts such that someone coming in could follow them. Your repo must be thoroughly organized and not contain extraneous files.</td></tr>
    <tr><td class="gt_row gt_left">General excellence</td>
<td class="gt_row gt_left">0 - 'None'; 1 - 'Huh, that's interesting'; 2 - 'Wow'; 3 - 'Exceptional'</td>
<td class="gt_row gt_left">There are always students that excel in a way that is not anticipated in the rubric. This item accounts for that.</td></tr>
  </tbody>
  
  
</table>
</div>
```

### Previous examples

Some examples of papers that well in the past include those by: [Amy Farrow](inputs/pdfs/Farrow_Amy-replication_paper.pdf), [Laura Cline](inputs/pdfs/Cline_Laura-IndigenousWomenInPrison.pdf), [Hong Shi](inputs/pdfs/Shi_Hong-replication_paper.pdf), and [Jia Jia Ji](inputs/pdfs/Jia_Jia_Ji-effect_of_DLL_ON_spanish_literacy_skills.pdf).


\newpage







## Paper Three


### Task

Working in teams of one to three  people, please consider this scenario:

- 'You are employed as a junior statistician at Petit Poll - a Canadian polling company. Petit Poll has a contract with a Canadian political party to provide them with monthly polling updates.'
- Working as part of a small team of 1-3 people, and in an entirely reproducible way, please write a short paper that tells the client a story about their standing.


### Recommended steps

- Please pick a political party that you are 'working for', and pick a geographic focus: 1) the overall election, 2) a particular province, or 3) a specific riding. 
- Then decide on a survey methodology (hint: p. 13 of Wu & Thompson provides a handy checklist). Some questions you should address include: 
- What is the population, frame, and sample? 
- What sampling methods will you use and why (e.g. you could choose SRSWOR, stratified, etc). 
- What are some of the statistical properties that the method brings to the table (e.g. for SRSWOR you could discuss Wu & Thompson, Theorem 2.2, etc, as appropriate)? 
- How are you going to reach your desired respondents?
- How much do you estimate this will cost?
- What steps will you take to deal with non-response and how will non-response affect your survey? 
- How are you going to protect respondent privacy? 
- Remember to consider all of this in the context of your 'client' - for instance, who would be more interested in Alberta ridings: Bloc Québécois or the Conservatives? Who likely has more money to spend - the Liberals or the Greens?
- Develop a survey on a platform that was introduced in class. Be sure to test it yourselves. You will want to test this as much as possible, maybe even swap informally with another group?
- Now release the surveys into the (simulated) 'field'. Please do this by simulating an appropriate number of responses to your survey in R. Don't forget to simulate in relation to the survey methodology that you proposed. Show the results and discuss your 'findings'. Everything must be entirely reproducible. You may like to consider linking your survey 'responses' with other data such as the census or GSS.
- Use R Markdown to write a PDF report about all of this. Discuss your results and findings, your survey design and motivations, etc - all of it. You are writing a report that will eventually go to the 'client', so you must set the scene, and use language that demonstrates your command of statistical concepts but brings the reader along with you. Be sure to include graphs and tables and reference them in your discussion. Be sure to be clear about weaknesses and biases, and opportunities for future work. 
- Your report must be well written. You are allowed to, and should, use mathematical notation, but you must explain all of it in plain English. Similarly, you can, and should, use surveys/sampling/observational data terminology, but again, you need to explain it. 
- Your report must include at least the following aspects: title, date, authorship, non-technical executive summary, introduction, survey methodology, results, discussion, appendices that detail the survey, and references. Your 'client' has stats graduates working for it who need to be impressed by the main content of the report, but also has people who barely know what an average is and these people need to be impressed also. This is why your report should include a non-technical executive summary. In terms of length, this would typically be roughly 10 per cent of the report. It would be more detailed than an introduction, but still at a high level. 
- Your graphs must be of an extremely high standard.
- Check that you have referenced everything. Strong submissions will draw on related literature in the discussion and would be sure to also reference those. The style of references does not matter, provided it is consistent.
- Via Quercus, submit a link to your PDF report which is hosted on GitHub. At some point in the introduction to your report, you must provide a link to the GitHub repo where the code that you used for this assignment lives (Hint: Comment. Your. Code.). Your entire workflow must be entirely reproducible.
- Please be sure to include a link to your survey in your report and screenshots of the survey in the appendix of your report. 
- There should be no evidence that this is a class assignment.

### Checks

- Check you have not included any R code or raw R output in the final PDF.
- Check you have cited R and any R packages used.
- Check that although you will probably have most of your code in the R Markdown, make sure that you have at least one R script in the `scripts` folder.
- Check there is thoroughly commented code that directly creates your PDF. Do not knit to html and then save as a PDF. Do not knit to Word and then save as a PDF
- Check that your graph and discussion are extremely clear, and of comparable quality to those of FiveThirtyEight.
- Check that the date is updated to the date of submission.
- Check your entire workflow is entirely reproducible.
- Check for typos.
- Check that you have got an appendix that details the survey/s and a link to the live survey.


### FAQ

- Can I work by myself? Yes. But the workload assumes you will work as part of a group.
- Can we switch groups for the third paper? Yes.
- How can I find a group? I will randomly create groups of three  in Quercus. You are welcome to shift out of those groups and form your own groups if you'd like.
- Can I get a different mark to the rest of my group? No. Everyone in the group gets the same mark.
- I wrote my paper by myself, so can I be graded on a different scale? No. All papers are graded in the same way.
- How much should I write? Most students submit something in the 10-to-15-page range, but it is up to you. Be precise and thorough.
- How do students collaborate successfully? Groups that split up the work typically seem to do the best. So one student worries about the survey, one about simulating and analyzing data, and another about the write-up. If you're worried about using GitHub to collaborate, then just create different folders in GitHub to place your separate bits of work, and then have one person bring it together at the end.
- What intervention should we use? The intention is that you do something of interest to you. A well-written introduction would make the intervention clear.


### Rubric



```{=html}
<div id="povldjxrvs" style="overflow-x:auto;overflow-y:auto;width:auto;height:auto;">
<style>html {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
}

#povldjxrvs .gt_table {
  display: table;
  border-collapse: collapse;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
  font-weight: normal;
  font-style: normal;
  background-color: #FFFFFF;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}

#povldjxrvs .gt_heading {
  background-color: #FFFFFF;
  text-align: center;
  border-bottom-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#povldjxrvs .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}

#povldjxrvs .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 0;
  padding-bottom: 6px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}

#povldjxrvs .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#povldjxrvs .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#povldjxrvs .gt_col_heading {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}

#povldjxrvs .gt_column_spanner_outer {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}

#povldjxrvs .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#povldjxrvs .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#povldjxrvs .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 5px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}

#povldjxrvs .gt_group_heading {
  padding: 8px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
}

#povldjxrvs .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}

#povldjxrvs .gt_from_md > :first-child {
  margin-top: 0;
}

#povldjxrvs .gt_from_md > :last-child {
  margin-bottom: 0;
}

#povldjxrvs .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}

#povldjxrvs .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 12px;
}

#povldjxrvs .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#povldjxrvs .gt_first_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
}

#povldjxrvs .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#povldjxrvs .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#povldjxrvs .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#povldjxrvs .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#povldjxrvs .gt_footnotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#povldjxrvs .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding: 4px;
}

#povldjxrvs .gt_sourcenotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#povldjxrvs .gt_sourcenote {
  font-size: 90%;
  padding: 4px;
}

#povldjxrvs .gt_left {
  text-align: left;
}

#povldjxrvs .gt_center {
  text-align: center;
}

#povldjxrvs .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#povldjxrvs .gt_font_normal {
  font-weight: normal;
}

#povldjxrvs .gt_font_bold {
  font-weight: bold;
}

#povldjxrvs .gt_font_italic {
  font-style: italic;
}

#povldjxrvs .gt_super {
  font-size: 65%;
}

#povldjxrvs .gt_footnote_marks {
  font-style: italic;
  font-weight: normal;
  font-size: 65%;
}
</style>
<table class="gt_table">
  
  <thead class="gt_col_headings">
    <tr>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1">Component</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1">Range</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1">Requirement</th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr><td class="gt_row gt_left">R is appropriately cited</td>
<td class="gt_row gt_left">0 - 'No'; 1 - 'Yes'</td>
<td class="gt_row gt_left">Both referred to in the main content and included in the reference list. If not, no need to continue marking, just give paper 0 overall.</td></tr>
    <tr><td class="gt_row gt_left">Title</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 1 - 'Yes'; 2 - 'Exceptional'</td>
<td class="gt_row gt_left">An informative title is included. Tell the reader what your story is don't waste their time. Ideally tell them what happens at the end of the story. 'Problem Set X' is not an informative title. There should be no evidence this is a school paper.</td></tr>
    <tr><td class="gt_row gt_left">Author, date, and repo</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 2 - 'Yes'</td>
<td class="gt_row gt_left">The author, date of submission, and a link to a GitHub repo are clearly included. (The later likely, but not necessarily, through a statement such as: 'Code and data supporting this analysis is available at: LINK').</td></tr>
    <tr><td class="gt_row gt_left">Abstract</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 1 - 'Gets job done'; 2 - 'Fine'; 3 - 'Great'; 4 - 'Exceptional'</td>
<td class="gt_row gt_left">An abstract is included and appropriately pitched to a general audience. The abstract answers: 1) what was done, 2) what was found, and 3) why this matters (all at a high level). If your abstract is longer than four sentences then you need to think a lot about whether it is too long. It may be fine (there are always exceptions) but you should probably have a good reason. Your abstract must tell the reader your top-level finding. What is the one thing that we learn about the world because of your paper?</td></tr>
    <tr><td class="gt_row gt_left">Introduction</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 1 - 'Gets job done'; 2 - 'Fine'; 3 - 'Great'; 4 - 'Exceptional'</td>
<td class="gt_row gt_left">The introduction is self-contained and tells a reader everything they need to know, including putting it into a broader context. Your introduction should provide a bit of broader context to motivate the reader, as well as providing a bit more detail about what you're interested in, what you did, what you found, why it's important, etc. A reader should be able to read only your introduction and have a good idea about the research that you carried out. It would be rare that you would have tables or figures in your introduction (again there are always exceptions but think deeply about whether yours is one). It must outline the structure of the paper. For instance (and this is just a rough guide) an introduction for a 10 page paper, should probably be about 3 or 4 paragraphs, or 10 per cent, but it depends on specifics.</td></tr>
    <tr><td class="gt_row gt_left">Data</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 2 - 'Many issues'; 4 - 'Some issues'; 6 - 'Good'; 8 - 'Great'; 10 - 'Exceptional'</td>
<td class="gt_row gt_left">You should thoroughly discuss the variables in the dataset that you use. Are there any that are very similar that you nonetheless don't use? Did you construct any variables by combining various ones? What do the data look like? Plot the actual data that you're using (or as close as you can get to it). Discuss these plots and the other features of these data. These are just some of the issues strong submissions will consider. Show off your knowledge. If this becomes too detailed, then you should push some of this to footnotes or an appendix. 'Exceptional' means that when I read your submission I learn something about the dataset that I don't learn from any other submission (within a reasonable measure of course).</td></tr>
    <tr><td class="gt_row gt_left">Results</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 2 - 'Many issues'; 4 - 'Some issues'; 6 - 'Good'; 8 - 'Great'; 10 - 'Exceptional'</td>
<td class="gt_row gt_left">Results will likely require summary statistics, tables, graphs, images, and possibly statistical analysis or maps. To be clear, you should also have text associated with all these aspects. Show the reader the results by plotting them. Talk about them. Explain them. That said, this section should strictly relay results.</td></tr>
    <tr><td class="gt_row gt_left">Discussion</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 2 - 'Many issues'; 4 - 'Some issues'; 6 - 'Good'; 8 - 'Great'; 10 - 'Exceptional'</td>
<td class="gt_row gt_left">Some questions that a good discussion would cover include (each of these would be a sub-section of something like half a page to a page): What is done in this this paper? What is something that we learn about the world? What is another thing that we learn about the world? What are some weaknesses of what was done? What is left to learn or how should we proceed in the future?</td></tr>
    <tr><td class="gt_row gt_left">Cross-references</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 2 - 'Yes'</td>
<td class="gt_row gt_left">All figures, tables, equations, etc are numbered, cross-referenced, and referred to in the text.</td></tr>
    <tr><td class="gt_row gt_left">Proofreading</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 2 - 'Yes'</td>
<td class="gt_row gt_left">All aspects of submission are free of noticeable typos.</td></tr>
    <tr><td class="gt_row gt_left">Graphs/tables/etc</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 1 - 'Gets job done'; 2 - 'Fine'; 3 - 'Great'; 4 - 'Exceptional'</td>
<td class="gt_row gt_left">You must include graphs and tables in your paper and they must be to a high standard. They must be well formatted and camera-ready They should be clear and digestible. They must: 1) serve a clear purpose; 2) be fully self-contained through appropriate use of labels/explanations, etc; and 3) appropriately sized and coloured (or appropriate significant figures in the case of stats).</td></tr>
    <tr><td class="gt_row gt_left">References</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 3 - 'One minor issue'; 4 - 'Perfect'</td>
<td class="gt_row gt_left">All data/software/literature/etc are appropriately noted and cited. You must cite the software and software packages that you use. You must cite the datasets that you use. You must cite literature that you refer to (and you should refer to literature). If you take a small chunk of code from Stack Overflow then add the page in a comment next to the code. If you take a large chunk of code then cite it fully. 3 means one minor issue. More than one minor issue receives 0.</td></tr>
    <tr><td class="gt_row gt_left">Reproducibility</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 1 - 'Gets job done'; 2 - 'Fine'; 3 - 'Great'; 4 - 'Exceptional'</td>
<td class="gt_row gt_left">The paper and analysis must be fully reproducible. A detailed README is included. All code should be thoroughly documented. An R project is used. Do not use `setwd()`. The code must appropriately read data, prepare it, create plots, conduct analysis, generate documents, etc. Seeds are used where needed. Code must have a preamble etc. You must appropriately document your scripts such that someone coming in could follow them. Your repo must be thoroughly organized and not contain extraneous files.</td></tr>
    <tr><td class="gt_row gt_left">General excellence</td>
<td class="gt_row gt_left">0 - 'None'; 1 - 'Huh, that's interesting'; 2 - 'Wow'; 3 - 'Exceptional'</td>
<td class="gt_row gt_left">There are always students that excel in a way that is not anticipated in the rubric. This item accounts for that.</td></tr>
  </tbody>
  
  
</table>
</div>
```

### Previous examples

Some examples of papers that well in the past include those by: 


\newpage










## Paper Four

### Task

- Working in teams of one to three  people, and in an entirely reproducible way, please use the Canadian General Social Survey (GSS) and a regression model to tell a story. 


### Recommended steps

- You must include a DAG (probably in the model section).
- Depending on your focus and background, you may like to use a Bayesian hierarchical model, but regardless of the particular model that you use it must be well explained, thoroughly justified, appropriate to the task at hand, and the results must be beautifully described.
- You may focus on any year, aspect, or geography that is reasonable given the focus and constraints of the GSS. As a reminder, the GSS 'program was designed as a series of independent, annual, cross-sectional surveys, each covering one topic in-depth.' So please consider the topic and the year.
- The GSS is available to University of Toronto students via the library. In order to use it you need to clean and prepare it. Code to do this for one year is being distributed alongside this problem set and was discussed in lectures. 
- You are welcome to simply use this code and this year, but the topic of that year will constrain your focus. Naturally, you are welcome to adapt the code to other years. If you use the code exactly as is then you must cite it. If you adapt the code then you don't have to cite it, as it has a MIT license, but it would be appropriate to at least mention and acknowledge it, depending on how close your adaption is.
- Using R Markdown, please write a paper about your analysis and compile it into a PDF.
- Your paper must be well-written, draw on relevant literature, and show your statistical skills by explaining all statistical concepts that you draw on. 
- Your paper must have the following sections: title, name/s, and date, abstract, introduction, data, model, results, discussion, and references. 
- You are welcome to use appendices for supporting, but not critical, material. Your discussion must include sub-sections on weaknesses and next steps.
- In your report you must provide a link to a GitHub repo that fully contains your analysis. Your code must be entirely reproducible, documented, and readable. Your repo must be well-organized and appropriately use folders.
- Graphs and tables must be of a high standard. Graphs and tables should be well formatted and report-ready. They should be clean and digestible. Furthermore, you should label and describe each table/figure.
- When you discuss the dataset (in the data section) you should make sure to discuss (at least): 
    - Its key features, strengths, and weaknesses generally. 
    - A discussion of the questionnaire - what is good and bad about it? 
    - A discussion of the methodology including how they find people to take the survey; what their population, frame, and sample were; what sampling approach they took and what some of the trade-offs may be; what they do about non-response; the cost. 
    - This is just some of the issues strong submissions will consider. Show off your knowledge. If this becomes too detailed then you should push some of this to footnotes or an appendix. 
- When you discuss your model (in the model section), you must be extremely careful to spell out the statistical model that you are using, defining and explaining each aspect and why it is important. (For a Bayesian model, a discussion of priors and regularization is almost always important.) You should mention the software that you used to run the model. You should be clear about model convergence, model checks, and diagnostic issues. How do the sampling and survey aspects that you discussed assert themselves in the modelling decisions that you make? Again, if it becomes too detailed then push some of the details to footnotes or an appendix.
- You should present model results, graphs, figures, etc, in the results section. This section should strictly relay results. Interpretation of these results and conclusions drawn from the results should be left for the discussion section.
- Your discussion should focus on your model results. Interpret them and explain what they mean. Put them in context. What do we learn about the world having understood your model and its results? What caveats could apply? To what extent does your model represent the small world and the large world (to use the language of McElreath, Ch 2)? What are some weaknesses and opportunities for future work?
- Check that you have referenced everything. Strong submissions will draw on related literature in the discussion (and other sections) and would be sure to also reference those. The style of references does not matter, provided it is consistent.
- As a team, via Quercus, submit a PDF of your paper. Again, in your paper you must have a link to the associated GitHub repo in an appendix. And you must include the R Markdown file that produced the PDF in that repo.
- A good way to work as a team would be to split up the work, so that one person is doing each section. The people doing the sections that rely on data (such as the analysis and the graphs) could just simulate it while they are waiting for the person putting together the data to finish.
- It is expected that your submission be well written and able to be understood by the average reader of say 538. This means that you are allowed to use mathematical notation, but you must be able to explain it all in plain English. Similarly, you can (and hint: you should) use survey, sampling, observational, and statistical terminology, but again you need to explain it. Your work should have flow and should be easy to follow and understand. To communicate well, anyone at the university level should be able to read your report once and relay back the methodology, overall results, findings, weaknesses and next steps without confusion. 

### Checks

- It is recommended that you (informally) proofread one another's sections - why not exchange papers with another group? 
- Everyone in the team receives the same mark.
- There should be no evidence that this is a class assignment.

### FAQ

### Rubric


```{=html}
<div id="sfartyxzws" style="overflow-x:auto;overflow-y:auto;width:auto;height:auto;">
<style>html {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
}

#sfartyxzws .gt_table {
  display: table;
  border-collapse: collapse;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
  font-weight: normal;
  font-style: normal;
  background-color: #FFFFFF;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}

#sfartyxzws .gt_heading {
  background-color: #FFFFFF;
  text-align: center;
  border-bottom-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#sfartyxzws .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}

#sfartyxzws .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 0;
  padding-bottom: 6px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}

#sfartyxzws .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#sfartyxzws .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#sfartyxzws .gt_col_heading {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}

#sfartyxzws .gt_column_spanner_outer {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}

#sfartyxzws .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#sfartyxzws .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#sfartyxzws .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 5px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}

#sfartyxzws .gt_group_heading {
  padding: 8px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
}

#sfartyxzws .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}

#sfartyxzws .gt_from_md > :first-child {
  margin-top: 0;
}

#sfartyxzws .gt_from_md > :last-child {
  margin-bottom: 0;
}

#sfartyxzws .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}

#sfartyxzws .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 12px;
}

#sfartyxzws .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#sfartyxzws .gt_first_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
}

#sfartyxzws .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#sfartyxzws .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#sfartyxzws .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#sfartyxzws .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#sfartyxzws .gt_footnotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#sfartyxzws .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding: 4px;
}

#sfartyxzws .gt_sourcenotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#sfartyxzws .gt_sourcenote {
  font-size: 90%;
  padding: 4px;
}

#sfartyxzws .gt_left {
  text-align: left;
}

#sfartyxzws .gt_center {
  text-align: center;
}

#sfartyxzws .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#sfartyxzws .gt_font_normal {
  font-weight: normal;
}

#sfartyxzws .gt_font_bold {
  font-weight: bold;
}

#sfartyxzws .gt_font_italic {
  font-style: italic;
}

#sfartyxzws .gt_super {
  font-size: 65%;
}

#sfartyxzws .gt_footnote_marks {
  font-style: italic;
  font-weight: normal;
  font-size: 65%;
}
</style>
<table class="gt_table">
  
  <thead class="gt_col_headings">
    <tr>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1">Component</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1">Range</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1">Requirement</th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr><td class="gt_row gt_left">R is appropriately cited</td>
<td class="gt_row gt_left">0 - 'No'; 1 - 'Yes'</td>
<td class="gt_row gt_left">Both referred to in the main content and included in the reference list. If not, no need to continue marking, just give paper 0 overall.</td></tr>
    <tr><td class="gt_row gt_left">Title</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 1 - 'Yes'; 2 - 'Exceptional'</td>
<td class="gt_row gt_left">An informative title is included. Tell the reader what your story is don't waste their time. Ideally tell them what happens at the end of the story. 'Problem Set X' is not an informative title. There should be no evidence this is a school paper.</td></tr>
    <tr><td class="gt_row gt_left">Author, date, and repo</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 2 - 'Yes'</td>
<td class="gt_row gt_left">The author, date of submission, and a link to a GitHub repo are clearly included. (The later likely, but not necessarily, through a statement such as: 'Code and data supporting this analysis is available at: LINK').</td></tr>
    <tr><td class="gt_row gt_left">Abstract</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 1 - 'Gets job done'; 2 - 'Fine'; 3 - 'Great'; 4 - 'Exceptional'</td>
<td class="gt_row gt_left">An abstract is included and appropriately pitched to a general audience. The abstract answers: 1) what was done, 2) what was found, and 3) why this matters (all at a high level). If your abstract is longer than four sentences then you need to think a lot about whether it is too long. It may be fine (there are always exceptions) but you should probably have a good reason. Your abstract must tell the reader your top-level finding. What is the one thing that we learn about the world because of your paper?</td></tr>
    <tr><td class="gt_row gt_left">Introduction</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 1 - 'Gets job done'; 2 - 'Fine'; 3 - 'Great'; 4 - 'Exceptional'</td>
<td class="gt_row gt_left">The introduction is self-contained and tells a reader everything they need to know, including putting it into a broader context. Your introduction should provide a bit of broader context to motivate the reader, as well as providing a bit more detail about what you're interested in, what you did, what you found, why it's important, etc. A reader should be able to read only your introduction and have a good idea about the research that you carried out. It would be rare that you would have tables or figures in your introduction (again there are always exceptions but think deeply about whether yours is one). It must outline the structure of the paper. For instance (and this is just a rough guide) an introduction for a 10 page paper, should probably be about 3 or 4 paragraphs, or 10 per cent, but it depends on specifics.</td></tr>
    <tr><td class="gt_row gt_left">Data</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 2 - 'Many issues'; 4 - 'Some issues'; 6 - 'Good'; 8 - 'Great'; 10 - 'Exceptional'</td>
<td class="gt_row gt_left">You should thoroughly discuss the variables in the dataset that you use. Are there any that are very similar that you nonetheless don't use? Did you construct any variables by combining various ones? What do the data look like? Plot the actual data that you're using (or as close as you can get to it). Discuss these plots and the other features of these data. These are just some of the issues strong submissions will consider. Show off your knowledge. If this becomes too detailed, then you should push some of this to footnotes or an appendix. 'Exceptional' means that when I read your submission I learn something about the dataset that I don't learn from any other submission (within a reasonable measure of course).</td></tr>
    <tr><td class="gt_row gt_left">Model</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 2 - 'Many issues'; 4 - 'Some issues'; 6 - 'Good'; 8 - 'Great'; 10 - 'Exceptional'</td>
<td class="gt_row gt_left">The model is nicely written out, well-explained, justified, and appropriate. When you discuss your model you must be extremely careful to spell out the statistical model that you are using defining and explaining each aspect and why it is important. Failure to do this suggests you don't understand the model. The model is appropriately complex that is, not too simple, but not unnecessarily complicated. The model has well-defined variables and these correspond to what is discussed in the data section. The model needs to be written out in appropriate mathematical notation but also in plain English. Every aspect of that notation must be defined otherwise the most this section can receive is poor. The model makes sense based on the substantive area, and also the form of the model. If the model is Bayesian, then priors need to be defined and sensible. Discussion needs to occur around how features enter the model and why. For instance, (and these are just examples) why use ages rather than age-groups, why does province have a levels effect, why is gender categorical, etc? In general, in order to be adequate, there needs to be a clear justification that this is the model for the situation. The assumptions underpinning the model are clearly discussed. Alternative models, or variants, must be discussed and strengths and weaknesses made clear. Why was this model chosen? You should mention the software that you used to run the model. There is some evidence of thought about the circumstances in which the model may not be appropriate. There is evidence of model validation and checking, whether that is out of sample or comparison to a straw man or RMSE, test/training, or appropriate sensitivity checks. You should be clear about model convergence, model checks, and diagnostic issues, but if this becomes too detailed then you could push some of this to an appendix. Great answers would discuss things such as, how do the aspects that you discussed in the data section assert themselves in the modelling decisions that you make. Again if it becomes too detailed then push some of the details to footnotes or an appendix. Again, explain what your model is and what is going on with it.</td></tr>
    <tr><td class="gt_row gt_left">Results</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 2 - 'Many issues'; 4 - 'Some issues'; 6 - 'Good'; 8 - 'Great'; 10 - 'Exceptional'</td>
<td class="gt_row gt_left">Results will likely require summary statistics, tables, graphs, images, and possibly statistical analysis or maps. To be clear, you should also have text associated with all these aspects. Show the reader the results by plotting them. Talk about them. Explain them. That said, this section should strictly relay results.</td></tr>
    <tr><td class="gt_row gt_left">Discussion</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 2 - 'Many issues'; 4 - 'Some issues'; 6 - 'Good'; 8 - 'Great'; 10 - 'Exceptional'</td>
<td class="gt_row gt_left">Some questions that a good discussion would cover include (each of these would be a sub-section of something like half a page to a page): What is done in this this paper? What is something that we learn about the world? What is another thing that we learn about the world? What are some weaknesses of what was done? What is left to learn or how should we proceed in the future?</td></tr>
    <tr><td class="gt_row gt_left">Cross-references</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 2 - 'Yes'</td>
<td class="gt_row gt_left">All figures, tables, equations, etc are numbered, cross-referenced, and referred to in the text.</td></tr>
    <tr><td class="gt_row gt_left">Proofreading</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 2 - 'Yes'</td>
<td class="gt_row gt_left">All aspects of submission are free of noticeable typos.</td></tr>
    <tr><td class="gt_row gt_left">Graphs/tables/etc</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 1 - 'Gets job done'; 2 - 'Fine'; 3 - 'Great'; 4 - 'Exceptional'</td>
<td class="gt_row gt_left">You must include graphs and tables in your paper and they must be to a high standard. They must be well formatted and camera-ready They should be clear and digestible. They must: 1) serve a clear purpose; 2) be fully self-contained through appropriate use of labels/explanations, etc; and 3) appropriately sized and coloured (or appropriate significant figures in the case of stats).</td></tr>
    <tr><td class="gt_row gt_left">References</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 3 - 'One minor issue'; 4 - 'Perfect'</td>
<td class="gt_row gt_left">All data/software/literature/etc are appropriately noted and cited. You must cite the software and software packages that you use. You must cite the datasets that you use. You must cite literature that you refer to (and you should refer to literature). If you take a small chunk of code from Stack Overflow then add the page in a comment next to the code. If you take a large chunk of code then cite it fully. 3 means one minor issue. More than one minor issue receives 0.</td></tr>
    <tr><td class="gt_row gt_left">Reproducibility</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 1 - 'Gets job done'; 2 - 'Fine'; 3 - 'Great'; 4 - 'Exceptional'</td>
<td class="gt_row gt_left">The paper and analysis must be fully reproducible. A detailed README is included. All code should be thoroughly documented. An R project is used. Do not use `setwd()`. The code must appropriately read data, prepare it, create plots, conduct analysis, generate documents, etc. Seeds are used where needed. Code must have a preamble etc. You must appropriately document your scripts such that someone coming in could follow them. Your repo must be thoroughly organized and not contain extraneous files.</td></tr>
    <tr><td class="gt_row gt_left">General excellence</td>
<td class="gt_row gt_left">0 - 'None'; 1 - 'Huh, that's interesting'; 2 - 'Wow'; 3 - 'Exceptional'</td>
<td class="gt_row gt_left">There are always students that excel in a way that is not anticipated in the rubric. This item accounts for that.</td></tr>
  </tbody>
  
  
</table>
</div>
```

### Previous examples


\newpage




## Paper Five

### Task

- The primary goal of this paper is to predict the overall popular vote of the 2020 American presidential election using multilevel regression with post-stratification.

### Recommended steps

- We expect you to work as part of a group of three people. We have suggested a split of the work based on a 3-person group, but these are just suggestions.
- Individual-level survey data:
    - Request access to the Democracy Fund + UCLA Nationscape 'Full Data Set': https://www.voterstudygroup.org/publication/nationscape-data-set. This could take a day or two. Please start early. 
    - Given the expense of collecting this data, and the privilege of having access to it, if you don't properly cite this dataset then you will get zero for this problem set.
    - Once you have access then pick a survey of interest. We will use "ns20200102.dta" in the example (your number may be different).
    - This will be a large file and is not yours to share. Do not push it to GitHub (use the .gitignore file - see here: https://carpentries-incubator.github.io/git-Rstudio-course/02-ignore/index.html).
    - Use the example R code to get started preparing this dataset, and then go on cleaning and preparing it based on what you need.
    - Make graphs and tables about the survey data and write beautiful sentences and paragraphs explaining everything.
- Post-stratification data:
    - We will use the American Community Surveys (ACS).
    - Please create an account with IPUMS: https://usa.ipums.org/usa/index.shtml 
    - You want the 2018 1-year ACS. Then you need to select some variables. This will depend on what you want to model and the survey data, but some options include: REGION, STATEICP, AGE, SEX, MARST, RACE, HISPAN, BPL, CITIZEN, EDUC, LABFORCE, 	INCTOT. Have a look around and see what you are interested in, remembering that you will need to establish a correspondence to the survey.
    - Download the relevant post-stratification data (it is probably easiest to change the data format to .dta). Again, this can take some time. Please start this early. 
    - This will be a large file and is not yours to share. Do not push it to GitHub (use the .gitignore file - see here: https://carpentries-incubator.github.io/git-Rstudio-course/02-ignore/index.html).
    - Given the expense of collecting this data, and the privilege of having access to it, if you don't properly cite this dataset then you will get zero for this problem set.
    - Clean and prepare the post-stratification dataset.
    - Remember that you need cell counts for the sub-populations in your model. See examples in the readings.
- (It may be efficient to start with simulated data while waiting for the real data) Modelling.
    - You will want to explain vote intention based on a variety of explanatory variables. Construct the vote intention variable so that it is binary (either 'supports Trump' or 'supports Biden'). 
    - You are welcome to use lm() but you would need to explain the nuances of this decision in the model section (Hint: start here: https://statmodeling.stat.columbia.edu/2020/01/10/linear-or-logistic-regression-with-binary-outcomes/). 
    - That said, you should probably use logistic regression if it is at all possible for you. If you don't know where to start then look at (in increasing levels of complexity) glm(), lme4::glmer(), or brms::brm(). There are examples of each in the readings. 
    - Think very deeply about model fit, diagnostics, and other similar things that you need in order to convince someone that your model is appropriate.
    - You have flexibility of the model that you use, (and hence the cells that you will need to create next). In general, the more cells the better, but you may want fewer cells for simplicity in the writing process and to ensure a decent sample in each cell.
    - Apply your trained model to the post-stratification dataset to make the best estimate of the election result that you can. The specifics will depend on your modelling approach but will likely involve predict(), add_predicted_draws(), or similar. See the examples in the readings. We are primarily interested in the distribution of your forecast of the overall Presidential popular vote, and how the explanatory variables affect this. But great submissions would go beyond that. Also, you're taking a statistics course, so if you just gave a central estimate and nothing else, then that would not be great.
    - Create beautiful graphs and tables of your model and results.
    - Create wonderful paragraphs talking about and explaining everything.
- (Again, it is probably efficient to start with simulated data/results while waiting) 
    - Write up.
    - Using R Markdown, please write a very thorough paper about your analysis and compile it into a PDF. 
    - The paper must be well-written, draw on relevant literature, and show your statistical skills by explaining all statistical concepts that you draw on. 
    - The paper must have the following sections: title, name/s, and date, abstract and keywords, introduction, data, model, results, discussion, and references. 
    - The paper may use appendices for supporting, but not critical, material. 
    - The discussion needs to be substantial. For instance, if the paper were 10 pages long then a discussion should be at least 2.5 pages. In the discussion, the paper must include subsections on weaknesses and next steps - but these must be in proportion.
    - The report must provide a link to a GitHub repo that contains everything (apart from the raw data that you git ignored because it is not yours to share). The code must be entirely reproducible, documented, and readable. The repo must be well-organized and appropriately use folders and README files.
    - The graphs and tables must be of a high standard, well formatted, and report-ready. They should be clean and digestible. Furthermore, you should label and describe each table/figure.
    - When you discuss the datasets (in the data section) (remember there will be at least two datasets to discuss) you should make sure to discuss (at least): 
        - Their key features, strengths, and weaknesses generally. 
        - The survey questionnaire - what is good and bad about it? 
        - A discussion of the methodology including how they find people to take the survey; what their population, frame, and sample were; what sampling approach they took and what some of the trade-offs may be; what they do about non-response; the cost. 
        - This is just some of the issues strong submissions will consider. Show off your knowledge. If this becomes too detailed then you should push some of this to footnotes or an appendix. 
    - The dataset section is probably an appropriate place to include an explanation of what post-stratification is (in non-statistical language) and the strengths and weaknesses of it, although this discussion may fit more naturally in another section. Regardless, be sure to justify the inclusion of each explanatory variable.
    - When you discuss your model (in the model section), you must be extremely careful to spell out the statistical model that you are using, defining and explaining each aspect and why it is important. (For a Bayesian model, a discussion of priors and regularization is almost always important.) You should mention the software that you used to run the model. You should be clear about model convergence, model checks, and diagnostic issues, although you may push the details of this to an appendix depending on how detailed you get. How do the sampling and survey aspects that you discussed assert themselves in the modelling decisions that you make? How can you convince a reader that you have neither overfit nor underfit the data? Again, if it becomes too detailed then push some of the details to footnotes or an appendix.
    - You should present model results, graphs, figures, etc, in the results section. This section should strictly relay results. It must include text explaining all of these and summary statistics and similar. However, interpretation of these results and conclusions drawn from the results should be left for the discussion section.
    - Your discussion should focus on your model results, but this time interpreting them, and explaining what they mean. Put them in context. What do we learn about the world having understood your model and its results? What caveats could apply? To what extent does your model represent the small world and the large world (to use the language of McElreath, Ch 2)? What are some weaknesses and opportunities for future work? Who is going to win the election? How confident are you in that forecast? Do you have a small or large distribution? What could that mean? Are you more confident in certain states? Do certain explanatory variables carry more weight than others? Etc.
    - Check that you have referenced everything. Strong submissions will draw on related literature in the discussion (and other sections) and would be sure to also reference those. The style of references does not matter, but it must be consistent.
    - If you don't cite R then you will get zero for this problem set.
    - As a team, via Quercus, submit a PDF of your paper. Again, in your paper you must have a link to the associated GitHub repo. And you must include the R Markdown file that produced the PDF in that repo. 
    The RMarkdown file must exactly produce the PDF. Don't edit it manually ex post - that isn't reproducible.
- A good way to work as a team would be to split up the work, so that one person is doing each section. The people doing the sections that rely on data (such as the analysis and the graphs) could just simulate it while they are waiting for the person putting together the data to finish. We have recommended a split above, but you do what works for you.


### Checks

- It is expected that your submission be well written and able to be understood by the average reader of say 538. This means that you are allowed to use mathematical notation, but you must be able to explain it all in plain English. Similarly, you can (and hint: you should) use survey, sampling, observational, and statistical terminology, but again you need to explain it. The average person doesn't know what a p-value is nor what a confidence interval is. You need to explain all of this in plain language the first time you use it. Your work should have flow and should be easy to follow and understand. To communicate well, anyone at the university level should be able to read your report once and relay back the methodology, overall results, findings, weaknesses and next steps without confusion. 
- It is recommended that you (informally) proofread one another's work - why not exchange papers with another group? 
- Everyone in the team receives the same mark.
- There should be no evidence that this is a class assignment.

### FAQ



### Rubric


```{=html}
<div id="mswcpygcbq" style="overflow-x:auto;overflow-y:auto;width:auto;height:auto;">
<style>html {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
}

#mswcpygcbq .gt_table {
  display: table;
  border-collapse: collapse;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
  font-weight: normal;
  font-style: normal;
  background-color: #FFFFFF;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}

#mswcpygcbq .gt_heading {
  background-color: #FFFFFF;
  text-align: center;
  border-bottom-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#mswcpygcbq .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}

#mswcpygcbq .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 0;
  padding-bottom: 6px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}

#mswcpygcbq .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#mswcpygcbq .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#mswcpygcbq .gt_col_heading {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}

#mswcpygcbq .gt_column_spanner_outer {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}

#mswcpygcbq .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#mswcpygcbq .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#mswcpygcbq .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 5px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}

#mswcpygcbq .gt_group_heading {
  padding: 8px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
}

#mswcpygcbq .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}

#mswcpygcbq .gt_from_md > :first-child {
  margin-top: 0;
}

#mswcpygcbq .gt_from_md > :last-child {
  margin-bottom: 0;
}

#mswcpygcbq .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}

#mswcpygcbq .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 12px;
}

#mswcpygcbq .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#mswcpygcbq .gt_first_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
}

#mswcpygcbq .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#mswcpygcbq .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#mswcpygcbq .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#mswcpygcbq .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#mswcpygcbq .gt_footnotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#mswcpygcbq .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding: 4px;
}

#mswcpygcbq .gt_sourcenotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#mswcpygcbq .gt_sourcenote {
  font-size: 90%;
  padding: 4px;
}

#mswcpygcbq .gt_left {
  text-align: left;
}

#mswcpygcbq .gt_center {
  text-align: center;
}

#mswcpygcbq .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#mswcpygcbq .gt_font_normal {
  font-weight: normal;
}

#mswcpygcbq .gt_font_bold {
  font-weight: bold;
}

#mswcpygcbq .gt_font_italic {
  font-style: italic;
}

#mswcpygcbq .gt_super {
  font-size: 65%;
}

#mswcpygcbq .gt_footnote_marks {
  font-style: italic;
  font-weight: normal;
  font-size: 65%;
}
</style>
<table class="gt_table">
  
  <thead class="gt_col_headings">
    <tr>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1">Component</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1">Range</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1">Requirement</th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr><td class="gt_row gt_left">R is appropriately cited</td>
<td class="gt_row gt_left">0 - 'No'; 1 - 'Yes'</td>
<td class="gt_row gt_left">Both referred to in the main content and included in the reference list. If not, no need to continue marking, just give paper 0 overall.</td></tr>
    <tr><td class="gt_row gt_left">Title</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 1 - 'Yes'; 2 - 'Exceptional'</td>
<td class="gt_row gt_left">An informative title is included. Tell the reader what your story is don't waste their time. Ideally tell them what happens at the end of the story. 'Problem Set X' is not an informative title. There should be no evidence this is a school paper.</td></tr>
    <tr><td class="gt_row gt_left">Author, date, and repo</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 2 - 'Yes'</td>
<td class="gt_row gt_left">The author, date of submission, and a link to a GitHub repo are clearly included. (The later likely, but not necessarily, through a statement such as: 'Code and data supporting this analysis is available at: LINK').</td></tr>
    <tr><td class="gt_row gt_left">Abstract</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 1 - 'Gets job done'; 2 - 'Fine'; 3 - 'Great'; 4 - 'Exceptional'</td>
<td class="gt_row gt_left">An abstract is included and appropriately pitched to a general audience. The abstract answers: 1) what was done, 2) what was found, and 3) why this matters (all at a high level). If your abstract is longer than four sentences then you need to think a lot about whether it is too long. It may be fine (there are always exceptions) but you should probably have a good reason. Your abstract must tell the reader your top-level finding. What is the one thing that we learn about the world because of your paper?</td></tr>
    <tr><td class="gt_row gt_left">Introduction</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 1 - 'Gets job done'; 2 - 'Fine'; 3 - 'Great'; 4 - 'Exceptional'</td>
<td class="gt_row gt_left">The introduction is self-contained and tells a reader everything they need to know, including putting it into a broader context. Your introduction should provide a bit of broader context to motivate the reader, as well as providing a bit more detail about what you're interested in, what you did, what you found, why it's important, etc. A reader should be able to read only your introduction and have a good idea about the research that you carried out. It would be rare that you would have tables or figures in your introduction (again there are always exceptions but think deeply about whether yours is one). It must outline the structure of the paper. For instance (and this is just a rough guide) an introduction for a 10 page paper, should probably be about 3 or 4 paragraphs, or 10 per cent, but it depends on specifics.</td></tr>
    <tr><td class="gt_row gt_left">Data</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 2 - 'Many issues'; 4 - 'Some issues'; 6 - 'Good'; 8 - 'Great'; 10 - 'Exceptional'</td>
<td class="gt_row gt_left">You should thoroughly discuss the variables in the dataset that you use. Are there any that are very similar that you nonetheless don't use? Did you construct any variables by combining various ones? What do the data look like? Plot the actual data that you're using (or as close as you can get to it). Discuss these plots and the other features of these data. These are just some of the issues strong submissions will consider. Show off your knowledge. If this becomes too detailed, then you should push some of this to footnotes or an appendix. 'Exceptional' means that when I read your submission I learn something about the dataset that I don't learn from any other submission (within a reasonable measure of course).</td></tr>
    <tr><td class="gt_row gt_left">Model</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 2 - 'Many issues'; 4 - 'Some issues'; 6 - 'Good'; 8 - 'Great'; 10 - 'Exceptional'</td>
<td class="gt_row gt_left">The model is nicely written out, well-explained, justified, and appropriate. When you discuss your model you must be extremely careful to spell out the statistical model that you are using defining and explaining each aspect and why it is important. Failure to do this suggests you don't understand the model. The model is appropriately complex that is, not too simple, but not unnecessarily complicated. The model has well-defined variables and these correspond to what is discussed in the data section. The model needs to be written out in appropriate mathematical notation but also in plain English. Every aspect of that notation must be defined otherwise the most this section can receive is poor. The model makes sense based on the substantive area, and also the form of the model. If the model is Bayesian, then priors need to be defined and sensible. Discussion needs to occur around how features enter the model and why. For instance, (and these are just examples) why use ages rather than age-groups, why does province have a levels effect, why is gender categorical, etc? In general, in order to be adequate, there needs to be a clear justification that this is the model for the situation. The assumptions underpinning the model are clearly discussed. Alternative models, or variants, must be discussed and strengths and weaknesses made clear. Why was this model chosen? You should mention the software that you used to run the model. There is some evidence of thought about the circumstances in which the model may not be appropriate. There is evidence of model validation and checking, whether that is out of sample or comparison to a straw man or RMSE, test/training, or appropriate sensitivity checks. You should be clear about model convergence, model checks, and diagnostic issues, but if this becomes too detailed then you could push some of this to an appendix. Great answers would discuss things such as, how do the aspects that you discussed in the data section assert themselves in the modelling decisions that you make. Again if it becomes too detailed then push some of the details to footnotes or an appendix. Again, explain what your model is and what is going on with it.</td></tr>
    <tr><td class="gt_row gt_left">Results</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 2 - 'Many issues'; 4 - 'Some issues'; 6 - 'Good'; 8 - 'Great'; 10 - 'Exceptional'</td>
<td class="gt_row gt_left">Results will likely require summary statistics, tables, graphs, images, and possibly statistical analysis or maps. To be clear, you should also have text associated with all these aspects. Show the reader the results by plotting them. Talk about them. Explain them. That said, this section should strictly relay results.</td></tr>
    <tr><td class="gt_row gt_left">Discussion</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 2 - 'Many issues'; 4 - 'Some issues'; 6 - 'Good'; 8 - 'Great'; 10 - 'Exceptional'</td>
<td class="gt_row gt_left">Some questions that a good discussion would cover include (each of these would be a sub-section of something like half a page to a page): What is done in this this paper? What is something that we learn about the world? What is another thing that we learn about the world? What are some weaknesses of what was done? What is left to learn or how should we proceed in the future?</td></tr>
    <tr><td class="gt_row gt_left">Cross-references</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 2 - 'Yes'</td>
<td class="gt_row gt_left">All figures, tables, equations, etc are numbered, cross-referenced, and referred to in the text.</td></tr>
    <tr><td class="gt_row gt_left">Proofreading</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 2 - 'Yes'</td>
<td class="gt_row gt_left">All aspects of submission are free of noticeable typos.</td></tr>
    <tr><td class="gt_row gt_left">Graphs/tables/etc</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 1 - 'Gets job done'; 2 - 'Fine'; 3 - 'Great'; 4 - 'Exceptional'</td>
<td class="gt_row gt_left">You must include graphs and tables in your paper and they must be to a high standard. They must be well formatted and camera-ready They should be clear and digestible. They must: 1) serve a clear purpose; 2) be fully self-contained through appropriate use of labels/explanations, etc; and 3) appropriately sized and coloured (or appropriate significant figures in the case of stats).</td></tr>
    <tr><td class="gt_row gt_left">References</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 3 - 'One minor issue'; 4 - 'Perfect'</td>
<td class="gt_row gt_left">All data/software/literature/etc are appropriately noted and cited. You must cite the software and software packages that you use. You must cite the datasets that you use. You must cite literature that you refer to (and you should refer to literature). If you take a small chunk of code from Stack Overflow then add the page in a comment next to the code. If you take a large chunk of code then cite it fully. 3 means one minor issue. More than one minor issue receives 0.</td></tr>
    <tr><td class="gt_row gt_left">Reproducibility</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 1 - 'Gets job done'; 2 - 'Fine'; 3 - 'Great'; 4 - 'Exceptional'</td>
<td class="gt_row gt_left">The paper and analysis must be fully reproducible. A detailed README is included. All code should be thoroughly documented. An R project is used. Do not use `setwd()`. The code must appropriately read data, prepare it, create plots, conduct analysis, generate documents, etc. Seeds are used where needed. Code must have a preamble etc. You must appropriately document your scripts such that someone coming in could follow them. Your repo must be thoroughly organized and not contain extraneous files.</td></tr>
    <tr><td class="gt_row gt_left">General excellence</td>
<td class="gt_row gt_left">0 - 'None'; 1 - 'Huh, that's interesting'; 2 - 'Wow'; 3 - 'Exceptional'</td>
<td class="gt_row gt_left">There are always students that excel in a way that is not anticipated in the rubric. This item accounts for that.</td></tr>
  </tbody>
  
  
</table>
</div>
```

### Previous examples

\newpage






## Final paper

### Task

- Please work individually. Write a paper that involves original research to tell a story with data.


### Guidance

- Please work individually.
- You have various options for topics (pick one):
  - Develop a research question that is of interest to you and obtain or create a relevant dataset. This option involves developing your own research question based on your own interests, background, and expertise. I encourage you to take this option, but please discuss your plans with me.
  - A reproduction, being sure to use the paper as a foundation rather than as an end-in-itself.
- Everything must entirely reproducible. 
- The paper must have the following sections:
    - Title, date, author, keywords, abstract, introduction, data, model, results, discussion, appendix (optional, for supporting, but not critical, material), and a reference list. 
    - It must also include an enhancement, and this would either be contained or linked in the appendix.
- The paper must be well-written, draw on relevant literature, and show statistical skills by explaining all statistical concepts.
- The discussion needs to be substantial. For instance, if the paper were 10 pages long then a discussion should be at least 2.5 pages. In the discussion, the paper must include subsections on weaknesses and next steps - but these must be in proportion.
- The report must provide a link to a GitHub repo that contains everything (apart from any raw data that you git ignored if it is not yours to share). The code must be entirely reproducible, documented, and readable. The repo must be well-organized and appropriately use folders and README files. 

### Peer review submission 

- My expectations for this paper are very high. I'm very excited to read what you submit. To help you achieve this standard, there is an initial 'submission' where you can get comments and feedback and then the final, actual, submission. 
- Submit initial materials for peer-review.
  - As an individual, via Quercus, submit a PDF of your rough draft on Quercus.
  - At a minimum this must include:
  - All top-matter (title, author (you can use a pseudonym if you want), date, keywords, abstract) completely filled out.
  - A fully written Introduction section.
- All other sections must be present in your paper, but don’t have to be filled out (e.g. you must have a 'Data' heading, but you don't need to have content in that section).
- To be clear - it is fine to later change any aspect of what you submit at this checkpoint.
- You will be awarded one percentage point just for submitting a draft that meets this minimum.
- The point of this is to get feedback on your work (and to make sure you have at least started thinking about this project) so you are more than welcome to (and so, if it is at all possible) include other sections that you wish to get feedback on.
- There will be no extensions granted for this submission since the following submission is dependent on this date.


### Conduct peer-review

- As an individual, you will randomly be assigned a handful of rough drafts to provide feedback. You have three days to provide feedback to your peers.
- If you provide feedback to one peer you will receive one percentage point, if you provide feedback to two peers you will receive two percentage points, if you provide feedback to three (or more) peers you will receive the full three percentage points.
- Your feedback must include at least five comments (meaningful/useful bullet points). These must be well-written and thoughtful.
- There will be no extensions granted for this submission since the following submission is dependent on this date.
- Please remember that you are providing feedback here to help your colleagues. All comments should be professional and kind. It is challenging to receive criticism. Please remember that your goal here is to help your peers advance their writing/analysis. Any feedback that is inappropriate or not up to standard will receive a 0.


### Checks

- TBD

### FAQ

- Can I work as part of a team? No. it is important that you have some work that is entirely your own. You really need your own work to show off for job applications etc.
- How much should I write? Most students submit something that has 10-to-16-pages of main content, with additional pages devoted to appendices, but it is up to you. Be precise and thorough.
- Do I have to submit an initial paper in order to do the peer-review? Yes.

### Rubric


```{=html}
<div id="sheyaagxyl" style="overflow-x:auto;overflow-y:auto;width:auto;height:auto;">
<style>html {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
}

#sheyaagxyl .gt_table {
  display: table;
  border-collapse: collapse;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
  font-weight: normal;
  font-style: normal;
  background-color: #FFFFFF;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}

#sheyaagxyl .gt_heading {
  background-color: #FFFFFF;
  text-align: center;
  border-bottom-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#sheyaagxyl .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}

#sheyaagxyl .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 0;
  padding-bottom: 6px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}

#sheyaagxyl .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#sheyaagxyl .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#sheyaagxyl .gt_col_heading {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}

#sheyaagxyl .gt_column_spanner_outer {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}

#sheyaagxyl .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#sheyaagxyl .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#sheyaagxyl .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 5px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}

#sheyaagxyl .gt_group_heading {
  padding: 8px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
}

#sheyaagxyl .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}

#sheyaagxyl .gt_from_md > :first-child {
  margin-top: 0;
}

#sheyaagxyl .gt_from_md > :last-child {
  margin-bottom: 0;
}

#sheyaagxyl .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}

#sheyaagxyl .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 12px;
}

#sheyaagxyl .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#sheyaagxyl .gt_first_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
}

#sheyaagxyl .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#sheyaagxyl .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#sheyaagxyl .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#sheyaagxyl .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#sheyaagxyl .gt_footnotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#sheyaagxyl .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding: 4px;
}

#sheyaagxyl .gt_sourcenotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#sheyaagxyl .gt_sourcenote {
  font-size: 90%;
  padding: 4px;
}

#sheyaagxyl .gt_left {
  text-align: left;
}

#sheyaagxyl .gt_center {
  text-align: center;
}

#sheyaagxyl .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#sheyaagxyl .gt_font_normal {
  font-weight: normal;
}

#sheyaagxyl .gt_font_bold {
  font-weight: bold;
}

#sheyaagxyl .gt_font_italic {
  font-style: italic;
}

#sheyaagxyl .gt_super {
  font-size: 65%;
}

#sheyaagxyl .gt_footnote_marks {
  font-style: italic;
  font-weight: normal;
  font-size: 65%;
}
</style>
<table class="gt_table">
  
  <thead class="gt_col_headings">
    <tr>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1">Component</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1">Range</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1">Requirement</th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr><td class="gt_row gt_left">R is appropriately cited</td>
<td class="gt_row gt_left">0 - 'No'; 1 - 'Yes'</td>
<td class="gt_row gt_left">Both referred to in the main content and included in the reference list. If not, no need to continue marking, just give paper 0 overall.</td></tr>
    <tr><td class="gt_row gt_left">Title</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 1 - 'Yes'; 2 - 'Exceptional'</td>
<td class="gt_row gt_left">An informative title is included. Tell the reader what your story is don't waste their time. Ideally tell them what happens at the end of the story. 'Problem Set X' is not an informative title. There should be no evidence this is a school paper.</td></tr>
    <tr><td class="gt_row gt_left">Author, date, and repo</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 2 - 'Yes'</td>
<td class="gt_row gt_left">The author, date of submission, and a link to a GitHub repo are clearly included. (The later likely, but not necessarily, through a statement such as: 'Code and data supporting this analysis is available at: LINK').</td></tr>
    <tr><td class="gt_row gt_left">Abstract</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 1 - 'Gets job done'; 2 - 'Fine'; 3 - 'Great'; 4 - 'Exceptional'</td>
<td class="gt_row gt_left">An abstract is included and appropriately pitched to a general audience. The abstract answers: 1) what was done, 2) what was found, and 3) why this matters (all at a high level). If your abstract is longer than four sentences then you need to think a lot about whether it is too long. It may be fine (there are always exceptions) but you should probably have a good reason. Your abstract must tell the reader your top-level finding. What is the one thing that we learn about the world because of your paper?</td></tr>
    <tr><td class="gt_row gt_left">Introduction</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 1 - 'Gets job done'; 2 - 'Fine'; 3 - 'Great'; 4 - 'Exceptional'</td>
<td class="gt_row gt_left">The introduction is self-contained and tells a reader everything they need to know, including putting it into a broader context. Your introduction should provide a bit of broader context to motivate the reader, as well as providing a bit more detail about what you're interested in, what you did, what you found, why it's important, etc. A reader should be able to read only your introduction and have a good idea about the research that you carried out. It would be rare that you would have tables or figures in your introduction (again there are always exceptions but think deeply about whether yours is one). It must outline the structure of the paper. For instance (and this is just a rough guide) an introduction for a 10 page paper, should probably be about 3 or 4 paragraphs, or 10 per cent, but it depends on specifics.</td></tr>
    <tr><td class="gt_row gt_left">Data</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 2 - 'Many issues'; 4 - 'Some issues'; 6 - 'Good'; 8 - 'Great'; 10 - 'Exceptional'</td>
<td class="gt_row gt_left">You should thoroughly discuss the variables in the dataset that you use. Are there any that are very similar that you nonetheless don't use? Did you construct any variables by combining various ones? What do the data look like? Plot the actual data that you're using (or as close as you can get to it). Discuss these plots and the other features of these data. These are just some of the issues strong submissions will consider. Show off your knowledge. If this becomes too detailed, then you should push some of this to footnotes or an appendix. 'Exceptional' means that when I read your submission I learn something about the dataset that I don't learn from any other submission (within a reasonable measure of course).</td></tr>
    <tr><td class="gt_row gt_left">Model</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 2 - 'Many issues'; 4 - 'Some issues'; 6 - 'Good'; 8 - 'Great'; 10 - 'Exceptional'</td>
<td class="gt_row gt_left">The model is nicely written out, well-explained, justified, and appropriate. When you discuss your model you must be extremely careful to spell out the statistical model that you are using defining and explaining each aspect and why it is important. Failure to do this suggests you don't understand the model. The model is appropriately complex that is, not too simple, but not unnecessarily complicated. The model has well-defined variables and these correspond to what is discussed in the data section. The model needs to be written out in appropriate mathematical notation but also in plain English. Every aspect of that notation must be defined otherwise the most this section can receive is poor. The model makes sense based on the substantive area, and also the form of the model. If the model is Bayesian, then priors need to be defined and sensible. Discussion needs to occur around how features enter the model and why. For instance, (and these are just examples) why use ages rather than age-groups, why does province have a levels effect, why is gender categorical, etc? In general, in order to be adequate, there needs to be a clear justification that this is the model for the situation. The assumptions underpinning the model are clearly discussed. Alternative models, or variants, must be discussed and strengths and weaknesses made clear. Why was this model chosen? You should mention the software that you used to run the model. There is some evidence of thought about the circumstances in which the model may not be appropriate. There is evidence of model validation and checking, whether that is out of sample or comparison to a straw man or RMSE, test/training, or appropriate sensitivity checks. You should be clear about model convergence, model checks, and diagnostic issues, but if this becomes too detailed then you could push some of this to an appendix. Great answers would discuss things such as, how do the aspects that you discussed in the data section assert themselves in the modelling decisions that you make. Again if it becomes too detailed then push some of the details to footnotes or an appendix. Again, explain what your model is and what is going on with it.</td></tr>
    <tr><td class="gt_row gt_left">Results</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 2 - 'Many issues'; 4 - 'Some issues'; 6 - 'Good'; 8 - 'Great'; 10 - 'Exceptional'</td>
<td class="gt_row gt_left">Results will likely require summary statistics, tables, graphs, images, and possibly statistical analysis or maps. To be clear, you should also have text associated with all these aspects. Show the reader the results by plotting them. Talk about them. Explain them. That said, this section should strictly relay results.</td></tr>
    <tr><td class="gt_row gt_left">Discussion</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 2 - 'Many issues'; 4 - 'Some issues'; 6 - 'Good'; 8 - 'Great'; 10 - 'Exceptional'</td>
<td class="gt_row gt_left">Some questions that a good discussion would cover include (each of these would be a sub-section of something like half a page to a page): What is done in this this paper? What is something that we learn about the world? What is another thing that we learn about the world? What are some weaknesses of what was done? What is left to learn or how should we proceed in the future?</td></tr>
    <tr><td class="gt_row gt_left">Cross-references</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 2 - 'Yes'</td>
<td class="gt_row gt_left">All figures, tables, equations, etc are numbered, cross-referenced, and referred to in the text.</td></tr>
    <tr><td class="gt_row gt_left">Proofreading</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 2 - 'Yes'</td>
<td class="gt_row gt_left">All aspects of submission are free of noticeable typos.</td></tr>
    <tr><td class="gt_row gt_left">Graphs/tables/etc</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 1 - 'Gets job done'; 2 - 'Fine'; 3 - 'Great'; 4 - 'Exceptional'</td>
<td class="gt_row gt_left">You must include graphs and tables in your paper and they must be to a high standard. They must be well formatted and camera-ready They should be clear and digestible. They must: 1) serve a clear purpose; 2) be fully self-contained through appropriate use of labels/explanations, etc; and 3) appropriately sized and coloured (or appropriate significant figures in the case of stats).</td></tr>
    <tr><td class="gt_row gt_left">References</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 3 - 'One minor issue'; 4 - 'Perfect'</td>
<td class="gt_row gt_left">All data/software/literature/etc are appropriately noted and cited. You must cite the software and software packages that you use. You must cite the datasets that you use. You must cite literature that you refer to (and you should refer to literature). If you take a small chunk of code from Stack Overflow then add the page in a comment next to the code. If you take a large chunk of code then cite it fully. 3 means one minor issue. More than one minor issue receives 0.</td></tr>
    <tr><td class="gt_row gt_left">Reproducibility</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 1 - 'Gets job done'; 2 - 'Fine'; 3 - 'Great'; 4 - 'Exceptional'</td>
<td class="gt_row gt_left">The paper and analysis must be fully reproducible. A detailed README is included. All code should be thoroughly documented. An R project is used. Do not use `setwd()`. The code must appropriately read data, prepare it, create plots, conduct analysis, generate documents, etc. Seeds are used where needed. Code must have a preamble etc. You must appropriately document your scripts such that someone coming in could follow them. Your repo must be thoroughly organized and not contain extraneous files.</td></tr>
    <tr><td class="gt_row gt_left">Enhancements</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 1 - 'Gets job done'; 2 - 'Fine'; 3 - 'Great'; 4 - 'Exceptional'</td>
<td class="gt_row gt_left">You should pick at least one of the following and include it to enhance your submission: 1) A datasheet for your dataset AND a model card for your model; 2) A Shiny application; 3) An R package; or 4) API for your model.</td></tr>
    <tr><td class="gt_row gt_left">General excellence</td>
<td class="gt_row gt_left">0 - 'None'; 1 - 'Huh, that's interesting'; 2 - 'Wow'; 3 - 'Exceptional'</td>
<td class="gt_row gt_left">There are always students that excel in a way that is not anticipated in the rubric. This item accounts for that.</td></tr>
  </tbody>
  
  
</table>
</div>
```

### Previous examples

Some examples of papers that well in the past include those by: [Rachael Lam](inputs/pdfs/Lam_Rachael-final_paper.pdf).


