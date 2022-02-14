

# Papers



## Paper One

### Task

Working individually and in an entirely reproducible way, please find a dataset of interest on [Open Data Toronto](https://open.toronto.ca) and write a short paper telling a story about the data.

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
<div id="ltdfnzgjct" style="overflow-x:auto;overflow-y:auto;width:auto;height:auto;">
<style>html {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
}

#ltdfnzgjct .gt_table {
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

#ltdfnzgjct .gt_heading {
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

#ltdfnzgjct .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}

#ltdfnzgjct .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 0;
  padding-bottom: 6px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}

#ltdfnzgjct .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#ltdfnzgjct .gt_col_headings {
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

#ltdfnzgjct .gt_col_heading {
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

#ltdfnzgjct .gt_column_spanner_outer {
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

#ltdfnzgjct .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#ltdfnzgjct .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#ltdfnzgjct .gt_column_spanner {
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

#ltdfnzgjct .gt_group_heading {
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

#ltdfnzgjct .gt_empty_group_heading {
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

#ltdfnzgjct .gt_from_md > :first-child {
  margin-top: 0;
}

#ltdfnzgjct .gt_from_md > :last-child {
  margin-bottom: 0;
}

#ltdfnzgjct .gt_row {
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

#ltdfnzgjct .gt_stub {
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

#ltdfnzgjct .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#ltdfnzgjct .gt_first_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
}

#ltdfnzgjct .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#ltdfnzgjct .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#ltdfnzgjct .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#ltdfnzgjct .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#ltdfnzgjct .gt_footnotes {
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

#ltdfnzgjct .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding: 4px;
}

#ltdfnzgjct .gt_sourcenotes {
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

#ltdfnzgjct .gt_sourcenote {
  font-size: 90%;
  padding: 4px;
}

#ltdfnzgjct .gt_left {
  text-align: left;
}

#ltdfnzgjct .gt_center {
  text-align: center;
}

#ltdfnzgjct .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#ltdfnzgjct .gt_font_normal {
  font-weight: normal;
}

#ltdfnzgjct .gt_font_bold {
  font-weight: bold;
}

#ltdfnzgjct .gt_font_italic {
  font-style: italic;
}

#ltdfnzgjct .gt_super {
  font-size: 65%;
}

#ltdfnzgjct .gt_footnote_marks {
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
<td class="gt_row gt_left">Must be referred to in the main content and included in the reference list. If not, no need to continue marking, paper gets 0 overall.</td></tr>
    <tr><td class="gt_row gt_left">Title</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 1 - 'Yes'; 2 - 'Exceptional'</td>
<td class="gt_row gt_left">An informative title is included that explains the story, and ideally tells the reader what happens at the end of it. 'Paper X' is not an informative title. There should be no evidence this is a school paper.</td></tr>
    <tr><td class="gt_row gt_left">Author, date, and repo</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 2 - 'Yes'</td>
<td class="gt_row gt_left">The author, date of submission in unambiguous format, and a link to a GitHub repo are clearly included. (The later likely, but not necessarily, through a statement such as: 'Code and data supporting this analysis is available at: LINK').</td></tr>
    <tr><td class="gt_row gt_left">Abstract</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 1 - 'Gets job done'; 2 - 'Fine'; 3 - 'Great'; 4 - 'Exceptional'</td>
<td class="gt_row gt_left">An abstract is included and appropriately pitched to a non-specialist audience. The abstract answers: 1) what was done, 2) what was found, and 3) why this matters (all at a high level). Likely four sentences. Abstract must make clear what we learn about the world because of this paper.</td></tr>
    <tr><td class="gt_row gt_left">Introduction</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 1 - 'Gets job done'; 2 - 'Fine'; 3 - 'Great'; 4 - 'Exceptional'</td>
<td class="gt_row gt_left">The introduction is self-contained and tells a reader everything they need to know including: 1) broader context to motivate; 2) some detail about what the paper is about; 3) a clear gap that needs to be filled; 4) what was done; 5) what was found; and 6) why it is important. A reader should be able to read only the introduction and have a good idea about the research that was carried out. Tables and figures are likely not included. It outlines the structure of the paper. Likely 3 or 4 paragraphs, or 10 per cent of total.</td></tr>
    <tr><td class="gt_row gt_left">Data</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 2 - 'Many issues'; 4 - 'Some issues'; 6 - 'Good'; 8 - 'Great'; 10 - 'Exceptional'</td>
<td class="gt_row gt_left">You should thoroughly discuss the variables in the dataset that you use. Are there any that are very similar that you nonetheless don't use? Did you construct any variables by combining various ones? What do the data look like? Plot the actual data that you're using (or as close as you can get to it). Discuss these plots and the other features of these data. These are just some of the issues strong submissions will consider. Show off your knowledge. If this becomes too detailed, then you should push some of this to footnotes or an appendix. 'Exceptional' means that when I read your submission I learn something about the dataset that I don't learn from any other submission (within a reasonable measure of course).</td></tr>
    <tr><td class="gt_row gt_left">Cross-references</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 2 - 'Yes'</td>
<td class="gt_row gt_left">All figures, tables, equations, etc are numbered, cross-referenced, and referred to in the text.</td></tr>
    <tr><td class="gt_row gt_left">Prose</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 2 - 'Yes'</td>
<td class="gt_row gt_left">All aspects of submission should be free of noticeable typos, spelling mistakes, and be grammatically correct. Prose should be coherent, concise, and clear.</td></tr>
    <tr><td class="gt_row gt_left">Graphs/tables/etc</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 1 - 'Gets job done'; 2 - 'Fine'; 3 - 'Great'; 4 - 'Exceptional'</td>
<td class="gt_row gt_left">You must include graphs and tables in your paper and they must be to a high standard. They must be well formatted and camera-ready They should be clear and digestible. They must: 1) serve a clear purpose; 2) be fully self-contained through appropriate use of labels/explanations, etc; and 3) appropriately sized and colored (or appropriate significant figures in the case of stats).</td></tr>
    <tr><td class="gt_row gt_left">Reference list</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 3 - 'One minor issue'; 4 - 'Perfect'</td>
<td class="gt_row gt_left">All data, software, literature, and any other relevant material, are cited in-text and included in a reference list made using bibtex. A few lines of code from Stack Overflow or similar, should be acknowledged just with a comment in the script immediately preceding the use of the code. Larger chunks of code should be fully acknowledged with an in-text citation and appear in the reference list.</td></tr>
    <tr><td class="gt_row gt_left">Reproducibility</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 1 - 'Gets job done'; 2 - 'Fine'; 3 - 'Great'; 4 - 'Exceptional'</td>
<td class="gt_row gt_left">The paper and analysis must be fully reproducible. A detailed README is included. All code should be thoroughly documented. An R project must be used. Do not use setwd(). The code must appropriately read data, prepare it, create plots, conduct analysis, generate documents, etc. Seeds are used where needed. Code must have a preamble etc. You must appropriately document your scripts such that someone coming in could follow them. Your repo must be thoroughly organized and not contain extraneous files.</td></tr>
    <tr><td class="gt_row gt_left">General excellence</td>
