

# Papers



## Paper One

### Task

- Working individually and in an entirely reproducible way, please find a dataset of interest on [Open Data Toronto](https://open.toronto.ca) and write a short paper telling a story about the data. 
  - Create a well-organized folder with appropriate sub-folders, and add it to GitHub. You are welcome to use this [starter folder](https://github.com/RohanAlexander/starter_folder).
  - Find a dataset of interest on [Open Data Toronto](https://open.toronto.ca). 
    - Put together an R script, 'scripts/00-simulation.R', that simulates the dataset of interest. Push to GitHub and include an informative commit message
    - Write an R script, 'scripts/00-download_data.R' to download the actual data in a reproducible way using `opendatatoronto` [@citeSharla]. Save the data: 'inputs/data/raw_data.csv'. Push to GitHub and include an informative commit message
  - Prepare a PDF using R Markdown 'outputs/paper/paper.Rmd' with these sections: title, author, date, abstract, introduction, data, and references. 
    - The title should be descriptive, informative, and specific. 
    - The date should be in an unambiguous format. Add a link to the GitHub repo in the acknowledgements.
    - The abstract should be three or four sentences. The abstract must tell the reader the top-level finding. What is the one thing that we learn about the world because of this paper?
    - The introduction should be two or three paragraphs of content. And there should be an additional final paragraph that sets out the remainder of the paper.
    - The data section should thoroughly and precisely discuss the source of the data and the bias this brings (ethical, statistical, and otherwise). Comprehensively describe and summarize the data using text, graphs, and tables. Graphs must be made with `ggplot2` [@citeggplot] and tables must be made with `knitr` [@citeknitr] or `gt` [@citegt]. Graphs must show the actual data, or as close to it as possible, not summary statistics. Graphs and tables should be cross-referenced in the text e.g. 'Table 1 shows...').
    - References should be added using BibTeX. Be sure to reference R and any R packages you use, as well as the dataset. Strong submissions will draw on related literature and reference those.
    - The paper should be well-written, draw on relevant literature, and explain all technical concepts. Pitch it at an educated, but non-specialist, audience.
    - Use appendices for supporting, but not critical, material.
    - Push to GitHub and include an informative commit message
- Submit a PDF of your paper.
- There should be no evidence that this is a class assignment.






### Checks

- There should be no R code or raw R output in the final PDF.
- Code should be entirely reproducible, well-documented, commented, and readable.
- The paper should knit directly to PDF i.e. use 'Knit to PDF'. 
    - Do not use 'Knit to html' and then save as a PDF. 
    - Do not use 'Knit to Word' and then save as a PDF
- Graphs, tables, and text should be clear, and of comparable quality to those of FiveThirtyEight.
- The date should be up-to-date and unambiguous (e.g. 2/3/2022 is ambiguous, 2 March 2022 is not).
- The entire workflow should be entirely reproducible.
- There should not be any typos.
- There should be no sign this is a school paper.
- There must be a link to the paper's GitHub repo using a footnote.
- The GitHub repo should be well-organized, and contain an informative README. 
- The paper should be well-written and able to be understood by the average reader of, say, FiveThirtyEight. This means that you are allowed to use mathematical notation, but you must explain all of it in plain language. All statistical concepts and terminology must be explained. Your reader is someone with a university education, but not necessarily someone who understands what a p-value is.


### FAQ

- Can I use a dataset from Kaggle instead? No, because they have done the hard work for you.
- I cannot use code to download my dataset, can I just manually download it? No, because your entire workflow needs to be reproducible. Please fix the download problem or pick a different dataset.
- How much should I write? Most students submit something in the two-to-six-page range, but it is up to you. Be precise and thorough.
- My data is about apartment blocks/NBA/League of Legends so there's no ethical or bias aspect, what do I do? Please re-read the readings to better understand bias and ethics. If you really cannot think of something, then it might be worth picking a different dataset.
- Can I use Python? No. If you already know Python then it doesn't hurt to learn another language.
- Why do I need to cite R, when I don't need to cite Word? R is a free statistical programming language with academic origins, so it is appropriate to acknowledge the work of others. it is also important for reproducibility.
- What reference style should I use? Any major reference style is fine (APA, Harvard, Chicago, etc); just pick one that you are used to.
- The paper in the starter folder has a model section, so do I need to put together a model? No. The starter folder is designed to be applicable to all of the papers; just delete the aspects that you do not need.
- What does 'graph the actual data' mean? If you have, say 5,000 observations in the dataset and three variables, then for every variable there should be a graph that has 5,000 points in the case of dots, or adds up to 5,000 in the case of bar charts and histograms.

### Rubric


```{=html}
<div id="rometdgvni" style="overflow-x:auto;overflow-y:auto;width:auto;height:auto;">
<style>html {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
}

#rometdgvni .gt_table {
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

#rometdgvni .gt_heading {
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

#rometdgvni .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}

#rometdgvni .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 0;
  padding-bottom: 6px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}

#rometdgvni .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#rometdgvni .gt_col_headings {
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

#rometdgvni .gt_col_heading {
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

#rometdgvni .gt_column_spanner_outer {
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

#rometdgvni .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#rometdgvni .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#rometdgvni .gt_column_spanner {
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

#rometdgvni .gt_group_heading {
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

#rometdgvni .gt_empty_group_heading {
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

#rometdgvni .gt_from_md > :first-child {
  margin-top: 0;
}

#rometdgvni .gt_from_md > :last-child {
  margin-bottom: 0;
}

#rometdgvni .gt_row {
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

#rometdgvni .gt_stub {
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

#rometdgvni .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#rometdgvni .gt_first_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
}

#rometdgvni .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#rometdgvni .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#rometdgvni .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#rometdgvni .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#rometdgvni .gt_footnotes {
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

#rometdgvni .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding: 4px;
}

#rometdgvni .gt_sourcenotes {
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

#rometdgvni .gt_sourcenote {
  font-size: 90%;
  padding: 4px;
}

#rometdgvni .gt_left {
  text-align: left;
}

#rometdgvni .gt_center {
  text-align: center;
}

#rometdgvni .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#rometdgvni .gt_font_normal {
  font-weight: normal;
}

#rometdgvni .gt_font_bold {
  font-weight: bold;
}

#rometdgvni .gt_font_italic {
  font-style: italic;
}

#rometdgvni .gt_super {
  font-size: 65%;
}

#rometdgvni .gt_footnote_marks {
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
<td class="gt_row gt_left">The introduction is self-contained and tells a reader everything they need to know including: 1) broader context to motivate; 2) some detail about what the paper is about; 3) a clear gap that needs to be filled; 4) what was done; 5) what was found; 6) why it is important; 7) the structure of the paper. A reader should be able to read only the introduction and know what was done, why, and what was found. Likely 3 or 4 paragraphs, or 10 per cent of total.</td></tr>
    <tr><td class="gt_row gt_left">Data</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 2 - 'Many issues'; 4 - 'Some issues'; 6 - 'Good'; 8 - 'Great'; 10 - 'Exceptional'</td>
<td class="gt_row gt_left">A sense of the dataset should be communicated to the reader. All variables should be thoroughly examined and explained. Explain if there were similar datasets that could have been used and why they were not. If variables were constructed then this should be mentioned, and high-level cleaning aspects of note should be mentioned, but this section should focus on the destination, not the journey. It is important to understand what the variables look like by including graphs, and possibly tables, of all observations, along with discussion of those graphs and the other features of these data. Summary statistics should also be included, and well as any relationships between the variables. If this becomes too detailed, then appendices could be used.</td></tr>
    <tr><td class="gt_row gt_left">Cross-references</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 2 - 'Yes'</td>
<td class="gt_row gt_left">All figures, tables, and equations, should be numbered, and referred to in the text using cross-references.</td></tr>
    <tr><td class="gt_row gt_left">Prose</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 2 - 'Yes'</td>
<td class="gt_row gt_left">All aspects of submission should be free of noticeable typos, spelling mistakes, and be grammatically correct. Prose should be coherent, concise, and clear.</td></tr>
    <tr><td class="gt_row gt_left">Graphs/tables/etc</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 1 - 'Gets job done'; 2 - 'Fine'; 3 - 'Great'; 4 - 'Exceptional'</td>
<td class="gt_row gt_left">Graphs and tables must be included in the paper and should be to well-formatted, clear, and digestible. They should: 1) serve a clear purpose; 2) be fully self-contained through appropriate use of captions and sub-captions; 3) appropriately sized and colored; and 4) have appropriate significant figures, in the case of tables.</td></tr>
    <tr><td class="gt_row gt_left">Reference list</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 3 - 'One minor issue'; 4 - 'Perfect'</td>
<td class="gt_row gt_left">All data, software, literature, and any other relevant material, should be cited in-text and included in a reference list made using BibTeX. A few lines of code from Stack Overflow or similar, would be acknowledged just with a comment in the script immediately preceding the use of the code rather than here. But larger chunks of code should be fully acknowledged with an in-text citation and appear in the reference list.</td></tr>
    <tr><td class="gt_row gt_left">GitHub usage</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 2 - 'Excellent'</td>
<td class="gt_row gt_left">There are at least two different commits, and they have meaningful commit messages.</td></tr>
    <tr><td class="gt_row gt_left">Simulation</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 1 - 'Gets job done'; 2 - 'Fine'; 3 - 'Great'; 4 - 'Exceptional'</td>
<td class="gt_row gt_left">The script is clearly commented and structured. All variables are appropriately simulated.</td></tr>
    <tr><td class="gt_row gt_left">Reproducibility</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 1 - 'Gets job done'; 2 - 'Fine'; 3 - 'Great'; 4 - 'Exceptional'</td>
<td class="gt_row gt_left">The paper and analysis should be fully reproducible. The repo should have a detailed README. All code should be thoroughly documented. An R project should be used. Code should be used to do all steps including appropriately read data, prepare it, create plots, conduct analysis, and generate documents. Seeds should be used where needed. Code should have a preamble and be well-documented including comments and layout. The repo should be appropriately organized and not contain extraneous files. setwd() and hard coded file paths must not be used.</td></tr>
    <tr><td class="gt_row gt_left">General excellence</td>
<td class="gt_row gt_left">0 - 'None'; 1 - 'Huh, that's interesting'; 2 - 'Wow'; 3 - 'Exceptional'</td>
<td class="gt_row gt_left">There are always students that excel in a way that is not anticipated in the rubric. This item accounts for that.</td></tr>
  </tbody>
  
  
</table>
</div>
```

### Previous examples

[Adam Labas](inputs/pdfs/paper_one-2022-adam_labas.pdf), [Alicia Yang](inputs/pdfs/paper_one-2022-alicia_yang.pdf), [Alyssa Schleifer](inputs/pdfs/paper_one-2022-alyssa_schleifer.pdf), [Amy Farrow](inputs/pdfs/paper_one-2021-Amy_Farrow.pdf), [Ethan Sansom](inputs/pdfs/paper_one-2022-ethan_sansom.pdf), [Hudson Yuen](inputs/pdfs/paper_one-2022-hudson_yuen.pdf), [Jack McKay](inputs/pdfs/paper_one-2022-jack_mckay.pdf), [Morgaine Westin](inputs/pdfs/paper_one-2021-Morgaine_Westin.pdf), [Rachael Lam](inputs/pdfs/paper_one-2021-Rachael_Lam.pdf), [Roy Chan](inputs/pdfs/paper_one-2022-roy_chan.pdf), [Thomas D'Onofrio](inputs/pdfs/paper_one-2022-thomas_donofrio.pdf), and [William Gerecke](inputs/pdfs/paper_one-2022-william_gerecke.pdf).



\newpage




## Paper Two

### Task

- Working as part of a team of one to three people, please pick a paper of interest to you, with code and data that are available, published anytime since 2019, in an American Economic Association [journal](https://www.aeaweb.org/journals). These journals are: 'American Economic Review', 'AER: Insights', 'AEJ: Applied Economics', 'AEJ: Economic Policy', 'AEJ: Macroeconomics', 'AEJ: Microeconomics', 'Journal of Economic Literature', 'Journal of Economic Perspectives', 'AEA Papers & Proceedings'.
- Following the [*Guide for Accelerating Computational Reproducibility in the Social Sciences*](https://bitss.github.io/ACRE/), please complete a **replication**^[This terminology is used following @barba2018terminologies, but it is the opposite of that used by BITSS.] of at least three graphs, tables, or a combination, from that paper, using the [Social Science Reproduction Platform](https://www.socialsciencereproduction.org). Note the DOI of your replication.
- Working in an entirely reproducible way then conduct a **reproduction** based on two or three aspects of the paper, and write a short paper about that. 
  - Create a well-organized folder with appropriate sub-folders, add it to GitHub, and then prepare a PDF using R Markdown with these sections (you are welcome to use this [starter folder](https://github.com/RohanAlexander/starter_folder)): title, author, date, abstract, introduction, data, results, discussion, and references.
  - The aspects that you focus on in your paper could be the same aspects that you replicated, but they do not need to be. Follow the direction of the paper, but make it your own. That means you should ask a slightly different question, or answer the same question in a slightly different way, but still use the same dataset.
  - Include the DOI of your replication in your paper and a link to the GitHub repo that underpins your paper.
  - The results section should convey findings.
  - The discussion should include three or four sub-sections that each focus on an interesting point, and there should be another sub-section on the weaknesses of your paper, and another on potential next steps for it.
  - In the discussion section, and any other relevant section, please be sure to discuss ethics and bias, with reference to relevant literature.
  - The paper should be well-written, draw on relevant literature, and explain all technical concepts. Pitch it at an educated, but non-specialist, audience.
  - Use appendices for supporting, but not critical, material. 
  - Code should be entirely reproducible, well-documented, and readable.
- Submit a PDF of your paper. 
- There should be no evidence that this is a class assignment.


### Checks

- The paper should not just copy/paste the code from the original paper, but have instead used that as a foundation to work from.
- Your paper should have a link to the associated GitHub repository and the DOI of the Social Science Reproduction Platform replication that you conducted. 
- Make sure you have referenced everything, including R. Strong submissions will draw on related literature in the discussion (and other sections) and would be sure to also reference those. The style of references does not matter, provided it is consistent.


### FAQ

- How much should I write? Most students submit something in the 10-to-15-page range, but it is up to you. Be precise and thorough.
- Do I have to focus on a model result? No, it is likely best to stay away from that at this point, and instead focus on tables or graphs of summary or explanatory statistics.
- What if the paper I choose is in a language other than R? Both your replication and reproduction code should be in R. So you will need to translate the code into R for the replication. And the reproduction should be your own work, so that also should be in R. One common language is Stata, and @lost2022 might be useful as a 'Rosetta Stone' of sorts, for R, Python, and Stata.
- Can I work by myself? Yes.
- Do the graphs/tables have to look identical to the original? No, you are welcome to, and should, make them look better as part of the reproduction. And even as part of the replication, they do not have to be identical, just similar enough.

### Rubric


|Component                |Range                                                                                                     |Requirement                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |
|:------------------------|:---------------------------------------------------------------------------------------------------------|:--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|R is appropriately cited |0 - 'No'; 1 - 'Yes'                                                                                       |Must be referred to in the main content and included in the reference list. If not, no need to continue marking, paper gets 0 overall.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           |
|Replication              |0 - 'Poor or not done'; 2 - 'Many issues'; 4 - 'Some issues'; 6 - 'Good'; 8 - 'Great'; 10 - 'Exceptional' |SSRP submission needs to be filled out completely for three elements.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |
|Title                    |0 - 'Poor or not done'; 1 - 'Yes'; 2 - 'Exceptional'                                                      |An informative title is included that explains the story, and ideally tells the reader what happens at the end of it. 'Paper X' is not an informative title. There should be no evidence this is a school paper.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
|Author, date, and repo   |0 - 'Poor or not done'; 2 - 'Yes'                                                                         |The author, date of submission in unambiguous format, and a link to a GitHub repo are clearly included. (The later likely, but not necessarily, through a statement such as: 'Code and data supporting this analysis is available at: LINK').                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |
|Abstract                 |0 - 'Poor or not done'; 1 - 'Gets job done'; 2 - 'Fine'; 3 - 'Great'; 4 - 'Exceptional'                   |An abstract is included and appropriately pitched to a non-specialist audience. The abstract answers: 1) what was done, 2) what was found, and 3) why this matters (all at a high level). Likely four sentences. Abstract must make clear what we learn about the world because of this paper.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
|Introduction             |0 - 'Poor or not done'; 1 - 'Gets job done'; 2 - 'Fine'; 3 - 'Great'; 4 - 'Exceptional'                   |The introduction is self-contained and tells a reader everything they need to know including: 1) broader context to motivate; 2) some detail about what the paper is about; 3) a clear gap that needs to be filled; 4) what was done; 5) what was found; 6) why it is important; 7) the structure of the paper. A reader should be able to read only the introduction and know what was done, why, and what was found. Likely 3 or 4 paragraphs, or 10 per cent of total.                                                                                                                                                                                                                                                                                                        |
|Data                     |0 - 'Poor or not done'; 2 - 'Many issues'; 4 - 'Some issues'; 6 - 'Good'; 8 - 'Great'; 10 - 'Exceptional' |A sense of the dataset should be communicated to the reader. All variables should be thoroughly examined and explained. Explain if there were similar datasets that could have been used and why they were not. If variables were constructed then this should be mentioned, and high-level cleaning aspects of note should be mentioned, but this section should focus on the destination, not the journey. It is important to understand what the variables look like by including graphs, and possibly tables, of all observations, along with discussion of those graphs and the other features of these data. Summary statistics should also be included, and well as any relationships between the variables. If this becomes too detailed, then appendices could be used. |
|Results                  |0 - 'Poor or not done'; 2 - 'Many issues'; 4 - 'Some issues'; 6 - 'Good'; 8 - 'Great'; 10 - 'Exceptional' |Results will likely require summary statistics, tables, graphs, images, and possibly statistical analysis or maps. There should also be text associated with all these aspects. Show the reader the results by plotting them where possible. Talk about them. Explain them. That said, this section should strictly relay results. Regression tables must not contain stars.                                                                                                                                                                                                                                                                                                                                                                                                     |
|Discussion               |0 - 'Poor or not done'; 2 - 'Many issues'; 4 - 'Some issues'; 6 - 'Good'; 8 - 'Great'; 10 - 'Exceptional' |Some questions that a good discussion would cover include (each of these would be a sub-section of something like half a page to a page): What is done in this this paper? What is something that we learn about the world? What is another thing that we learn about the world? What are some weaknesses of what was done? What is left to learn or how should we proceed in the future?                                                                                                                                                                                                                                                                                                                                                                                        |
|Cross-references         |0 - 'Poor or not done'; 2 - 'Yes'                                                                         |All figures, tables, and equations, should be numbered, and referred to in the text using cross-references.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |
|Prose                    |0 - 'Poor or not done'; 2 - 'Yes'                                                                         |All aspects of submission should be free of noticeable typos, spelling mistakes, and be grammatically correct. Prose should be coherent, concise, and clear.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
|Graphs/tables/etc        |0 - 'Poor or not done'; 1 - 'Gets job done'; 2 - 'Fine'; 3 - 'Great'; 4 - 'Exceptional'                   |Graphs and tables must be included in the paper and should be to well-formatted, clear, and digestible. They should: 1) serve a clear purpose; 2) be fully self-contained through appropriate use of captions and sub-captions; 3) appropriately sized and colored; and 4) have appropriate significant figures, in the case of tables.                                                                                                                                                                                                                                                                                                                                                                                                                                          |
|Reference list           |0 - 'Poor or not done'; 3 - 'One minor issue'; 4 - 'Perfect'                                              |All data, software, literature, and any other relevant material, should be cited in-text and included in a reference list made using BibTeX. A few lines of code from Stack Overflow or similar, would be acknowledged just with a comment in the script immediately preceding the use of the code rather than here. But larger chunks of code should be fully acknowledged with an in-text citation and appear in the reference list.                                                                                                                                                                                                                                                                                                                                           |
|GitHub usage             |0 - 'Poor or not done'; 2 - 'Excellent'                                                                   |There are at least two different commits, and they have meaningful commit messages.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
|Simulation               |0 - 'Poor or not done'; 1 - 'Gets job done'; 2 - 'Fine'; 3 - 'Great'; 4 - 'Exceptional'                   |The script is clearly commented and structured. All variables are appropriately simulated.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
|Reproducibility          |0 - 'Poor or not done'; 1 - 'Gets job done'; 2 - 'Fine'; 3 - 'Great'; 4 - 'Exceptional'                   |The paper and analysis should be fully reproducible. The repo should have a detailed README. All code should be thoroughly documented. An R project should be used. Code should be used to do all steps including appropriately read data, prepare it, create plots, conduct analysis, and generate documents. Seeds should be used where needed. Code should have a preamble and be well-documented including comments and layout. The repo should be appropriately organized and not contain extraneous files. setwd() and hard coded file paths must not be used.                                                                                                                                                                                                             |
|General excellence       |0 - 'None'; 1 - 'Huh, that's interesting'; 2 - 'Wow'; 3 - 'Exceptional'                                   |There are always students that excel in a way that is not anticipated in the rubric. This item accounts for that.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                |