<td class="gt_row gt_left">0 - 'None'; 1 - 'Huh, that's interesting'; 2 - 'Wow'; 3 - 'Exceptional'</td>
<td class="gt_row gt_left">There are always students that excel in a way that is not anticipated in the rubric. This item accounts for that.</td></tr>
  </tbody>
  
  
</table>
</div>
```

### Previous examples

Some examples of papers that did well include: 

- 2021: [Amy Farrow](inputs/pdfs/paper_one-2021-Amy_Farrow.pdf), [Morgaine Westin](inputs/pdfs/paper_one-2021-Morgaine_Westin.pdf), and [Rachel Lam](inputs/pdfs/paper_one-2021-Rachel_Lam.pdf).
- 2022: [Adam Labas](inputs/pdfs/paper_one-2022-adam_labas.pdf), [Alicia Yang](inputs/pdfs/paper_one-2022-alicia_yang.pdf), [Alyssa Schleifer](inputs/pdfs/paper_one-2022-alyssa_schleifer.pdf), [Ethan Sansom](inputs/pdfs/paper_one-2022-ethan_sansom.pdf), [Hudson Yuen](inputs/pdfs/paper_one-2022-hudson_yuen.pdf), [Jack McKay](inputs/pdfs/paper_one-2022-jack_mckay.pdf), [Roy Chan](inputs/pdfs/paper_one-2022-roy_chan.pdf), [Thomas D'Onofrio](inputs/pdfs/paper_one-2022-thomas_donofrio.pdf), and [William Gerecke](inputs/pdfs/paper_one-2022-william_gerecke.pdf).



\newpage




## Paper Two

### Task

- Working as part of a team of up to three people, please pick a paper of interest to you, with code and data that are available, published anytime since 2019, in an American Economic Association [journal](https://www.aeaweb.org/journals). These journals are: 'American Economic Review', 'AER: Insights', 'AEJ: Applied Economics', 'AEJ: Economic Policy', 'AEJ: Macroeconomics', 'AEJ: Microeconomics', 'Journal of Economic Literature', 'Journal of Economic Perspectives', 'AEA Papers & Proceedings'.
- Following the [*Guide for Accelerating Computational Reproducibility in the Social Sciences*](https://bitss.github.io/ACRE/), please complete a **replication**^[This terminology is used following @barba2018terminologies, but it is the opposite of that used by BITSS.] of at least three graphs, tables, or a combination, from that paper, using the [Social Science Reproduction Platform](https://www.socialsciencereproduction.org). Note the DOI of your replication.
- Working in an entirely reproducible way then conduct a **reproduction** based on two or three aspects of the paper, and write a short paper about that. 
  - Create a well-organized folder with appropriate sub-folders, add it to GitHub, and then prepare a PDF using R Markdown with these sections (you are welcome to use this [starter folder](https://github.com/RohanAlexander/starter_folder)): title, author, date, abstract, introduction, data, results, discussion, and references.
  - The aspects that you focus on in your paper could be the same aspects that you replicated, but they do not need to be. Follow the direction of the paper, but make it your own. That means you should ask a slightly different question, or answer the same question in a slightly different way, but still use the same dataset.
  - Include the DOI of your replication in your paper and a link to the GitHub repo that underpins your paper.
  - The discussion should include three or four sub-sections that each focus on a point you find interesting, and there should be another sub-section on the weaknesses of your paper and next steps for your paper.
  - In the discussion section, and any other relevant section, please be sure to discuss ethics and bias, with reference to relevant literature.
  - The paper should be well-written, draw on relevant literature, and explain all technical concepts. Pitch it at an educated, but non-specialist, audience.
  - Use appendices for supporting, but not critical, material. 
  - Code should be entirely reproducible, well-documented, and readable.
- Submit a PDF of your paper. 
- There should be no evidence that this is a class assignment.


### Checks

Check that: 

- For your paper you have not just copy/pasted the code from the original paper, but have instead used that as a foundation to work from.
- Your paper has a link to the associated GitHub repository and the DOI of the Social Science Reproduction Platform replication that you conducted. 
- You have referenced everything, including R. Strong submissions will draw on related literature in the discussion (and other sections) and would be sure to also reference those. The style of references does not matter, provided it is consistent.


### FAQ

- How much should I write? Most students submit something in the 10-to-15-page range, but it is up to you. Be precise and thorough.
- Do I have to focus on a model result? No, it is likely best to stay away from that at this point, and instead focus on tables or graphs of summary or explanatory statistics.
- What if the paper I choose is in a language other than R? Both your replication and reproduction code should be in R. So you will need to translate the code into R for the replication. And the reproduction should be your own work, so that also should be in R.
- Can I work by myself? Yes.

### Rubric


|Component                |Range                                                                                                     |Requirement                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
|:------------------------|:---------------------------------------------------------------------------------------------------------|:-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|R is appropriately cited |0 - 'No'; 1 - 'Yes'                                                                                       |Must be referred to in the main content and included in the reference list. If not, no need to continue marking, paper gets 0 overall.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |
|Replication              |0 - 'Poor or not done'; 2 - 'Many issues'; 4 - 'Some issues'; 6 - 'Good'; 8 - 'Great'; 10 - 'Exceptional' |If replication is poor or not done, no need to continue marking, paper gets 0 overall.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |
|Title                    |0 - 'Poor or not done'; 1 - 'Yes'; 2 - 'Exceptional'                                                      |An informative title is included that explains the story, and ideally tells the reader what happens at the end of it. 'Paper X' is not an informative title. There should be no evidence this is a school paper.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
|Author, date, and repo   |0 - 'Poor or not done'; 2 - 'Yes'                                                                         |The author, date of submission in unambiguous format, and a link to a GitHub repo are clearly included. (The later likely, but not necessarily, through a statement such as: 'Code and data supporting this analysis is available at: LINK').                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
|Abstract                 |0 - 'Poor or not done'; 1 - 'Gets job done'; 2 - 'Fine'; 3 - 'Great'; 4 - 'Exceptional'                   |An abstract is included and appropriately pitched to a non-specialist audience. The abstract answers: 1) what was done, 2) what was found, and 3) why this matters (all at a high level). Likely four sentences. Abstract must make clear what we learn about the world because of this paper.                                                                                                                                                                                                                                                                                                                                                                                                                                                    |
|Introduction             |0 - 'Poor or not done'; 1 - 'Gets job done'; 2 - 'Fine'; 3 - 'Great'; 4 - 'Exceptional'                   |The introduction is self-contained and tells a reader everything they need to know including: 1) broader context to motivate; 2) some detail about what the paper is about; 3) a clear gap that needs to be filled; 4) what was done; 5) what was found; and 6) why it is important. A reader should be able to read only the introduction and have a good idea about the research that was carried out. Tables and figures are likely not included. It outlines the structure of the paper. Likely 3 or 4 paragraphs, or 10 per cent of total.                                                                                                                                                                                                   |
|Data                     |0 - 'Poor or not done'; 2 - 'Many issues'; 4 - 'Some issues'; 6 - 'Good'; 8 - 'Great'; 10 - 'Exceptional' |You should thoroughly discuss the variables in the dataset that you use. Are there any that are very similar that you nonetheless don't use? Did you construct any variables by combining various ones? What do the data look like? Plot the actual data that you're using (or as close as you can get to it). Discuss these plots and the other features of these data. These are just some of the issues strong submissions will consider. Show off your knowledge. If this becomes too detailed, then you should push some of this to footnotes or an appendix. 'Exceptional' means that when I read your submission I learn something about the dataset that I don't learn from any other submission (within a reasonable measure of course). |
|Results                  |0 - 'Poor or not done'; 2 - 'Many issues'; 4 - 'Some issues'; 6 - 'Good'; 8 - 'Great'; 10 - 'Exceptional' |Results will likely require summary statistics, tables, graphs, images, and possibly statistical analysis or maps. To be clear, you should also have text associated with all these aspects. Show the reader the results by plotting them. Talk about them. Explain them. That said, this section should strictly relay results.                                                                                                                                                                                                                                                                                                                                                                                                                  |
|Discussion               |0 - 'Poor or not done'; 2 - 'Many issues'; 4 - 'Some issues'; 6 - 'Good'; 8 - 'Great'; 10 - 'Exceptional' |Some questions that a good discussion would cover include (each of these would be a sub-section of something like half a page to a page): What is done in this this paper? What is something that we learn about the world? What is another thing that we learn about the world? What are some weaknesses of what was done? What is left to learn or how should we proceed in the future?                                                                                                                                                                                                                                                                                                                                                         |
|Cross-references         |0 - 'Poor or not done'; 2 - 'Yes'                                                                         |All figures, tables, equations, etc are numbered, cross-referenced, and referred to in the text.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
|Prose                    |0 - 'Poor or not done'; 2 - 'Yes'                                                                         |All aspects of submission should be free of noticeable typos, spelling mistakes, and be grammatically correct. Prose should be coherent, concise, and clear.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |
|Graphs/tables/etc        |0 - 'Poor or not done'; 1 - 'Gets job done'; 2 - 'Fine'; 3 - 'Great'; 4 - 'Exceptional'                   |You must include graphs and tables in your paper and they must be to a high standard. They must be well formatted and camera-ready They should be clear and digestible. They must: 1) serve a clear purpose; 2) be fully self-contained through appropriate use of labels/explanations, etc; and 3) appropriately sized and colored (or appropriate significant figures in the case of stats).                                                                                                                                                                                                                                                                                                                                                    |
|Reference list           |0 - 'Poor or not done'; 3 - 'One minor issue'; 4 - 'Perfect'                                              |All data, software, literature, and any other relevant material, are cited in-text and included in a reference list made using bibtex. A few lines of code from Stack Overflow or similar, should be acknowledged just with a comment in the script immediately preceding the use of the code. Larger chunks of code should be fully acknowledged with an in-text citation and appear in the reference list.                                                                                                                                                                                                                                                                                                                                      |
|Reproducibility          |0 - 'Poor or not done'; 1 - 'Gets job done'; 2 - 'Fine'; 3 - 'Great'; 4 - 'Exceptional'                   |The paper and analysis must be fully reproducible. A detailed README is included. All code should be thoroughly documented. An R project must be used. Do not use setwd(). The code must appropriately read data, prepare it, create plots, conduct analysis, generate documents, etc. Seeds are used where needed. Code must have a preamble etc. You must appropriately document your scripts such that someone coming in could follow them. Your repo must be thoroughly organized and not contain extraneous files.                                                                                                                                                                                                                           |
|General excellence       |0 - 'None'; 1 - 'Huh, that's interesting'; 2 - 'Wow'; 3 - 'Exceptional'                                   |There are always students that excel in a way that is not anticipated in the rubric. This item accounts for that.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |

### Previous examples

Some examples of papers that well in the past include those by: [Amy Farrow](inputs/pdfs/Farrow_Amy-replication_paper.pdf), [Laura Cline](inputs/pdfs/Cline_Laura-IndigenousWomenInPrison.pdf), [Hong Shi](inputs/pdfs/Shi_Hong-replication_paper.pdf), and [Jia Jia Ji](inputs/pdfs/Jia_Jia_Ji-effect_of_DLL_ON_spanish_literacy_skills.pdf).


\newpage







<!-- ## Paper Three -->


<!-- ### Task -->

<!-- Working in teams of one to three  people, please consider this scenario: -->

<!-- - 'You are employed as a junior statistician at Petit Poll - a Canadian polling company. Petit Poll has a contract with a Canadian political party to provide them with monthly polling updates.' -->
<!-- - Working as part of a small team of 1-3 people, and in an entirely reproducible way, please write a short paper that tells the client a story about their standing. -->


<!-- ### Recommended steps -->

<!-- - Please pick a political party that you are 'working for', and pick a geographic focus: 1) the overall election, 2) a particular province, or 3) a specific riding.  -->
<!-- - Then decide on a survey methodology (hint: p. 13 of Wu & Thompson provides a handy checklist). Some questions you should address include:  -->
<!-- - What is the population, frame, and sample?  -->
<!-- - What sampling methods will you use and why (e.g. you could choose SRSWOR, stratified, etc).  -->
<!-- - What are some of the statistical properties that the method brings to the table (e.g. for SRSWOR you could discuss Wu & Thompson, Theorem 2.2, etc, as appropriate)?  -->
<!-- - How are you going to reach your desired respondents? -->
<!-- - How much do you estimate this will cost? -->
<!-- - What steps will you take to deal with non-response and how will non-response affect your survey?  -->
<!-- - How are you going to protect respondent privacy?  -->
<!-- - Remember to consider all of this in the context of your 'client' - for instance, who would be more interested in Alberta ridings: Bloc Québécois or the Conservatives? Who likely has more money to spend - the Liberals or the Greens? -->
<!-- - Develop a survey on a platform that was introduced in class. Be sure to test it yourselves. You will want to test this as much as possible, maybe even swap informally with another group? -->
<!-- - Now release the surveys into the (simulated) 'field'. Please do this by simulating an appropriate number of responses to your survey in R. Don't forget to simulate in relation to the survey methodology that you proposed. Show the results and discuss your 'findings'. Everything must be entirely reproducible. You may like to consider linking your survey 'responses' with other data such as the census or GSS. -->
<!-- - Use R Markdown to write a PDF report about all of this. Discuss your results and findings, your survey design and motivations, etc - all of it. You are writing a report that will eventually go to the 'client', so you must set the scene, and use language that demonstrates your command of statistical concepts but brings the reader along with you. Be sure to include graphs and tables and reference them in your discussion. Be sure to be clear about weaknesses and biases, and opportunities for future work.  -->
<!-- - Your report must be well written. You are allowed to, and should, use mathematical notation, but you must explain all of it in plain English. Similarly, you can, and should, use surveys/sampling/observational data terminology, but again, you need to explain it.  -->
<!-- - Your report must include at least the following aspects: title, date, authorship, non-technical executive summary, introduction, survey methodology, results, discussion, appendices that detail the survey, and references. Your 'client' has stats graduates working for it who need to be impressed by the main content of the report, but also has people who barely know what an average is and these people need to be impressed also. This is why your report should include a non-technical executive summary. In terms of length, this would typically be roughly 10 per cent of the report. It would be more detailed than an introduction, but still at a high level.  -->
<!-- - Your graphs must be of an extremely high standard. -->
<!-- - Check that you have referenced everything. Strong submissions will draw on related literature in the discussion and would be sure to also reference those. The style of references does not matter, provided it is consistent. -->
<!-- - Via Quercus, submit a link to your PDF report which is hosted on GitHub. At some point in the introduction to your report, you must provide a link to the GitHub repo where the code that you used for this assignment lives (Hint: Comment. Your. Code.). Your entire workflow must be entirely reproducible. -->
<!-- - Please be sure to include a link to your survey in your report and screenshots of the survey in the appendix of your report.  -->
<!-- - There should be no evidence that this is a class assignment. -->

<!-- ### Checks -->

<!-- - Check you have not included any R code or raw R output in the final PDF. -->
<!-- - Check you have cited R and any R packages used. -->
<!-- - Check that although you will probably have most of your code in the R Markdown, make sure that you have at least one R script in the `scripts` folder. -->
<!-- - Check there is thoroughly commented code that directly creates your PDF. Do not knit to html and then save as a PDF. Do not knit to Word and then save as a PDF -->
<!-- - Check that your graph and discussion are extremely clear, and of comparable quality to those of FiveThirtyEight. -->
<!-- - Check that the date is updated to the date of submission. -->
<!-- - Check your entire workflow is entirely reproducible. -->
<!-- - Check for typos. -->
<!-- - Check that you have got an appendix that details the survey/s and a link to the live survey. -->


<!-- ### FAQ -->

<!-- - Can I work by myself? Yes. But the workload assumes you will work as part of a group. -->
<!-- - Can we switch groups for the third paper? Yes. -->
<!-- - How can I find a group? I will randomly create groups of three  in Quercus. You are welcome to shift out of those groups and form your own groups if you'd like. -->
<!-- - Can I get a different mark to the rest of my group? No. Everyone in the group gets the same mark. -->
<!-- - I wrote my paper by myself, so can I be graded on a different scale? No. All papers are graded in the same way. -->
<!-- - How much should I write? Most students submit something in the 10-to-15-page range, but it is up to you. Be precise and thorough. -->
<!-- - How do students collaborate successfully? Groups that split up the work typically seem to do the best. So one student worries about the survey, one about simulating and analyzing data, and another about the write-up. If you're worried about using GitHub to collaborate, then just create different folders in GitHub to place your separate bits of work, and then have one person bring it together at the end. -->
<!-- - What intervention should we use? The intention is that you do something of interest to you. A well-written introduction would make the intervention clear. -->


<!-- ### Rubric -->


<!-- ```{r, eval = TRUE, echo = FALSE, warning = FALSE, message = FALSE} -->
<!-- rubric |> -->
<!--   filter(!Component %in% c("Replication", "Model", "Enhancements")) |> -->
<!--   gt() -->
<!-- ``` -->

<!-- ### Previous examples -->

<!-- Some examples of papers that well in the past include those by:  -->


<!-- \newpage -->










## Paper Three

### Task

- Working in teams of one to three people, and in an entirely reproducible way, please pick one of the following: [Australian General Social Survey](https://www.abs.gov.au/statistics/people/people-and-communities/general-social-survey-summary-results-australia), [Canadian General Social Survey](https://www150.statcan.gc.ca/n1/pub/89f0115x/89f0115x2013001-eng.htm), [European Social Survey](http://www.europeansocialsurvey.org), [German General Social Survey](https://www.gesis.org/en/allbus/allbus-home), [US General Social Survey](https://gss.norc.org/Get-The-Data).
- Focus on one aspect of the survey, obtain the data, and then use it to tell a story.
  - Create a well-organized folder with appropriate sub-folders, add it to GitHub, and then prepare a PDF using R Markdown with these sections (you are welcome to use this [starter folder](https://github.com/RohanAlexander/starter_folder)): title, author, date, abstract, introduction, data, results, discussion, an appendix containing a survey, and references.
  - In addition to conveying a sense of the dataset of interest, the data section should include, but not be limited to:
      - A detailed discussion of survey methodology, and its key features, strengths, and weaknesses. Including how they find people to take the survey; what their population, frame, and sample were; what sampling approach they took and what some of the trade-offs may be; what they do about non-response; the cost.
      - A discussion of the questionnaire: what is good and bad about it?
      - A discussion of the methodology.
      - If this becomes too detailed then you should push some of this to an appendix. 
  - The discussion should include three or four sub-sections that each focus on a point you find interesting, and there should be another sub-section on the weaknesses of your paper and next steps for your paper.
  - In the discussion section, and any other relevant section, please be sure to discuss ethics and bias, with reference to relevant literature.
  - Use appendices for supporting, but not critical, material.
  - In the appendix, please include a survey that you could use to augment the general social survey of your choice. Your survey will be distributed in the same manner as the general social survey, but needs to stand independently. You survey should be put together using a survey platform, and a link to this should be included in the appendix, as well as details of the survey. The purpose of your survey to gain additional information on the topic that is the focus of your paper, beyond that gathered by the general social survey.
  - Code should be entirely reproducible, well-documented, and readable.
- Submit a PDF of your paper. 
- The paper should be well-written, draw on relevant literature, and explain all technical concepts. Pitch it at an educated, but non-specialist, audience. You should use survey, sampling, observational, and statistical terminology, but again you need to explain it. Your work should have flow and should be easy to follow and understand. To communicate well, anyone at the university level should be able to read your report once and relay back the methodology, overall results, findings, weaknesses, and next steps without confusion. 
- There should be no evidence that this is a class assignment.



 



### Checks

Check that: 

- In an appendix you have both included a link to your survey and included the details of it.
 

### FAQ

- What should I focus on? You may focus on any year, aspect, or geography that is reasonable given the focus and constraints of the general social survey that you are interested in. Please consider the year and topics that you are interested in together, as some years surveys tend to focus on particular topics.
<!-- - The Canadian GSS is available to University of Toronto students via the library. In order to use it you need to clean and prepare it. Code to do this for one year is being distributed alongside this problem set and was discussed in lectures.  -->
<!-- - You are welcome to simply use this code and this year, but the topic of that year will constrain your focus. Naturally, you are welcome to adapt the code to other years. If you use the code exactly as is then you must cite it. If you adapt the code then you don't have to cite it, as it has a MIT license, but it would be appropriate to at least mention and acknowledge it, depending on how close your adaption is. -->


### Rubric


```{=html}
<div id="nwpqpqtnfy" style="overflow-x:auto;overflow-y:auto;width:auto;height:auto;">
<style>html {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
}

#nwpqpqtnfy .gt_table {
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

#nwpqpqtnfy .gt_heading {
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

#nwpqpqtnfy .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}

#nwpqpqtnfy .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 0;
  padding-bottom: 6px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}

#nwpqpqtnfy .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#nwpqpqtnfy .gt_col_headings {
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

#nwpqpqtnfy .gt_col_heading {
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

#nwpqpqtnfy .gt_column_spanner_outer {
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

#nwpqpqtnfy .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#nwpqpqtnfy .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#nwpqpqtnfy .gt_column_spanner {
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

#nwpqpqtnfy .gt_group_heading {
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

#nwpqpqtnfy .gt_empty_group_heading {
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

#nwpqpqtnfy .gt_from_md > :first-child {
  margin-top: 0;
}

#nwpqpqtnfy .gt_from_md > :last-child {
  margin-bottom: 0;
}

#nwpqpqtnfy .gt_row {
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

#nwpqpqtnfy .gt_stub {
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

#nwpqpqtnfy .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#nwpqpqtnfy .gt_first_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
}

#nwpqpqtnfy .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#nwpqpqtnfy .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#nwpqpqtnfy .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#nwpqpqtnfy .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#nwpqpqtnfy .gt_footnotes {
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

#nwpqpqtnfy .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding: 4px;
}