### Previous examples

[Alyssa Schleifer, Hudson Yuen, Tamsen Yau](inputs/pdfs/paper_two-2022-Alyssa_Schleifer_Hudson_Yuen_Tamsen_Yau.pdf), [Olaedo Okpareke, Arsh Lakhanpal, Swarnadeep Chattopadhyay](inputs/pdfs/paper_two-2022-Olaedo_Okpareke_Arsh_Lakhanpal_Swarnadeep_Chattopadhyay.pdf), and [Kimlin Chin](inputs/pdfs/paper_two-2022-Kimlin_Chin.pdf).


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

- Working as part of a team of one to three people, and in an entirely reproducible way, please obtain data from the [US General Social Survey](https://gss.norc.org/Get-The-Data)^[The US GSS is recommended here because individual-level data are publicly available, and the dataset is well-documented. But, often university students in particular countries have access to individual level data that are not available to the public, and if this is the case then you are welcome to use that instead.  Students at Australian universities will likely have access to individual-level data from the Australian General Social Survey, and could use that. Students at Canadian universities will likely have access to individual-level data from the Canadian General Social and may like to use that.]. (You are welcome to use a different government-run survey, but please obtain permission before starting.)
- Obtain the data, focus on one aspect of the survey, and then use it to tell a story.
  - Create a well-organized folder with appropriate sub-folders, add it to GitHub, and then use R Markdown to prepare a PDF with these sections (you are welcome to use this [starter folder](https://github.com/RohanAlexander/starter_folder)): title, author, date, abstract, introduction, data, results, discussion, an appendix that will, at least, contain a survey, and references.
  - In addition to conveying a sense of the dataset of interest, the data section should include, but not be limited to:
      - A discussion of the survey's methodology, and its key features, strengths, and weaknesses. For instance: what is the population, frame, and sample; how is the sample recruited; what sampling approach is taken, and what are some of the trade-offs of this; how is non-response handled.
      - A discussion of the questionnaire: what is good and bad about it?
      - If this becomes too detailed, then use appendices for supporting but not essential aspects.
  - In an appendix, please put together a supplementary survey that could be used to augment the general social survey the paper focuses on. The purpose of the supplementary survey is to gain additional information on the topic that is the focus of the paper, beyond that gathered by the general social survey. The survey would be distributed in the same manner as the general social survey but needs to stand independently. The supplementary survey should be put together using a survey platform. A link to this should be included in the appendix. Additionally, a copy of the survey should be included in the appendix.
  - Please be sure to discuss ethics and bias, with reference to relevant literature.
  - Code should be entirely reproducible, well-documented, and readable.
- Submit a PDF of the paper. 
- The paper should be well-written, draw on relevant literature, and explain all technical concepts. Pitch it at a university-educated, but non-specialist, audience. Use survey, sampling, and statistical terminology, but be sure to explain it. The paper should flow, and be easy to follow and understand.
- There should be no evidence that this is a class paper.


### Checks

- An appendix should contain both a link to the supplementary survey and the details of it, including questions (in case the link fails, and to make the paper self-contained).
 

### FAQ

- What should I focus on? You may focus on any year, aspect, or geography that is reasonable given the focus and constraints of the general social survey that you are interested in. Please consider the year and topics that you are interested in together, as some surveys focus on particular topics in some years.
- Do I need to include the raw GSS data in the repo? For most of the general social surveys you will not have permission to share the GSS data. If that is the case, then you should add clear details in the README explaining how the data could be obtained.
- How many graphs do I need? In general, you need at least as many graphs as you have variables, because you need to show all the observations for all variables. But you may be able to combine a few; or, vice versa, you may be interested in looking at different aspects or relationships.

### Rubric


```{=html}
<div id="fbwwjyvtgz" style="overflow-x:auto;overflow-y:auto;width:auto;height:auto;">
<style>html {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
}

#fbwwjyvtgz .gt_table {
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

#fbwwjyvtgz .gt_heading {
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

#fbwwjyvtgz .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}

#fbwwjyvtgz .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 0;
  padding-bottom: 6px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}

#fbwwjyvtgz .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#fbwwjyvtgz .gt_col_headings {
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

#fbwwjyvtgz .gt_col_heading {
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

#fbwwjyvtgz .gt_column_spanner_outer {
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

#fbwwjyvtgz .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#fbwwjyvtgz .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#fbwwjyvtgz .gt_column_spanner {
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

#fbwwjyvtgz .gt_group_heading {
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

#fbwwjyvtgz .gt_empty_group_heading {
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

#fbwwjyvtgz .gt_from_md > :first-child {
  margin-top: 0;
}

#fbwwjyvtgz .gt_from_md > :last-child {
  margin-bottom: 0;
}

#fbwwjyvtgz .gt_row {
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

#fbwwjyvtgz .gt_stub {
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

#fbwwjyvtgz .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#fbwwjyvtgz .gt_first_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
}

#fbwwjyvtgz .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#fbwwjyvtgz .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#fbwwjyvtgz .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#fbwwjyvtgz .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#fbwwjyvtgz .gt_footnotes {
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

#fbwwjyvtgz .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding: 4px;
}

#fbwwjyvtgz .gt_sourcenotes {
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

#fbwwjyvtgz .gt_sourcenote {
  font-size: 90%;
  padding: 4px;
}

#fbwwjyvtgz .gt_left {
  text-align: left;
}

#fbwwjyvtgz .gt_center {
  text-align: center;
}

#fbwwjyvtgz .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#fbwwjyvtgz .gt_font_normal {
  font-weight: normal;
}

#fbwwjyvtgz .gt_font_bold {
  font-weight: bold;
}

#fbwwjyvtgz .gt_font_italic {
  font-style: italic;
}

#fbwwjyvtgz .gt_super {
  font-size: 65%;
}

#fbwwjyvtgz .gt_footnote_marks {
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
<td class="gt_row gt_left">The introduction is self-contained and tells a reader everything they need to know including: 1) broader context to motivate; 2) some detail about what the paper is about; 3) a clear gap that needs to be filled; 4) what was done; 5) what was found; 6) why it is important; 7) the structure of the paper. A reader should be able to read only the introduction and know what was done, why, and what was found. Likely 3 or 4 paragraphs, or 10 per cent of total.</td></tr>
    <tr><td class="gt_row gt_left">Data</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 2 - 'Many issues'; 4 - 'Some issues'; 6 - 'Good'; 8 - 'Great'; 10 - 'Exceptional'</td>
<td class="gt_row gt_left">A sense of the dataset should be communicated to the reader. All variables should be thoroughly examined and explained. Explain if there were similar datasets that could have been used and why they were not. If variables were constructed then this should be mentioned, and high-level cleaning aspects of note should be mentioned, but this section should focus on the destination, not the journey. It is important to understand what the variables look like by including graphs, and possibly tables, of all observations, along with discussion of those graphs and the other features of these data. Summary statistics should also be included, and well as any relationships between the variables. If this becomes too detailed, then appendices could be used.</td></tr>
    <tr><td class="gt_row gt_left">Results</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 2 - 'Many issues'; 4 - 'Some issues'; 6 - 'Good'; 8 - 'Great'; 10 - 'Exceptional'</td>
<td class="gt_row gt_left">Results will likely require summary statistics, tables, graphs, images, and possibly statistical analysis or maps. There should also be text associated with all these aspects. Show the reader the results by plotting them where possible. Talk about them. Explain them. That said, this section should strictly relay results. Regression tables must not contain stars.</td></tr>
    <tr><td class="gt_row gt_left">Discussion</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 2 - 'Many issues'; 4 - 'Some issues'; 6 - 'Good'; 8 - 'Great'; 10 - 'Exceptional'</td>
<td class="gt_row gt_left">Some questions that a good discussion would cover include (each of these would be a sub-section of something like half a page to a page): What is done in this this paper? What is something that we learn about the world? What is another thing that we learn about the world? What are some weaknesses of what was done? What is left to learn or how should we proceed in the future?</td></tr>
    <tr><td class="gt_row gt_left">Cross-references</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 2 - 'Yes'</td>
<td class="gt_row gt_left">All figures, tables, and equations, should be numbered, and referred to in the text using cross-references.</td></tr>
    <tr><td class="gt_row gt_left">Prose</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 2 - 'Yes'</td>
<td class="gt_row gt_left">All aspects of submission should be free of noticeable typos, spelling mistakes, and be grammatically correct. Prose should be coherent, concise, and clear.</td></tr>
    <tr><td class="gt_row gt_left">Graphs/tables/etc</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 1 - 'Gets job done'; 2 - 'Fine'; 3 - 'Great'; 4 - 'Exceptional'</td>
<td class="gt_row gt_left">Graphs and tables must be included in the paper and should be to well-formatted, clear, and digestible. They should: 1) serve a clear purpose; 2) be fully self-contained through appropriate use of captions and sub-captions; 3) appropriately sized and colored; and 4) have appropriate significant figures, in the case of tables.</td></tr>
    <tr><td class="gt_row gt_left">Survey</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 2 - 'Many issues'; 4 - 'Some issues'; 6 - 'Good'; 8 - 'Great'; 10 - 'Exceptional'</td>
<td class="gt_row gt_left">The survey should have an introductory section and include the details of a contact person. The survey questions should be well constructed and appropriate to the task. The questions should have an appropriate ordering. A final section should thank the respondent.</td></tr>
    <tr><td class="gt_row gt_left">Reference list</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 3 - 'One minor issue'; 4 - 'Perfect'</td>
<td class="gt_row gt_left">All data, software, literature, and any other relevant material, should be cited in-text and included in a reference list made using BibTeX. A few lines of code from Stack Overflow or similar, would be acknowledged just with a comment in the script immediately preceding the use of the code rather than here. But larger chunks of code should be fully acknowledged with an in-text citation and appear in the reference list.</td></tr>
    <tr><td class="gt_row gt_left">GitHub usage</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 2 - 'Excellent'</td>
<td class="gt_row gt_left">There are at least two different commits, and they have meaningful commit messages.</td></tr>
    <tr><td class="gt_row gt_left">Simulation</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 1 - 'Gets job done'; 2 - 'Fine'; 3 - 'Great'; 4 - 'Exceptional'</td>
<td class="gt_row gt_left">The script is clearly commented and structured. All variables are appropriately simulated.</td></tr>
    <tr><td class="gt_row gt_left">Reproducibility</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 1 - 'Gets job done'; 2 - 'Fine'; 3 - 'Great'; 4 - 'Exceptional'</td>
<td class="gt_row gt_left">The paper and analysis should be fully reproducible. The repo should have a detailed README. All code should be thoroughly documented. An R project should be used. Code should be used to do all steps including appropriately read data, prepare it, create plots, conduct analysis, and generate documents. Seeds should be used where needed. Code should have a preamble and be well-documented including comments and layout. The repo should be appropriately organized and not contain extraneous files. setwd() and hard coded file paths must not be used.</td></tr>
    <tr><td class="gt_row gt_left">General excellence</td>
<td class="gt_row gt_left">0 - 'None'; 1 - 'Huh, that's interesting'; 2 - 'Wow'; 3 - 'Exceptional'</td>
<td class="gt_row gt_left">There are always students that excel in a way that is not anticipated in the rubric. This item accounts for that.</td></tr>
  </tbody>
  
  
</table>
</div>
```

### Previous examples

<!-- Some examples of papers that well in the past include those by:  -->

[Chyna Hui and Marco Chau](inputs/pdfs/paper_three-2022-hui_chau.pdf).


\newpage




## Paper Four

### Task

- Working as part of a team of one to three people, and in an entirely reproducible way, please convert 
one full-page table from 
one DHS Program 'Final Report', from the 1980s or 1990s, as available [here](https://dhsprogram.com/search/index.cfm?_srchd=1&bydoctype=publication&bypubtype=26%2C5%2C39%2C30%2C21%2C100&byyear=1999&byyear=1998&byyear=1997&byyear=1996&byyear=1995&byyear=1994&byyear=1993&byyear=1992&byyear=1991&byyear=1990&byyear=1989&byyear=1988&byyear=1987&bylanguage=2), 
into a usable dataset, then write a short paper telling a story with the data.
- Create a well-organized folder with appropriate sub-folders, and add it to GitHub. You are welcome to use this [starter folder](https://github.com/RohanAlexander/starter_folder).
- Create and document a dataset:
  - Save the PDF to 'inputs'.
  - Put together a simulation of your plan for the usable dataset and save the script to 'scripts/00-simulation.R'.
  - Write R code, saved as 'scripts/01-gather_data.R', to either OCR or parse the PDF, as appropriate, and save the output to 'outputs/data/raw_data.csv'.
  - Write R code, saved as 'scripts/02-clean_and_prepare_data.R', that draws on 'raw_data.csv' to clean and prepare the dataset. Use `pointblank` to put together tests that the dataset passes (at a minimum, every variable should have a test for class and another for content). Save the dataset to 'outputs/data/cleaned_data.csv'.
  - Following @gebru2021datasheets, put together a data sheet for the dataset you put together (put this in the appendix of your paper). You are welcome to start from the template 'inputs/data/datasheet_template.Rmd' in the starter folder, although, again, you should add it to the appendix of your paper, rather than a stand-alone document.
- Use the dataset to tell a story by using R Markdown to prepare a PDF with these sections: title, author, date, abstract, introduction, data, results, discussion, an appendix that will, at least, contain a datasheet for the dataset, and references.
  - In addition to conveying a sense of the dataset of interest, the data section should include details of the methodology used by the DHS you used, and its key features, strengths, and weaknesses. 
- Submit a PDF of the paper. 
- There should be no evidence that this is a class paper.


### Checks

- Use GitHub in a well-developed way by making at least a few commits and using descriptive commit messages.

<!-- - In an appendix there is both a link to the supplementary survey and the details of it, including questions (in case the link fails, and to make the paper self-contained). -->
 

### FAQ

<!-- - What should I focus on? You may focus on any year, aspect, or geography that is reasonable given the focus and constraints of the general social survey that you are interested in. Please consider the year and topics that you are interested in together, as some surveys focus on particular topics in some years. -->
<!-- - Do I need to include the raw GSS data in the repo? For most of the general social surveys you will not have permission to share the GSS data. If that is the case, then you should add clear details in the README explaining how the data could be obtained. -->
<!-- - The Canadian GSS is available to University of Toronto students via the library. In order to use it you need to clean and prepare it. Code to do this for one year is being distributed alongside this problem set and was discussed in lectures.  -->
<!-- - You are welcome to simply use this code and this year, but the topic of that year will constrain your focus. Naturally, you are welcome to adapt the code to other years. If you use the code exactly as is then you must cite it. If you adapt the code then you don't have to cite it, as it has a MIT license, but it would be appropriate to at least mention and acknowledge it, depending on how close your adaption is. -->


### Rubric


```{=html}
<div id="hqwjzawrdh" style="overflow-x:auto;overflow-y:auto;width:auto;height:auto;">
<style>html {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
}

#hqwjzawrdh .gt_table {
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

#hqwjzawrdh .gt_heading {
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

#hqwjzawrdh .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}

#hqwjzawrdh .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 0;
  padding-bottom: 6px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}

#hqwjzawrdh .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#hqwjzawrdh .gt_col_headings {
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

#hqwjzawrdh .gt_col_heading {
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

#hqwjzawrdh .gt_column_spanner_outer {
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

#hqwjzawrdh .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#hqwjzawrdh .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#hqwjzawrdh .gt_column_spanner {
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

#hqwjzawrdh .gt_group_heading {
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

#hqwjzawrdh .gt_empty_group_heading {
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

#hqwjzawrdh .gt_from_md > :first-child {
  margin-top: 0;
}

#hqwjzawrdh .gt_from_md > :last-child {
  margin-bottom: 0;
}

#hqwjzawrdh .gt_row {
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

#hqwjzawrdh .gt_stub {
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

#hqwjzawrdh .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#hqwjzawrdh .gt_first_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
}

#hqwjzawrdh .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#hqwjzawrdh .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#hqwjzawrdh .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#hqwjzawrdh .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#hqwjzawrdh .gt_footnotes {
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

#hqwjzawrdh .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding: 4px;
}

#hqwjzawrdh .gt_sourcenotes {
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

#hqwjzawrdh .gt_sourcenote {
  font-size: 90%;
  padding: 4px;
}

#hqwjzawrdh .gt_left {
  text-align: left;
}

#hqwjzawrdh .gt_center {
  text-align: center;
}

#hqwjzawrdh .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#hqwjzawrdh .gt_font_normal {
  font-weight: normal;
}

#hqwjzawrdh .gt_font_bold {
  font-weight: bold;
}

#hqwjzawrdh .gt_font_italic {
  font-style: italic;
}

#hqwjzawrdh .gt_super {
  font-size: 65%;
}

#hqwjzawrdh .gt_footnote_marks {
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
<td class="gt_row gt_left">The introduction is self-contained and tells a reader everything they need to know including: 1) broader context to motivate; 2) some detail about what the paper is about; 3) a clear gap that needs to be filled; 4) what was done; 5) what was found; 6) why it is important; 7) the structure of the paper. A reader should be able to read only the introduction and know what was done, why, and what was found. Likely 3 or 4 paragraphs, or 10 per cent of total.</td></tr>
    <tr><td class="gt_row gt_left">Data</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 2 - 'Many issues'; 4 - 'Some issues'; 6 - 'Good'; 8 - 'Great'; 10 - 'Exceptional'</td>
<td class="gt_row gt_left">A sense of the dataset should be communicated to the reader. All variables should be thoroughly examined and explained. Explain if there were similar datasets that could have been used and why they were not. If variables were constructed then this should be mentioned, and high-level cleaning aspects of note should be mentioned, but this section should focus on the destination, not the journey. It is important to understand what the variables look like by including graphs, and possibly tables, of all observations, along with discussion of those graphs and the other features of these data. Summary statistics should also be included, and well as any relationships between the variables. If this becomes too detailed, then appendices could be used.</td></tr>
    <tr><td class="gt_row gt_left">Results</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 2 - 'Many issues'; 4 - 'Some issues'; 6 - 'Good'; 8 - 'Great'; 10 - 'Exceptional'</td>
<td class="gt_row gt_left">Results will likely require summary statistics, tables, graphs, images, and possibly statistical analysis or maps. There should also be text associated with all these aspects. Show the reader the results by plotting them where possible. Talk about them. Explain them. That said, this section should strictly relay results. Regression tables must not contain stars.</td></tr>
    <tr><td class="gt_row gt_left">Discussion</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 2 - 'Many issues'; 4 - 'Some issues'; 6 - 'Good'; 8 - 'Great'; 10 - 'Exceptional'</td>
<td class="gt_row gt_left">Some questions that a good discussion would cover include (each of these would be a sub-section of something like half a page to a page): What is done in this this paper? What is something that we learn about the world? What is another thing that we learn about the world? What are some weaknesses of what was done? What is left to learn or how should we proceed in the future?</td></tr>
    <tr><td class="gt_row gt_left">Cross-references</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 2 - 'Yes'</td>
<td class="gt_row gt_left">All figures, tables, and equations, should be numbered, and referred to in the text using cross-references.</td></tr>
    <tr><td class="gt_row gt_left">Prose</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 2 - 'Yes'</td>
<td class="gt_row gt_left">All aspects of submission should be free of noticeable typos, spelling mistakes, and be grammatically correct. Prose should be coherent, concise, and clear.</td></tr>
    <tr><td class="gt_row gt_left">Graphs/tables/etc</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 1 - 'Gets job done'; 2 - 'Fine'; 3 - 'Great'; 4 - 'Exceptional'</td>
<td class="gt_row gt_left">Graphs and tables must be included in the paper and should be to well-formatted, clear, and digestible. They should: 1) serve a clear purpose; 2) be fully self-contained through appropriate use of captions and sub-captions; 3) appropriately sized and colored; and 4) have appropriate significant figures, in the case of tables.</td></tr>
    <tr><td class="gt_row gt_left">Reference list</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 3 - 'One minor issue'; 4 - 'Perfect'</td>
<td class="gt_row gt_left">All data, software, literature, and any other relevant material, should be cited in-text and included in a reference list made using BibTeX. A few lines of code from Stack Overflow or similar, would be acknowledged just with a comment in the script immediately preceding the use of the code rather than here. But larger chunks of code should be fully acknowledged with an in-text citation and appear in the reference list.</td></tr>
    <tr><td class="gt_row gt_left">GitHub usage</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 2 - 'Excellent'</td>
<td class="gt_row gt_left">There are at least two different commits, and they have meaningful commit messages.</td></tr>
    <tr><td class="gt_row gt_left">Simulation</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 1 - 'Gets job done'; 2 - 'Fine'; 3 - 'Great'; 4 - 'Exceptional'</td>
<td class="gt_row gt_left">The script is clearly commented and structured. All variables are appropriately simulated.</td></tr>
    <tr><td class="gt_row gt_left">Reproducibility</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 1 - 'Gets job done'; 2 - 'Fine'; 3 - 'Great'; 4 - 'Exceptional'</td>
<td class="gt_row gt_left">The paper and analysis should be fully reproducible. The repo should have a detailed README. All code should be thoroughly documented. An R project should be used. Code should be used to do all steps including appropriately read data, prepare it, create plots, conduct analysis, and generate documents. Seeds should be used where needed. Code should have a preamble and be well-documented including comments and layout. The repo should be appropriately organized and not contain extraneous files. setwd() and hard coded file paths must not be used.</td></tr>
    <tr><td class="gt_row gt_left">Datasheet</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 2 - 'Many issues'; 4 - 'Some issues'; 6 - 'Good'; 8 - 'Great'; 10 - 'Exceptional'</td>
<td class="gt_row gt_left">A thorough datasheet for the dataset that was constructed is included.</td></tr>
    <tr><td class="gt_row gt_left">General excellence</td>
<td class="gt_row gt_left">0 - 'None'; 1 - 'Huh, that's interesting'; 2 - 'Wow'; 3 - 'Exceptional'</td>
<td class="gt_row gt_left">There are always students that excel in a way that is not anticipated in the rubric. This item accounts for that.</td></tr>
  </tbody>
  
  
</table>
</div>
```



\newpage




<!-- ## Paper Five -->

<!-- ### Task -->

<!-- - Paper about causal inference. -->


<!-- - You must include a DAG (probably in the model section). -->


<!-- \newpage -->




## Paper Five

### Task

- Working as part of a team of one to three people, please forecast the popular vote of the 2020 US election using multilevel regression with post-stratification and then write a short paper telling a story. This requires individual-level survey data, post-stratification data, and a model that brings them together. Given the expense of collecting these data, and the privilege of having access to them, please be sure to properly cite all datasets that you use.
- Individual-level survey data:
    - Request access to the Democracy Fund + UCLA Nationscape ['Full Data Set'](https://www.voterstudygroup.org/data/nationscape). This could take a day or two. Please start early. 
    - Simulate the survey dataset that you will use, and save the script to 'scripts/00-simulation-survey.R'.
    - Once you have access then pick one survey of interest (they were conducted at different times).
    - This will be a large file and is not yours to share. Do not push it to GitHub. Use a .gitignore file to accomplish this. Instead document how to get the raw data in the README.
    - Clean and prepare the dataset based on what you need.
- Post-stratification data:
    - Create an account with [IPUMS](https://usa.ipums.org/usa/index.shtml) and then use this to access the American Community Surveys (ACS).
    - Simulate the post-stratification dataset that you will use, and save the script to 'scripts/00-simulation-poststratification.R'.
    - Pick an appropriate 1-year ACS (there is one every year). Then select some variables. This will depend on what you want to model and the survey data, but some options include: REGION, STATEICP, AGE, SEX, MARST, RACE, HISPAN, BPL, CITIZEN, EDUC, LABFORCE, or	INCTOT. Have a look around and see what you are interested in, remembering that you will need to establish a correspondence to the survey.
    - Download the relevant post-stratification data (it is probably easiest to change the data format to .dta).
    - Again, this will be a large file and is not yours to share. Do not push it to GitHub. Use a .gitignore file to accomplish this. Instead document how to get the raw data in the README.
    - Clean and prepare the post-stratification dataset. Remember that you need cell counts for the sub-populations in the model. 
- Modelling:
    - You will want to explain vote intention based on a variety of explanatory variables. The decision is yours, but you should probably use logistic regression. In that case, construct the vote intention variable so that it is binary (either 'supports Trump' or 'supports Biden'). In increasing level of complexity, you would then build a model using: `glm()`, `lme4::glmer()`, `rstanarm:: stan_glm`, or `brms::brm()`.
    - Think about model fit, diagnostics, and other similar aspects that you need to convince someone that the model is appropriate.
    - You have flexibility of the model that you use, (and hence the cells that you will need to create). In general, the more cells the better, but you may want fewer cells for simplicity in the writing process and to ensure a decent sample in each cell. It would be best to start with a simple model and then complicate it, rather than vice versa.
    - Apply the trained model to the post-stratification dataset to forecast the election result. The specifics will depend on your modelling approach but will likely involve `predict()`, `add_predicted_draws()`, or similar. The primary aspect of interest is the forecast distribution of the popular vote, and how the explanatory variables affect this. Strong submissions would go beyond that. 
- Write-up:
    - Create a well-organized folder with appropriate sub-folders, add it to GitHub, and then prepare a PDF using R Markdown with these sections (you are welcome to use this [starter folder](https://github.com/RohanAlexander/starter_folder)): title, author, date, abstract, introduction, data, model, results, discussion, and references. Use appendices for supporting, but not critical, material. 
      - In the model section, you should carefully spell out the statistical model that you are using, being sure to define and explain each aspect and why it is important. The model should be appropriately complex; that is, not inappropriately simple, but not unnecessarily complicated. The model should have well-defined variables and these should correspond to what is discussed in the data section. You should explain how the aspects discussed in the data section assert themselves in the modelling decisions that you made. The model should be written out in appropriate mathematical notation but also in plain English. Every aspect of that notation should be defined. The model should make sense based on the substantive area, and the form of the model. If the model is Bayesian, then priors should be defined and sensible. There should be explanation of how features enter the model and why. For instance, why use age rather than age-groups, why does province have a levels effect, why is gender categorical, etc? In general, there should be a clear justification that this is the model for the situation. The assumptions underpinning the model should be clearly discussed. Alternative models, or variants, should be discussed, and strengths and weaknesses made clear. Why was this model chosen? You should mention the software that you used to run the model. There should be evidence of thought about the circumstances in which the model may not be appropriate. There should be evidence of model validation and checking, whether that is out-of-sample, RMSE, a test/training split, or appropriate sensitivity checks. You should be clear about model convergence, model checks, and diagnostic issues. 
- Submit a PDF of your paper.
- There should be no evidence that this is a class assignment.

### Checks

- Use GitHub in a well-developed way by making at least a few commits and using descriptive commit messages.
- Do not include p-values, stars, or similar, in tables. If you invoke statistical significance, then you should draw on and integrate @fisherarrangement and others.

### FAQ

- How much should I write? Most students submit something in the 10-to-15-page range, but it is up to you. Be precise and thorough.


### Rubric


```{=html}
<div id="pbjkuwjtmf" style="overflow-x:auto;overflow-y:auto;width:auto;height:auto;">
<style>html {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
}

#pbjkuwjtmf .gt_table {
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

#pbjkuwjtmf .gt_heading {
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

#pbjkuwjtmf .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}

#pbjkuwjtmf .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 0;
  padding-bottom: 6px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}

#pbjkuwjtmf .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#pbjkuwjtmf .gt_col_headings {
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

#pbjkuwjtmf .gt_col_heading {
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

#pbjkuwjtmf .gt_column_spanner_outer {
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

#pbjkuwjtmf .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#pbjkuwjtmf .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#pbjkuwjtmf .gt_column_spanner {
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

#pbjkuwjtmf .gt_group_heading {
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

#pbjkuwjtmf .gt_empty_group_heading {
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

#pbjkuwjtmf .gt_from_md > :first-child {
  margin-top: 0;
}

#pbjkuwjtmf .gt_from_md > :last-child {
  margin-bottom: 0;
}

#pbjkuwjtmf .gt_row {
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

#pbjkuwjtmf .gt_stub {
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

#pbjkuwjtmf .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#pbjkuwjtmf .gt_first_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
}

#pbjkuwjtmf .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#pbjkuwjtmf .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#pbjkuwjtmf .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#pbjkuwjtmf .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#pbjkuwjtmf .gt_footnotes {
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

#pbjkuwjtmf .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding: 4px;
}

#pbjkuwjtmf .gt_sourcenotes {
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

#pbjkuwjtmf .gt_sourcenote {
  font-size: 90%;
  padding: 4px;
}

#pbjkuwjtmf .gt_left {
  text-align: left;
}

#pbjkuwjtmf .gt_center {
  text-align: center;
}

#pbjkuwjtmf .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#pbjkuwjtmf .gt_font_normal {
  font-weight: normal;
}

#pbjkuwjtmf .gt_font_bold {
  font-weight: bold;
}

#pbjkuwjtmf .gt_font_italic {
  font-style: italic;
}

#pbjkuwjtmf .gt_super {
  font-size: 65%;
}

#pbjkuwjtmf .gt_footnote_marks {
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
<td class="gt_row gt_left">The introduction is self-contained and tells a reader everything they need to know including: 1) broader context to motivate; 2) some detail about what the paper is about; 3) a clear gap that needs to be filled; 4) what was done; 5) what was found; 6) why it is important; 7) the structure of the paper. A reader should be able to read only the introduction and know what was done, why, and what was found. Likely 3 or 4 paragraphs, or 10 per cent of total.</td></tr>
    <tr><td class="gt_row gt_left">Data</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 2 - 'Many issues'; 4 - 'Some issues'; 6 - 'Good'; 8 - 'Great'; 10 - 'Exceptional'</td>
<td class="gt_row gt_left">A sense of the dataset should be communicated to the reader. All variables should be thoroughly examined and explained. Explain if there were similar datasets that could have been used and why they were not. If variables were constructed then this should be mentioned, and high-level cleaning aspects of note should be mentioned, but this section should focus on the destination, not the journey. It is important to understand what the variables look like by including graphs, and possibly tables, of all observations, along with discussion of those graphs and the other features of these data. Summary statistics should also be included, and well as any relationships between the variables. If this becomes too detailed, then appendices could be used.</td></tr>
    <tr><td class="gt_row gt_left">Model</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 2 - 'Many issues'; 4 - 'Some issues'; 6 - 'Good'; 8 - 'Great'; 10 - 'Exceptional'</td>
<td class="gt_row gt_left">The model should be nicely written out, well-explained, justified, and appropriate.</td></tr>
    <tr><td class="gt_row gt_left">Results</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 2 - 'Many issues'; 4 - 'Some issues'; 6 - 'Good'; 8 - 'Great'; 10 - 'Exceptional'</td>
<td class="gt_row gt_left">Results will likely require summary statistics, tables, graphs, images, and possibly statistical analysis or maps. There should also be text associated with all these aspects. Show the reader the results by plotting them where possible. Talk about them. Explain them. That said, this section should strictly relay results. Regression tables must not contain stars.</td></tr>
    <tr><td class="gt_row gt_left">Discussion</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 2 - 'Many issues'; 4 - 'Some issues'; 6 - 'Good'; 8 - 'Great'; 10 - 'Exceptional'</td>
<td class="gt_row gt_left">Some questions that a good discussion would cover include (each of these would be a sub-section of something like half a page to a page): What is done in this this paper? What is something that we learn about the world? What is another thing that we learn about the world? What are some weaknesses of what was done? What is left to learn or how should we proceed in the future?</td></tr>
    <tr><td class="gt_row gt_left">Cross-references</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 2 - 'Yes'</td>
<td class="gt_row gt_left">All figures, tables, and equations, should be numbered, and referred to in the text using cross-references.</td></tr>
    <tr><td class="gt_row gt_left">Prose</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 2 - 'Yes'</td>
<td class="gt_row gt_left">All aspects of submission should be free of noticeable typos, spelling mistakes, and be grammatically correct. Prose should be coherent, concise, and clear.</td></tr>
    <tr><td class="gt_row gt_left">Graphs/tables/etc</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 1 - 'Gets job done'; 2 - 'Fine'; 3 - 'Great'; 4 - 'Exceptional'</td>
<td class="gt_row gt_left">Graphs and tables must be included in the paper and should be to well-formatted, clear, and digestible. They should: 1) serve a clear purpose; 2) be fully self-contained through appropriate use of captions and sub-captions; 3) appropriately sized and colored; and 4) have appropriate significant figures, in the case of tables.</td></tr>
    <tr><td class="gt_row gt_left">Reference list</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 3 - 'One minor issue'; 4 - 'Perfect'</td>
<td class="gt_row gt_left">All data, software, literature, and any other relevant material, should be cited in-text and included in a reference list made using BibTeX. A few lines of code from Stack Overflow or similar, would be acknowledged just with a comment in the script immediately preceding the use of the code rather than here. But larger chunks of code should be fully acknowledged with an in-text citation and appear in the reference list.</td></tr>
    <tr><td class="gt_row gt_left">GitHub usage</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 2 - 'Excellent'</td>
<td class="gt_row gt_left">There are at least two different commits, and they have meaningful commit messages.</td></tr>
    <tr><td class="gt_row gt_left">Simulation</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 1 - 'Gets job done'; 2 - 'Fine'; 3 - 'Great'; 4 - 'Exceptional'</td>
<td class="gt_row gt_left">The script is clearly commented and structured. All variables are appropriately simulated.</td></tr>
    <tr><td class="gt_row gt_left">Reproducibility</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 1 - 'Gets job done'; 2 - 'Fine'; 3 - 'Great'; 4 - 'Exceptional'</td>
<td class="gt_row gt_left">The paper and analysis should be fully reproducible. The repo should have a detailed README. All code should be thoroughly documented. An R project should be used. Code should be used to do all steps including appropriately read data, prepare it, create plots, conduct analysis, and generate documents. Seeds should be used where needed. Code should have a preamble and be well-documented including comments and layout. The repo should be appropriately organized and not contain extraneous files. setwd() and hard coded file paths must not be used.</td></tr>
    <tr><td class="gt_row gt_left">General excellence</td>
<td class="gt_row gt_left">0 - 'None'; 1 - 'Huh, that's interesting'; 2 - 'Wow'; 3 - 'Exceptional'</td>
<td class="gt_row gt_left">There are always students that excel in a way that is not anticipated in the rubric. This item accounts for that.</td></tr>
  </tbody>
  
  
</table>
</div>
```

### Previous examples

[Alen Mitrovski, Xiaoyan Yang, Matthew Wankiewicz](inputs/pdfs/paper_five_2020-Mitrovski_Yang_Wankiewicz.pdf) (this paper received an 'Honorable Mention' in the ASA December 2020 Undergraduate Statistics Research Project competition.)

\newpage






## Final paper

### Task

- Working **individually** and in an entirely reproducible way please write a paper that involves original work to tell a story with data.
- Options include (pick one):
  - Develop a research question that is of interest to you based on your own interests, background, and expertise, then obtain or create a relevant dataset.
  - A reproduction, being sure to use the paper as a foundation rather than as an end-in-itself.
- Create a well-organized folder with appropriate sub-folders, add it to GitHub, and then prepare a PDF using R Markdown with these sections (you are welcome to use this [starter folder](https://github.com/RohanAlexander/starter_folder)): 
    - Title, date, author, keywords, abstract, introduction, data, model, results, discussion, appendix (optional, for supporting, but not critical, material), and a reference list. 
    - It must also include an enhancement, and this would either be contained, or linked to, in the appendix.


### Peer review submission 

- This is an initial 'submission' where you get comments and feedback on a draft. 
- Submit a PDF of your draft.
- The paper does not have to be finished at this point, but the following sections must be filled out: title, author, date, keywords, abstract, and introduction.
- All other sections must be present in the paper, but do not have to be filled out (e.g. you must have a 'Data' heading, but you do not need to have content in that section).
- To be clear, it is fine to later change any aspect of what you submit at this checkpoint.
- You will be awarded one percentage point just for submitting a draft that meets this minimum.
- There are no extensions possible for this submission because the following submission is dependent on this date.

### Conduct peer-review

- As an individual, you will randomly be assigned a handful of rough drafts to provide feedback. You have three days to provide feedback to your peers.
- If you provide feedback to one peer you will receive one percentage point, if you provide feedback to two peers you will receive two percentage points, etc.
- Your feedback must include at least five comments (meaningful and useful bullet points). These must be well-written and thoughtful.
- There are no extensions granted for this submission since the following submission is dependent on this date.
- Please remember that you are providing feedback here to help your colleagues. All comments should be professional and kind. It is challenging to receive criticism. Please remember that your goal here is to help your peers advance their writing/analysis.


### FAQ

- Can I work as part of a team? No. it is important that you have some work that is entirely your own. You really need your own work to show off for job applications etc.
- How much should I write? Most students submit something that has 10-to-16-pages of main content, with additional pages devoted to appendices, but it is up to you. Be precise and thorough.
- Do I have to submit an initial paper in order to do the peer-review? Yes.
- Can I use the same paper for the reproduction as in Paper 3? No.
- Can I use any model? You are welcome to use any model, but you need to thoroughly explain it and this can be difficult for more complicated models.

### Rubric


```{=html}
<div id="ynnmbqnogz" style="overflow-x:auto;overflow-y:auto;width:auto;height:auto;">
<style>html {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
}

#ynnmbqnogz .gt_table {
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

#ynnmbqnogz .gt_heading {
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

#ynnmbqnogz .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}

#ynnmbqnogz .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 0;
  padding-bottom: 6px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}

#ynnmbqnogz .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#ynnmbqnogz .gt_col_headings {
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

#ynnmbqnogz .gt_col_heading {
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

#ynnmbqnogz .gt_column_spanner_outer {
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

#ynnmbqnogz .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#ynnmbqnogz .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#ynnmbqnogz .gt_column_spanner {
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

#ynnmbqnogz .gt_group_heading {
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

#ynnmbqnogz .gt_empty_group_heading {
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

#ynnmbqnogz .gt_from_md > :first-child {
  margin-top: 0;
}

#ynnmbqnogz .gt_from_md > :last-child {
  margin-bottom: 0;
}

#ynnmbqnogz .gt_row {
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

#ynnmbqnogz .gt_stub {
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

#ynnmbqnogz .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#ynnmbqnogz .gt_first_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
}

#ynnmbqnogz .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#ynnmbqnogz .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#ynnmbqnogz .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#ynnmbqnogz .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#ynnmbqnogz .gt_footnotes {
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

#ynnmbqnogz .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding: 4px;
}

#ynnmbqnogz .gt_sourcenotes {
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

#ynnmbqnogz .gt_sourcenote {
  font-size: 90%;
  padding: 4px;
}

#ynnmbqnogz .gt_left {
  text-align: left;
}

#ynnmbqnogz .gt_center {
  text-align: center;
}

#ynnmbqnogz .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#ynnmbqnogz .gt_font_normal {
  font-weight: normal;
}

#ynnmbqnogz .gt_font_bold {
  font-weight: bold;
}

#ynnmbqnogz .gt_font_italic {
  font-style: italic;
}

#ynnmbqnogz .gt_super {
  font-size: 65%;
}

#ynnmbqnogz .gt_footnote_marks {
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
<td class="gt_row gt_left">The introduction is self-contained and tells a reader everything they need to know including: 1) broader context to motivate; 2) some detail about what the paper is about; 3) a clear gap that needs to be filled; 4) what was done; 5) what was found; 6) why it is important; 7) the structure of the paper. A reader should be able to read only the introduction and know what was done, why, and what was found. Likely 3 or 4 paragraphs, or 10 per cent of total.</td></tr>
    <tr><td class="gt_row gt_left">Data</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 2 - 'Many issues'; 4 - 'Some issues'; 6 - 'Good'; 8 - 'Great'; 10 - 'Exceptional'</td>
<td class="gt_row gt_left">A sense of the dataset should be communicated to the reader. All variables should be thoroughly examined and explained. Explain if there were similar datasets that could have been used and why they were not. If variables were constructed then this should be mentioned, and high-level cleaning aspects of note should be mentioned, but this section should focus on the destination, not the journey. It is important to understand what the variables look like by including graphs, and possibly tables, of all observations, along with discussion of those graphs and the other features of these data. Summary statistics should also be included, and well as any relationships between the variables. If this becomes too detailed, then appendices could be used.</td></tr>
    <tr><td class="gt_row gt_left">Model</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 2 - 'Many issues'; 4 - 'Some issues'; 6 - 'Good'; 8 - 'Great'; 10 - 'Exceptional'</td>
<td class="gt_row gt_left">The model should be nicely written out, well-explained, justified, and appropriate.</td></tr>
    <tr><td class="gt_row gt_left">Results</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 2 - 'Many issues'; 4 - 'Some issues'; 6 - 'Good'; 8 - 'Great'; 10 - 'Exceptional'</td>
<td class="gt_row gt_left">Results will likely require summary statistics, tables, graphs, images, and possibly statistical analysis or maps. There should also be text associated with all these aspects. Show the reader the results by plotting them where possible. Talk about them. Explain them. That said, this section should strictly relay results. Regression tables must not contain stars.</td></tr>
    <tr><td class="gt_row gt_left">Discussion</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 2 - 'Many issues'; 4 - 'Some issues'; 6 - 'Good'; 8 - 'Great'; 10 - 'Exceptional'</td>
<td class="gt_row gt_left">Some questions that a good discussion would cover include (each of these would be a sub-section of something like half a page to a page): What is done in this this paper? What is something that we learn about the world? What is another thing that we learn about the world? What are some weaknesses of what was done? What is left to learn or how should we proceed in the future?</td></tr>
    <tr><td class="gt_row gt_left">Cross-references</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 2 - 'Yes'</td>
<td class="gt_row gt_left">All figures, tables, and equations, should be numbered, and referred to in the text using cross-references.</td></tr>
    <tr><td class="gt_row gt_left">Prose</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 2 - 'Yes'</td>
<td class="gt_row gt_left">All aspects of submission should be free of noticeable typos, spelling mistakes, and be grammatically correct. Prose should be coherent, concise, and clear.</td></tr>
    <tr><td class="gt_row gt_left">Graphs/tables/etc</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 1 - 'Gets job done'; 2 - 'Fine'; 3 - 'Great'; 4 - 'Exceptional'</td>
<td class="gt_row gt_left">Graphs and tables must be included in the paper and should be to well-formatted, clear, and digestible. They should: 1) serve a clear purpose; 2) be fully self-contained through appropriate use of captions and sub-captions; 3) appropriately sized and colored; and 4) have appropriate significant figures, in the case of tables.</td></tr>
    <tr><td class="gt_row gt_left">Reference list</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 3 - 'One minor issue'; 4 - 'Perfect'</td>
<td class="gt_row gt_left">All data, software, literature, and any other relevant material, should be cited in-text and included in a reference list made using BibTeX. A few lines of code from Stack Overflow or similar, would be acknowledged just with a comment in the script immediately preceding the use of the code rather than here. But larger chunks of code should be fully acknowledged with an in-text citation and appear in the reference list.</td></tr>
    <tr><td class="gt_row gt_left">GitHub usage</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 2 - 'Excellent'</td>
<td class="gt_row gt_left">There are at least two different commits, and they have meaningful commit messages.</td></tr>
    <tr><td class="gt_row gt_left">Simulation</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 1 - 'Gets job done'; 2 - 'Fine'; 3 - 'Great'; 4 - 'Exceptional'</td>
<td class="gt_row gt_left">The script is clearly commented and structured. All variables are appropriately simulated.</td></tr>
    <tr><td class="gt_row gt_left">Reproducibility</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 1 - 'Gets job done'; 2 - 'Fine'; 3 - 'Great'; 4 - 'Exceptional'</td>
<td class="gt_row gt_left">The paper and analysis should be fully reproducible. The repo should have a detailed README. All code should be thoroughly documented. An R project should be used. Code should be used to do all steps including appropriately read data, prepare it, create plots, conduct analysis, and generate documents. Seeds should be used where needed. Code should have a preamble and be well-documented including comments and layout. The repo should be appropriately organized and not contain extraneous files. setwd() and hard coded file paths must not be used.</td></tr>
    <tr><td class="gt_row gt_left">Enhancements</td>
<td class="gt_row gt_left">0 - 'Poor or not done'; 1 - 'Gets job done'; 2 - 'Fine'; 3 - 'Great'; 4 - 'Exceptional'</td>
<td class="gt_row gt_left">You should pick at least one of the following and include it to enhance your submission: 1) A datasheet for the dataset; 2) A model card for the model; 3) A Shiny application; 4) An R package; or 5) API for the model.</td></tr>
    <tr><td class="gt_row gt_left">General excellence</td>
<td class="gt_row gt_left">0 - 'None'; 1 - 'Huh, that's interesting'; 2 - 'Wow'; 3 - 'Exceptional'</td>
<td class="gt_row gt_left">There are always students that excel in a way that is not anticipated in the rubric. This item accounts for that.</td></tr>
  </tbody>
  
  
</table>
</div>
```

### Previous examples

[Amy Farrow](inputs/pdfs/final_paper-2021-amy_farrow.pdf), 
[Annie Collins](inputs/pdfs/final_paper-2020-annie_collins.pdf), 
[Hong Shi](inputs/pdfs/final_paper-2021-hong_shi.pdf), 
[Jia Jia Ji](inputs/pdfs/final_paper-2021-jia_jia_ji.pdf),
[Laura Cline](inputs/pdfs/final_paper-2021-laura_cline.pdf), [Lorena Almaraz De La Garza](inputs/pdfs/final_paper-2021-lorena_almaraz_de_la_garza.pdf), and
[Rachael Lam](inputs/pdfs/final_paper-2021-rachael_lam.pdf).