#nwpqpqtnfy .gt_sourcenotes {
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

#nwpqpqtnfy .gt_sourcenote {
  font-size: 90%;
  padding: 4px;
}

#nwpqpqtnfy .gt_left {
  text-align: left;
}

#nwpqpqtnfy .gt_center {
  text-align: center;
}

#nwpqpqtnfy .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#nwpqpqtnfy .gt_font_normal {
  font-weight: normal;
}

#nwpqpqtnfy .gt_font_bold {
  font-weight: bold;
}

#nwpqpqtnfy .gt_font_italic {
  font-style: italic;
}

#nwpqpqtnfy .gt_super {
  font-size: 65%;
}

#nwpqpqtnfy .gt_footnote_marks {
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
<td class="gt_row gt_left">Must be referred to in the main content and included in the reference list. If not, no need to continue marking, paper gets 0 overall.</td></tr>
    <tr><td class="gt_row gt_left">Title</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 1 - 'Yes'; 2 - 'Exceptional'</td>
<td class="gt_row gt_left">An informative title is included that explains the story, and ideally tells the reader what happens at the end of it. 'Paper X' is not an informative title. There should be no evidence this is a school paper.</td></tr>
    <tr><td class="gt_row gt_left">Author, date, and repo</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 2 - 'Yes'</td>
<td class="gt_row gt_left">The author, date of submission in unambiguous format, and a link to a GitHub repo are clearly included. (The later likely, but not necessarily, through a statement such as: 'Code and data supporting this analysis is available at: LINK').</td></tr>
    <tr><td class="gt_row gt_left">Abstract</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 1 - 'Gets job done'; 2 - 'Fine'; 3 - 'Great'; 4 - 'Exceptional'</td>
<td class="gt_row gt_left">An abstract is included and appropriately pitched to a non-specialist audience. The abstract answers: 1) what was done, 2) what was found, and 3) why this matters (all at a high level). Likely four sentences. Abstract must make clear what we learn about the world because of this paper.</td></tr>
    <tr><td class="gt_row gt_left">Introduction</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 1 - 'Gets job done'; 2 - 'Fine'; 3 - 'Great'; 4 - 'Exceptional'</td>
<td class="gt_row gt_left">The introduction is self-contained and tells a reader everything they need to know including: 1) broader context to motivate; 2) some detail about what the paper is about; 3) a clear gap that needs to be filled; 4) what was done; 5) what was found; and 6) why it is important. A reader should be able to read only the introduction and have a good idea about the research that was carried out. Tables and figures are likely not included. It outlines the structure of the paper. Likely 3 or 4 paragraphs, or 10 per cent of total.</td></tr>
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
    <tr><td class="gt_row gt_left">Prose</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 2 - 'Yes'</td>
<td class="gt_row gt_left">All aspects of submission should be free of noticeable typos, spelling mistakes, and be grammatically correct. Prose should be coherent, concise, and clear.</td></tr>
    <tr><td class="gt_row gt_left">Graphs/tables/etc</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 1 - 'Gets job done'; 2 - 'Fine'; 3 - 'Great'; 4 - 'Exceptional'</td>
<td class="gt_row gt_left">You must include graphs and tables in your paper and they must be to a high standard. They must be well formatted and camera-ready They should be clear and digestible. They must: 1) serve a clear purpose; 2) be fully self-contained through appropriate use of labels/explanations, etc; and 3) appropriately sized and colored (or appropriate significant figures in the case of stats).</td></tr>
    <tr><td class="gt_row gt_left">Survey</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 2 - 'Many issues'; 4 - 'Some issues'; 6 - 'Good'; 8 - 'Great'; 10 - 'Exceptional'</td>
<td class="gt_row gt_left">The survey should have an introductory section and include details of a contact, and then the survey questions should be well constructed and appropriate to the task</td></tr>
    <tr><td class="gt_row gt_left">Reference list</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 3 - 'One minor issue'; 4 - 'Perfect'</td>
<td class="gt_row gt_left">All data, software, literature, and any other relevant material, are cited in-text and included in a reference list made using bibtex. A few lines of code from Stack Overflow or similar, should be acknowledged just with a comment in the script immediately preceding the use of the code. Larger chunks of code should be fully acknowledged with an in-text citation and appear in the reference list.</td></tr>
    <tr><td class="gt_row gt_left">Reproducibility</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 1 - 'Gets job done'; 2 - 'Fine'; 3 - 'Great'; 4 - 'Exceptional'</td>
<td class="gt_row gt_left">The paper and analysis must be fully reproducible. A detailed README is included. All code should be thoroughly documented. An R project must be used. Do not use setwd(). The code must appropriately read data, prepare it, create plots, conduct analysis, generate documents, etc. Seeds are used where needed. Code must have a preamble etc. You must appropriately document your scripts such that someone coming in could follow them. Your repo must be thoroughly organized and not contain extraneous files.</td></tr>
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

- Paper about data cleaning and preparation: include a data sheet.


\newpage




## Paper Five

### Task

- Paper about causal inference.


- You must include a DAG (probably in the model section).


\newpage




## Paper Six

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
    - The discussion needs to be substantial. For instance, if the paper were 10 pages long then a discussion should be at least 2.5 pages. In the discussion, the paper must include subsections on weaknesses, and next steps - but these must be in proportion.
    - The report must provide a link to a GitHub repo that contains everything (apart from the raw data that you git ignored because it is not yours to share). The code must be entirely reproducible, documented, and readable. The repo must be well-organized and appropriately use folders and README files.
    - The graphs and tables must be of a high standard, well formatted, and report ready. They should be clean and digestible. Furthermore, you should label and describe each table/figure.
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

- It is expected that your submission be well written and able to be understood by the average reader of say 538. This means that you are allowed to use mathematical notation, but you must be able to explain it all in plain English. Similarly, you can (and hint: you should) use survey, sampling, observational, and statistical terminology, but again you need to explain it. The average person doesn't know what a p-value is nor what a confidence interval is. You need to explain all of this in plain language the first time you use it. Your work should have flow and should be easy to follow and understand. To communicate well, anyone at the university level should be able to read your report once and relay back the methodology, overall results, findings, weaknesses, and next steps without confusion. 
- It is recommended that you (informally) proofread one another's work - why not exchange papers with another group? 
- Everyone in the team receives the same mark.
- There should be no evidence that this is a class assignment.

### FAQ



### Rubric


```{=html}
<div id="ukwcohqtig" style="overflow-x:auto;overflow-y:auto;width:auto;height:auto;">
<style>html {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
}

#ukwcohqtig .gt_table {
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

#ukwcohqtig .gt_heading {
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

#ukwcohqtig .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}

#ukwcohqtig .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 0;
  padding-bottom: 6px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}

#ukwcohqtig .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#ukwcohqtig .gt_col_headings {
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

#ukwcohqtig .gt_col_heading {
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

#ukwcohqtig .gt_column_spanner_outer {
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

#ukwcohqtig .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#ukwcohqtig .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#ukwcohqtig .gt_column_spanner {
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

#ukwcohqtig .gt_group_heading {
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

#ukwcohqtig .gt_empty_group_heading {
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

#ukwcohqtig .gt_from_md > :first-child {
  margin-top: 0;
}

#ukwcohqtig .gt_from_md > :last-child {
  margin-bottom: 0;
}

#ukwcohqtig .gt_row {
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

#ukwcohqtig .gt_stub {
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

#ukwcohqtig .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#ukwcohqtig .gt_first_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
}

#ukwcohqtig .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#ukwcohqtig .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#ukwcohqtig .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#ukwcohqtig .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#ukwcohqtig .gt_footnotes {
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

#ukwcohqtig .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding: 4px;
}

#ukwcohqtig .gt_sourcenotes {
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

#ukwcohqtig .gt_sourcenote {
  font-size: 90%;
  padding: 4px;
}

#ukwcohqtig .gt_left {
  text-align: left;
}

#ukwcohqtig .gt_center {
  text-align: center;
}

#ukwcohqtig .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#ukwcohqtig .gt_font_normal {
  font-weight: normal;
}

#ukwcohqtig .gt_font_bold {
  font-weight: bold;
}

#ukwcohqtig .gt_font_italic {
  font-style: italic;
}

#ukwcohqtig .gt_super {
  font-size: 65%;
}

#ukwcohqtig .gt_footnote_marks {
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
<td class="gt_row gt_left">Must be referred to in the main content and included in the reference list. If not, no need to continue marking, paper gets 0 overall.</td></tr>
    <tr><td class="gt_row gt_left">Title</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 1 - 'Yes'; 2 - 'Exceptional'</td>
<td class="gt_row gt_left">An informative title is included that explains the story, and ideally tells the reader what happens at the end of it. 'Paper X' is not an informative title. There should be no evidence this is a school paper.</td></tr>
    <tr><td class="gt_row gt_left">Author, date, and repo</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 2 - 'Yes'</td>
<td class="gt_row gt_left">The author, date of submission in unambiguous format, and a link to a GitHub repo are clearly included. (The later likely, but not necessarily, through a statement such as: 'Code and data supporting this analysis is available at: LINK').</td></tr>
    <tr><td class="gt_row gt_left">Abstract</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 1 - 'Gets job done'; 2 - 'Fine'; 3 - 'Great'; 4 - 'Exceptional'</td>
<td class="gt_row gt_left">An abstract is included and appropriately pitched to a non-specialist audience. The abstract answers: 1) what was done, 2) what was found, and 3) why this matters (all at a high level). Likely four sentences. Abstract must make clear what we learn about the world because of this paper.</td></tr>
    <tr><td class="gt_row gt_left">Introduction</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 1 - 'Gets job done'; 2 - 'Fine'; 3 - 'Great'; 4 - 'Exceptional'</td>
<td class="gt_row gt_left">The introduction is self-contained and tells a reader everything they need to know including: 1) broader context to motivate; 2) some detail about what the paper is about; 3) a clear gap that needs to be filled; 4) what was done; 5) what was found; and 6) why it is important. A reader should be able to read only the introduction and have a good idea about the research that was carried out. Tables and figures are likely not included. It outlines the structure of the paper. Likely 3 or 4 paragraphs, or 10 per cent of total.</td></tr>
    <tr><td class="gt_row gt_left">Data</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 2 - 'Many issues'; 4 - 'Some issues'; 6 - 'Good'; 8 - 'Great'; 10 - 'Exceptional'</td>
<td class="gt_row gt_left">You should thoroughly discuss the variables in the dataset that you use. Are there any that are very similar that you nonetheless don't use? Did you construct any variables by combining various ones? What do the data look like? Plot the actual data that you're using (or as close as you can get to it). Discuss these plots and the other features of these data. These are just some of the issues strong submissions will consider. Show off your knowledge. If this becomes too detailed, then you should push some of this to footnotes or an appendix. 'Exceptional' means that when I read your submission I learn something about the dataset that I don't learn from any other submission (within a reasonable measure of course).</td></tr>
    <tr><td class="gt_row gt_left">Model</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 2 - 'Many issues'; 4 - 'Some issues'; 6 - 'Good'; 8 - 'Great'; 10 - 'Exceptional'</td>
<td class="gt_row gt_left">The model is nicely written out, well-explained, justified, and appropriate. When you discuss your model, you must be extremely careful to spell out the statistical model that you are using defining and explaining each aspect and why it is important. Failure to do this suggests you don't understand the model. The model is appropriately complex that is, not too simple, but not unnecessarily complicated. The model has well-defined variables and these correspond to what is discussed in the data section. The model needs to be written out in appropriate mathematical notation but also in plain English. Every aspect of that notation must be defined otherwise the most this section can receive is poor. The model makes sense based on the substantive area, and also the form of the model. If the model is Bayesian, then priors need to be defined and sensible. Discussion needs to occur around how features enter the model and why. For instance, (and these are just examples) why use ages rather than age-groups, why does province have a levels effect, why is gender categorical, etc? In general, in order to be adequate, there needs to be a clear justification that this is the model for the situation. The assumptions underpinning the model are clearly discussed. Alternative models, or variants, must be discussed and strengths and weaknesses made clear. Why was this model chosen? You should mention the software that you used to run the model. There is some evidence of thought about the circumstances in which the model may not be appropriate. There is evidence of model validation and checking, whether that is out of sample or comparison to a straw man or RMSE, test/training, or appropriate sensitivity checks. You should be clear about model convergence, model checks, and diagnostic issues, but if this becomes too detailed then you could push some of this to an appendix. Great answers would discuss things such as, how do the aspects that you discussed in the data section assert themselves in the modelling decisions that you make. Again if it becomes too detailed then push some of the details to footnotes or an appendix. Again, explain what your model is and what is going on with it.</td></tr>
    <tr><td class="gt_row gt_left">Results</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 2 - 'Many issues'; 4 - 'Some issues'; 6 - 'Good'; 8 - 'Great'; 10 - 'Exceptional'</td>
<td class="gt_row gt_left">Results will likely require summary statistics, tables, graphs, images, and possibly statistical analysis or maps. To be clear, you should also have text associated with all these aspects. Show the reader the results by plotting them. Talk about them. Explain them. That said, this section should strictly relay results.</td></tr>
    <tr><td class="gt_row gt_left">Discussion</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 2 - 'Many issues'; 4 - 'Some issues'; 6 - 'Good'; 8 - 'Great'; 10 - 'Exceptional'</td>
<td class="gt_row gt_left">Some questions that a good discussion would cover include (each of these would be a sub-section of something like half a page to a page): What is done in this this paper? What is something that we learn about the world? What is another thing that we learn about the world? What are some weaknesses of what was done? What is left to learn or how should we proceed in the future?</td></tr>
    <tr><td class="gt_row gt_left">Cross-references</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 2 - 'Yes'</td>
<td class="gt_row gt_left">All figures, tables, equations, etc are numbered, cross-referenced, and referred to in the text.</td></tr>
    <tr><td class="gt_row gt_left">Prose</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 2 - 'Yes'</td>
<td class="gt_row gt_left">All aspects of submission should be free of noticeable typos, spelling mistakes, and be grammatically correct. Prose should be coherent, concise, and clear.</td></tr>
    <tr><td class="gt_row gt_left">Graphs/tables/etc</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 1 - 'Gets job done'; 2 - 'Fine'; 3 - 'Great'; 4 - 'Exceptional'</td>
<td class="gt_row gt_left">You must include graphs and tables in your paper and they must be to a high standard. They must be well formatted and camera-ready They should be clear and digestible. They must: 1) serve a clear purpose; 2) be fully self-contained through appropriate use of labels/explanations, etc; and 3) appropriately sized and colored (or appropriate significant figures in the case of stats).</td></tr>
    <tr><td class="gt_row gt_left">Reference list</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 3 - 'One minor issue'; 4 - 'Perfect'</td>
<td class="gt_row gt_left">All data, software, literature, and any other relevant material, are cited in-text and included in a reference list made using bibtex. A few lines of code from Stack Overflow or similar, should be acknowledged just with a comment in the script immediately preceding the use of the code. Larger chunks of code should be fully acknowledged with an in-text citation and appear in the reference list.</td></tr>
    <tr><td class="gt_row gt_left">Reproducibility</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 1 - 'Gets job done'; 2 - 'Fine'; 3 - 'Great'; 4 - 'Exceptional'</td>
<td class="gt_row gt_left">The paper and analysis must be fully reproducible. A detailed README is included. All code should be thoroughly documented. An R project must be used. Do not use setwd(). The code must appropriately read data, prepare it, create plots, conduct analysis, generate documents, etc. Seeds are used where needed. Code must have a preamble etc. You must appropriately document your scripts such that someone coming in could follow them. Your repo must be thoroughly organized and not contain extraneous files.</td></tr>
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
- The discussion needs to be substantial. For instance, if the paper were 10 pages long then a discussion should be at least 2.5 pages. In the discussion, the paper must include subsections on weaknesses, and next steps - but these must be in proportion.
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
<div id="xaegukdiqw" style="overflow-x:auto;overflow-y:auto;width:auto;height:auto;">
<style>html {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
}

#xaegukdiqw .gt_table {
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

#xaegukdiqw .gt_heading {
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

#xaegukdiqw .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}

#xaegukdiqw .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 0;
  padding-bottom: 6px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}

#xaegukdiqw .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#xaegukdiqw .gt_col_headings {
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

#xaegukdiqw .gt_col_heading {
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

#xaegukdiqw .gt_column_spanner_outer {
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

#xaegukdiqw .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#xaegukdiqw .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#xaegukdiqw .gt_column_spanner {
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

#xaegukdiqw .gt_group_heading {
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

#xaegukdiqw .gt_empty_group_heading {
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

#xaegukdiqw .gt_from_md > :first-child {
  margin-top: 0;
}

#xaegukdiqw .gt_from_md > :last-child {
  margin-bottom: 0;
}

#xaegukdiqw .gt_row {
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

#xaegukdiqw .gt_stub {
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

#xaegukdiqw .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#xaegukdiqw .gt_first_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
}

#xaegukdiqw .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#xaegukdiqw .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#xaegukdiqw .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#xaegukdiqw .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#xaegukdiqw .gt_footnotes {
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

#xaegukdiqw .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding: 4px;
}

#xaegukdiqw .gt_sourcenotes {
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

#xaegukdiqw .gt_sourcenote {
  font-size: 90%;
  padding: 4px;
}

#xaegukdiqw .gt_left {
  text-align: left;
}

#xaegukdiqw .gt_center {
  text-align: center;
}

#xaegukdiqw .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#xaegukdiqw .gt_font_normal {
  font-weight: normal;
}

#xaegukdiqw .gt_font_bold {
  font-weight: bold;
}

#xaegukdiqw .gt_font_italic {
  font-style: italic;
}

#xaegukdiqw .gt_super {
  font-size: 65%;
}

#xaegukdiqw .gt_footnote_marks {
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
<td class="gt_row gt_left">Must be referred to in the main content and included in the reference list. If not, no need to continue marking, paper gets 0 overall.</td></tr>
    <tr><td class="gt_row gt_left">Title</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 1 - 'Yes'; 2 - 'Exceptional'</td>
<td class="gt_row gt_left">An informative title is included that explains the story, and ideally tells the reader what happens at the end of it. 'Paper X' is not an informative title. There should be no evidence this is a school paper.</td></tr>
    <tr><td class="gt_row gt_left">Author, date, and repo</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 2 - 'Yes'</td>
<td class="gt_row gt_left">The author, date of submission in unambiguous format, and a link to a GitHub repo are clearly included. (The later likely, but not necessarily, through a statement such as: 'Code and data supporting this analysis is available at: LINK').</td></tr>
    <tr><td class="gt_row gt_left">Abstract</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 1 - 'Gets job done'; 2 - 'Fine'; 3 - 'Great'; 4 - 'Exceptional'</td>
<td class="gt_row gt_left">An abstract is included and appropriately pitched to a non-specialist audience. The abstract answers: 1) what was done, 2) what was found, and 3) why this matters (all at a high level). Likely four sentences. Abstract must make clear what we learn about the world because of this paper.</td></tr>
    <tr><td class="gt_row gt_left">Introduction</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 1 - 'Gets job done'; 2 - 'Fine'; 3 - 'Great'; 4 - 'Exceptional'</td>
<td class="gt_row gt_left">The introduction is self-contained and tells a reader everything they need to know including: 1) broader context to motivate; 2) some detail about what the paper is about; 3) a clear gap that needs to be filled; 4) what was done; 5) what was found; and 6) why it is important. A reader should be able to read only the introduction and have a good idea about the research that was carried out. Tables and figures are likely not included. It outlines the structure of the paper. Likely 3 or 4 paragraphs, or 10 per cent of total.</td></tr>
    <tr><td class="gt_row gt_left">Data</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 2 - 'Many issues'; 4 - 'Some issues'; 6 - 'Good'; 8 - 'Great'; 10 - 'Exceptional'</td>
<td class="gt_row gt_left">You should thoroughly discuss the variables in the dataset that you use. Are there any that are very similar that you nonetheless don't use? Did you construct any variables by combining various ones? What do the data look like? Plot the actual data that you're using (or as close as you can get to it). Discuss these plots and the other features of these data. These are just some of the issues strong submissions will consider. Show off your knowledge. If this becomes too detailed, then you should push some of this to footnotes or an appendix. 'Exceptional' means that when I read your submission I learn something about the dataset that I don't learn from any other submission (within a reasonable measure of course).</td></tr>
    <tr><td class="gt_row gt_left">Model</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 2 - 'Many issues'; 4 - 'Some issues'; 6 - 'Good'; 8 - 'Great'; 10 - 'Exceptional'</td>
<td class="gt_row gt_left">The model is nicely written out, well-explained, justified, and appropriate. When you discuss your model, you must be extremely careful to spell out the statistical model that you are using defining and explaining each aspect and why it is important. Failure to do this suggests you don't understand the model. The model is appropriately complex that is, not too simple, but not unnecessarily complicated. The model has well-defined variables and these correspond to what is discussed in the data section. The model needs to be written out in appropriate mathematical notation but also in plain English. Every aspect of that notation must be defined otherwise the most this section can receive is poor. The model makes sense based on the substantive area, and also the form of the model. If the model is Bayesian, then priors need to be defined and sensible. Discussion needs to occur around how features enter the model and why. For instance, (and these are just examples) why use ages rather than age-groups, why does province have a levels effect, why is gender categorical, etc? In general, in order to be adequate, there needs to be a clear justification that this is the model for the situation. The assumptions underpinning the model are clearly discussed. Alternative models, or variants, must be discussed and strengths and weaknesses made clear. Why was this model chosen? You should mention the software that you used to run the model. There is some evidence of thought about the circumstances in which the model may not be appropriate. There is evidence of model validation and checking, whether that is out of sample or comparison to a straw man or RMSE, test/training, or appropriate sensitivity checks. You should be clear about model convergence, model checks, and diagnostic issues, but if this becomes too detailed then you could push some of this to an appendix. Great answers would discuss things such as, how do the aspects that you discussed in the data section assert themselves in the modelling decisions that you make. Again if it becomes too detailed then push some of the details to footnotes or an appendix. Again, explain what your model is and what is going on with it.</td></tr>
    <tr><td class="gt_row gt_left">Results</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 2 - 'Many issues'; 4 - 'Some issues'; 6 - 'Good'; 8 - 'Great'; 10 - 'Exceptional'</td>
<td class="gt_row gt_left">Results will likely require summary statistics, tables, graphs, images, and possibly statistical analysis or maps. To be clear, you should also have text associated with all these aspects. Show the reader the results by plotting them. Talk about them. Explain them. That said, this section should strictly relay results.</td></tr>
    <tr><td class="gt_row gt_left">Discussion</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 2 - 'Many issues'; 4 - 'Some issues'; 6 - 'Good'; 8 - 'Great'; 10 - 'Exceptional'</td>
<td class="gt_row gt_left">Some questions that a good discussion would cover include (each of these would be a sub-section of something like half a page to a page): What is done in this this paper? What is something that we learn about the world? What is another thing that we learn about the world? What are some weaknesses of what was done? What is left to learn or how should we proceed in the future?</td></tr>
    <tr><td class="gt_row gt_left">Cross-references</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 2 - 'Yes'</td>
<td class="gt_row gt_left">All figures, tables, equations, etc are numbered, cross-referenced, and referred to in the text.</td></tr>
    <tr><td class="gt_row gt_left">Prose</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 2 - 'Yes'</td>
<td class="gt_row gt_left">All aspects of submission should be free of noticeable typos, spelling mistakes, and be grammatically correct. Prose should be coherent, concise, and clear.</td></tr>
    <tr><td class="gt_row gt_left">Graphs/tables/etc</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 1 - 'Gets job done'; 2 - 'Fine'; 3 - 'Great'; 4 - 'Exceptional'</td>
<td class="gt_row gt_left">You must include graphs and tables in your paper and they must be to a high standard. They must be well formatted and camera-ready They should be clear and digestible. They must: 1) serve a clear purpose; 2) be fully self-contained through appropriate use of labels/explanations, etc; and 3) appropriately sized and colored (or appropriate significant figures in the case of stats).</td></tr>
    <tr><td class="gt_row gt_left">Reference list</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 3 - 'One minor issue'; 4 - 'Perfect'</td>
<td class="gt_row gt_left">All data, software, literature, and any other relevant material, are cited in-text and included in a reference list made using bibtex. A few lines of code from Stack Overflow or similar, should be acknowledged just with a comment in the script immediately preceding the use of the code. Larger chunks of code should be fully acknowledged with an in-text citation and appear in the reference list.</td></tr>
    <tr><td class="gt_row gt_left">Reproducibility</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 1 - 'Gets job done'; 2 - 'Fine'; 3 - 'Great'; 4 - 'Exceptional'</td>
<td class="gt_row gt_left">The paper and analysis must be fully reproducible. A detailed README is included. All code should be thoroughly documented. An R project must be used. Do not use setwd(). The code must appropriately read data, prepare it, create plots, conduct analysis, generate documents, etc. Seeds are used where needed. Code must have a preamble etc. You must appropriately document your scripts such that someone coming in could follow them. Your repo must be thoroughly organized and not contain extraneous files.</td></tr>
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


