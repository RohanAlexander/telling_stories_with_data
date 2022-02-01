

# Papers

## Paper 1

### Task

Working individually and in an entirely reproducible way, please find a dataset of interest on Open Data Toronto -- https://open.toronto.ca -- and write a short paper telling a story about the data.


### Guidance

- Find a dataset of interest on [Open Data Toronto](https://open.toronto.ca) and download it in a reproducible way using `opendatatoronto` [@citeSharla]. 
- Create a folder with appropriate sub-folders, add it to GitHub, and then prepare a PDF using `R Markdown` with these sections (you are welcome to use this starter folder: https://github.com/RohanAlexander/starter_folder): 
    - title, 
    - author, 
    - date, 
    - abstract, 
    - introduction,
    - data, and 
    - references. 
- In the data section thoroughly and precisely discuss the source of the data and the bias this brings (ethical, statistical, and otherwise). Comprehensively describe and summarize the data using text and at least one graph and one table. Graphs must be made in `ggplot2` [@citeggplot] and tables must be made using `knitr` [@citeknitr] (with or without `kableExtra` [@citekableextra]). Graphs must show the actual data, or as close to it as possible, not summary statistics. Make sure to cross-reference graphs and tables.
- Add references by using a bib file. Be sure to reference R and any R packages you use, as well as the dataset. Check that you have referenced everything. Strong submissions will draw on related literature and would also reference those. There are various options in R Markdown for references style; just pick one that you are used to.
- Go back and write an introduction. This should be two or three paragraphs. The last paragraph should set out the remainder of the paper.
- Add an abstract. This should be three or four sentences. If your abstract is longer than four sentences, then you need to think a lot about whether it is too long. It may be fine (there are always exceptions) but you should probably have a good reason. Your abstract must tell the reader your top-level finding. What is the one thing that we learn about the world because of your paper? 
- Then add a descriptive title. 'Paper 1' is not descriptive and there should not be any sign this is a school paper.
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
- How much should I write? Most students submit something in the two-to-six-page range, but it's really up to you. Be precise and thorough.
- My data is about apartment blocks/NBA/League of Legends so there's no ethical or bias aspect, what do I do? Please re-read the readings to better understand bias and ethics. If you really cannot think of something, then it might be worth picking a different dataset.
- Can I use Python? No. If you already know Python then it doesn't hurt to learn another language.
- Why do I need to cite R, when I don't need to cite Word? R is a free statistical programming language with academic origins so it's appropriate to acknowledge the work of others. It's also important for reproducibility.

### Rubric

- Go/no-go #1: R is cited - [1 'Yes', 0 'No']
	- Both referred to in the main content and included in the reference list.
	- If not, no need to continue marking, just give paper 0 overall.
- Title - [2 'Exceptional', 1 'Yes', 0 'Poor or not done']
	- An informative title is included.
	- Tell the reader what your story is, don't waste their time. 
	- Ideally tell them what happens at the end of the story.
	- 'Problem Set X' is not an informative title. There should be no evidence this is a school paper.
- Author, date, and repo - [2 'Yes', 0 'Poor or not done']
	- The author, date of submission, and a link to a GitHub repo are clearly included. (The later likely, but not necessarily, through a statement such as: 'Code and data supporting this analysis is available at: LINK').
- Abstract - [4 'Exceptional', 3 'Great', 2 'Fine', 1 'Gets job done',  0 'Poor or not done']
	- An abstract is included and appropriately pitched to a general audience.
	- The abstract answers: 1) what was done, 2) what was found, and 3) why this matters (all at a high level).
- Introduction - [4 'Exceptional', 3 'Great', 2 'Fine', 1 'Gets job done',  0 'Poor or not done']
	- The introduction is self-contained and tells a reader everything they need to know, including putting it into a broader context.
	- Your introduction should provide a bit of broader context to motivate the reader, as well as providing a bit more detail about what you're interested in, what you did, what you found, why it's important, etc. 
	- A reader should be able to read only your introduction and have a good idea about the research that you carried out and what you found.
	- It would be rare that you would have tables or figures in your introduction (again there are always exceptions but think deeply about whether yours is one). 
	- It must outline the structure of the paper.
	- For instance (and this is just a rough guide) an introduction for a 10 page paper, should probably be about 3 or 4 paragraphs, or 10 per cent, but it depends on specifics.
- Data - [10 'Exceptional', 8 'Great', 6 'Good', 4 'Some issues', 2 'Many issues',  0 'Poor or not done']
	- When you discuss the dataset (in the data section) you should make sure to discuss at least:
  	1) The source of the data.
  	2) The methodology and approach that is used to collect and process the data.
  	3) The population, the frame, and the sample (as appropriate).
  	4) Information about how respondents were found. What happened to non-response?
  	5) What are the key features, strengths, and weaknesses about the source generally.
  - You should thoroughly discuss the variables in the dataset that you use. Are there any that are very similar that you nonetheless don't use? Did you construct any variables by combining various ones?
  - What do the data look like?
  - Plot the actual data that you're using (or as close as you can get to it).
  - Discuss these plots and the other features of these data.
	- These are just some of the issues strong submissions will consider. Show off your knowledge. If this becomes too detailed, then you should push some of this to footnotes or an appendix.
	- 'Exceptional' means that when I read your submission I learn something about the dataset that I don't learn from any other submission (within a reasonable measure of course).
- Numbering - [2 'Yes', 0 'Poor or not done']
	- All figures, tables, equations, etc are numbered and referred to in the text.
- Proofreading - [2 'Yes', 0 'Poor or not done']
	- All aspects of submission are free of noticeable typos.
- Graphs/tables/etc - [4 'Exceptional', 3 'Great', 2 'Fine', 1 'Gets job done',  0 'Poor or not done']
	- You must include graphs and tables in your paper and they must be to a high standard. 
	- They must be well formatted and camera-ready. They should be clear and digestible.
	- They must: 1) serve a clear purpose; 2) be fully self-contained through appropriate use of labels/explanations, etc; and 3) appropriately sized and colored (or appropriate significant figures in the case of stats).
- References - [4 'Perfect', 3 'One minor issue', 0 'Poor or not done']
	- All data/software/literature/etc are appropriately noted and cited.
	- You must cite the software and software packages that you use.
	- You must cite the datasets that you use.
	- You must cite literature that you refer to (and you should refer to literature).
	- If you take a small chunk of code from Stack Overflow then add the page in a comment next to the code.
	- If you take a large chunk of code then cite it fully.
	- 3 means one minor issue. More than one minor issue receives 0.
- Reproducibility - [4 'Exceptional', 3 'Great', 2 'Fine', 1 'Gets job done',  0 'Poor or not done']
	- The paper and analysis must be fully reproducible.
	- A detailed README is included.
	- All code should be thoroughly documented.
	- An R project is used. Do not use `setwd()`.
	- The code must appropriately read data, prepare it, create plots, conduct analysis, and generate documents. Seeds are used where needed.
	- Code must have a preamble etc.
	- You must appropriately document your scripts such that someone coming in could follow them.
	- Your repo must be thoroughly organized.
- General excellence - [3 'Exceptional', 2 'Wow', 1 'Huh, that's interesting',  0 'None']
  - There are always students that excel in a way that is not anticipated in the rubric. This item accounts for that.
  
  
### Previous examples

Some examples of papers that well in the past include those by: [Amy Farrow](inputs/pdfs/Mandatory_minimums-Amy_Farrow.pdf), [Morgaine Westin](inputs/pdfs/Mandatory_minimums-Morgaine_Westin.pdf), and [Rachel Lam](inputs/pdfs/Mandatory_minimums-Rachel_Lam.pdf).

\newpage




## Paper 2

### Task

- Working as part of a small team of 1-3 people, and in an entirely reproducible way, please pick a paper with code and data, published anytime since 2019, in an American Economic Association journal^[These journals are: 'American Economic Review', 'AER: Insights', 'AEJ: Applied Economics', 'AEJ: Economic Policy', 'AEJ: Macroeconomics', 'AEJ: Microeconomics', 'Journal of Economic Literature', 'Journal of Economic Perspectives', 'AEA Papers & Proceedings'.]: https://www.aeaweb.org/journals.
- Following the 'Guide for Accelerating Computational Reproducibility in the Social Sciences', please Conduct a replication of at least three graphs or tables using the Social Science Reproduction Platform: https://www.socialsciencereproduction.org. Submit the DOI of your replication.
- Then write a short paper as though the data and set-up were your own.

to reproduce from an approved list and then write a short paper telling a story based on this. Your story should both talk about the (reproduced) findings, but also (a bit more 'meta') about what you learnt from the process.  

### Guidance

- Working as part of a team of 1-3 people, prepare a PDF in R Markdown with the following features: 
    - title, 
    - author/s, 
    - date, 
    - abstract, 
    - introduction, 
    - data, 
    - model, 
    - results, 
    - discussion, and 
    - references. 
- In the discussion section and any other relevant section, please be sure to discuss ethics and bias with reference to relevant literature.
- You should follow the lead of the author/s of the paper you're reproducing, but thoroughly think about, and discuss, what is being done. Regardless of the particular model that you are using, and the (possibly lack of) extent to which this is done in the paper, your model must be well explained, thoroughly justified, explained as appropriate to the task at hand, and the results must be beautifully described.
- You must include a DAG (probably in the model section).
- You must have a discussion of power and experimental design (probably in the data section)
- Your paper must be well-written, draw on relevant literature, and show your statistical skills by explaining all statistical concepts that you draw on. 
- You are welcome to use appendices for supporting, but not critical, material. Your discussion must include sub-sections that focus on three or four interesting points, and also sub-sections on weaknesses and next steps.
- In your report you must provide a link to a GitHub repo that fully contains your analysis. Your code must be entirely reproducible, documented, and readable. Your repo must be well-organised and appropriately use folders.
- Your graphs and tables must be of an incredibly high standard. Graphs and tables should be well formatted and report-ready. They should be clean and digestible. Furthermore, you should label and describe each table/figure.
- When you discuss the dataset (in the data section) you should make sure to discuss (at least): 
  - Its key features, strengths, and weaknesses generally. 
  - A discussion of the questionnaire - what is good and bad about it? 
  - A discussion of the methodology including how they find people to take the survey; what their population, frame, and sample were; what sampling approach they took and what some of the trade-offs may be; what they do about non-response; the cost. 
  - A discussion of the intervention and experimental design.
  - These are just some of the issues strong submissions will consider. Show off your knowledge. If this becomes too detailed then you should push some of this to footnotes or an appendix. 
- When you discuss your model (in the model section), you must be extremely careful to spell out the statistical model that you are using, defining and explaining each aspect and why it is important. (For a Bayesian model, a discussion of priors and regularization is almost always important.) You should mention the software that you used to run the model. You should be clear about model convergence, model checks, and diagnostic issues. How do the sampling and survey aspects that you discussed assert themselves in the modelling decisions that you make? Again, if it becomes too detailed then push some of the details to footnotes or an appendix. You have the original paper to guide you, but you will likely need to go well-beyond what is included.
- You should present model results, graphs, figures, etc, in the results section. This section should strictly relay results. Interpretation of these results and conclusions drawn from the results should be left for the discussion section.
- Your discussion should focus on your model results. Interpret them and explain what they mean. Put them in context. What do we learn about the world having understood your model and its results? What caveats could apply? To what extent does your model represent the small world and the large world (to use the language of McElreath, Ch 2)? What are some weaknesses and opportunities for future work? Additionally, as this is a reproduction you should include a sub-section on differences you found and difficulties that you had.
- Check that you have referenced everything. Strong submissions will draw on related literature in the discussion (and other sections) and would be sure to also reference those. The style of references does not matter, provided it is consistent.
- As a team, via Quercus, submit a PDF of your paper. Again, in your paper you must have a link to the associated GitHub repo. And you must include the R Markdown file that produced the PDF in that repo. And you must include the R Markdown file that produced the PDF in that repo. The repo must be well-organized and have a detailed README.
- A good way to work as a team would be to split up the work, so that one person is doing each section. The people doing the sections that rely on data (such as the analysis and the graphs) could just simulate it while they are waiting for the person putting together the data to finish.
- It is expected that your submission be well written and able to be understood by the average reader of say 538. This means that you are allowed to use mathematical notation, but you must be able to explain it all in plain English. Similarly, you can (and hint: you should) use survey, sampling, observational, and statistical terminology, but again you need to explain it. Your work should have flow and should be easy to follow and understand. To communicate well, anyone at the university level should be able to read your report once and relay back the methodology, overall results, findings, weaknesses and next steps without confusion. 
- Everyone in the team receives the same mark.
- There should be no evidence that this is a class assignment.


### Checks

- We have not just copy-pasted the code from the original paper, but instead have used that as a foundation to work from?

### FAQ

- Can we switch groups for the third paper? Yes.
- How much should I write? Most students submit something in the 10-to-15-page range, but it's really up to you. Be precise and thorough.
- My paper doesn't have a DAG, what do I do? You need to make the DAG.


### Rubric

- Go/no-go #1: R is cited - [1 'Yes', 0 'No']
	- Both referred to in the main content and included in the reference list.
	- If not, no need to continue marking, just give paper 0 overall.
- Title - [2 'Exceptional', 1 'Yes', 0 'Poor or not done']
	- An informative title is included.
	- Tell the reader what your story is - don't waste their time. 
	- Ideally tell them what happens at the end of the story.
	- 'Problem Set X' is not an informative title. There should be no evidence this is a school paper.
- Author, date, and repo - [2 'Yes', 0 'Poor or not done']
	- The author, date of submission, and a link to a GitHub repo are clearly included. (The later likely, but not necessarily, through a statement such as: 'Code and data supporting this analysis is available at: LINK').
- Abstract - [4 'Exceptional', 3 'Great', 2 'Fine', 1 'Gets job done',  0 'Poor or not done']
	- An abstract is included and appropriately pitched to a general audience.
	- The abstract answers: 1) what was done, 2) what was found, and 3) why this matters (all at a high level).
	- If your abstract is longer than four sentences then you need to think a lot about whether it is too long. It may be fine (there are always exceptions) but you should probably have a good reason.
	- Your abstract must tell the reader your top-level finding. What is the one thing that we learn about the world because of your paper?
- Introduction - [4 'Exceptional', 3 'Great', 2 'Fine', 1 'Gets job done',  0 'Poor or not done']
	- The introduction is self-contained and tells a reader everything they need to know, including putting it into a broader context.
	- Your introduction should provide a bit of broader context to motivate the reader, as well as providing a bit more detail about what you're interested in, what you did, what you found, why it's important, etc. 
	- A reader should be able to read only your introduction and have a good idea about the research that you carried out. 
	- It would be rare that you would have tables or figures in your introduction (again there are always exceptions but think deeply about whether yours is one). 
	- It must outline the structure of the paper.
	- For instance (and this is just a rough guide) an introduction for a 10 page paper, should probably be about 3 or 4 paragraphs, or 10 per cent, but it depends on specifics.
- Data - [10 'Exceptional', 8 'Great', 6 'Good', 4 'Some issues', 2 'Many issues',  0 'Poor or not done']
  - You should thoroughly discuss the variables in the dataset that you use. Are there any that are very similar that you nonetheless don't use? Did you construct any variables by combining various ones?
  - What do the data look like?
  - Plot the actual data that you're using (or as close as you can get to it).
  - Discuss these plots and the other features of these data.
  - These are just some of the issues strong submissions will consider. Show off your knowledge. If this becomes too detailed, then you should push some of this to footnotes or an appendix.
  - 'Exceptional' means that when I read your submission I learn something about the dataset that I don't learn from any other submission (within a reasonable measure of course).
- Model - [10 'Exceptional', 8 'Great', 6 'Good', 4 'Some issues', 2 'Many issues',  0 'Poor or not done']
  - The model is nicely written out, well-explained, justified, and appropriate.
  - When you discuss your model you must be extremely careful to spell out the statistical model that you are using defining and explaining each aspect and why it is important. Failure to do this suggests you don't understand the model.
  - The model is appropriately complex - that is, not too simple, but not unnecessarily complicated.
  - The model has well-defined variables and these correspond to what is discussed in the data section.
  - The model needs to be written out in appropriate mathematical notation but also in plain English. 
  - Every aspect of that notation must be defined otherwise the most this section can receive is poor.
  - The model makes sense based on the substantive area, and also the form of the model.
  - If the model is Bayesian, then priors need to be defined and sensible.
  - Discussion needs to occur around how features enter the model and why. For instance, (and these are just examples) why use ages rather than age-groups, why does province have a levels effect, why is gender categorical, etc? 
  - In general, in order to be adequate, there needs to be a clear justification that this is the model for the situation.
  - The assumptions underpinning the model are clearly discussed.
  - Alternative models, or variants, must be discussed and strengths and weaknesses made clear. Why was this model chosen?
  - You should mention the software that you used to run the model.
  - There is some evidence of thought about the circumstances in which the model may not be appropriate.
  - There is evidence of model validation and checking, whether that is out of sample or comparison to a straw man or RMSE, test/training, or appropriate sensitivity checks.
  - You should be clear about model convergence, model checks, and diagnostic issues, but if this becomes too detailed then you could push some of this to an appendix. 
  - Great answers would discuss things such as, how do the aspects that you discussed in the data section assert themselves in the modelling decisions that you make. Again if it becomes too detailed then push some of the details to footnotes or an appendix.
  - Again, explain what your model is and what is going on with it.
- Results - [10 'Exceptional', 8 'Great', 6 'Good', 4 'Some issues', 2 'Many issues',  0 'Poor or not done']
  - Results will likely require summary statistics, tables, graphs, images, and possibly statistical analysis or maps. 
  - To be clear, you should also have text associated with all these aspects.
  - Show the reader the results by plotting them. Talk about them. Explain them. That said, this section should strictly relay results.
- Discussion - [10 'Exceptional', 8 'Great', 6 'Good', 4 'Some issues', 2 'Many issues', 0 'Poor or not done']
  - Some questions that a good discussion would cover include (each of these would be a sub-section of something like half a page to a page): 
    - What is done in this this paper? 
    - What is something that we learn about the world?
    - What is another thing that we learn about the world?
    - What are some weaknesses of what was done?
    - What is left to learn or how should we proceed in the future?
- Numbering - [2 'Yes', 0 'Poor or not done']
	- All figures, tables, equations, etc are numbered and referred to in the text.
- Proofreading - [2 'Yes', 0 'Poor or not done']
	- All aspects of submission are free of noticeable typos.
- Graphs/tables/etc - [4 'Exceptional', 3 'Great', 2 'Fine', 1 'Gets job done',  0 'Poor or not done']
	- You must include graphs and tables in your paper and they must be to a high standard. 
	- They must be well formatted and camera-ready They should be clear and digestible.
	- They must: 1) serve a clear purpose; 2) be fully self-contained through appropriate use of labels/explanations, etc; and 3) appropriately sized and coloured (or appropriate significant figures in the case of stats).
- References - [4 'Perfect', 3 'One minor issue', 0 'Poor or not done']
	- All data/software/literature/etc are appropriately noted and cited.
	- You must cite the software and software packages that you use.
	- You must cite the datasets that you use.
	- You must cite literature that you refer to (and you should refer to literature).
	- If you take a small chunk of code from Stack Overflow then add the page in a comment next to the code.
	- If you take a large chunk of code then cite it fully.
	- 3 means one minor issue. More than one minor issue receives 0.
- Reproducibility - [4 'Exceptional', 3 'Great', 2 'Fine', 1 'Gets job done',  0 'Poor or not done']
	- The paper and analysis must be fully reproducible.
	- A detailed README is included.
	- All code should be thoroughly documented.
	- An R project is used. Do not use `setwd()`.
	- The code must appropriately read data, prepare it, create plots, conduct analysis, generate documents, etc. Seeds are used where needed.
	- Code must have a preamble etc.
	- You must appropriately document your scripts such that someone coming in could follow them.
	- Your repo must be thoroughly organized and not contain extraneous files.
- General excellence - [3 'Exceptional', 2 'Wow', 1 'Huh, that's interesting',  0 'None']
  - There are always students that excel in a way that is not anticipated in the rubric. This item accounts for that.


### Previous examples

Some examples of papers that well in the past include those by: [Amy Farrow](inputs/pdfs/Farrow_Amy-replication_paper.pdf), [Laura Cline](inputs/pdfs/Cline_Laura-IndigenousWomenInPrison.pdf), [Hong Shi](inputs/pdfs/Shi_Hong-replication_paper.pdf), [Jia Jia Ji](inputs/pdfs/Jia_Jia_Ji-effect_of_DLL_ON_spanish_literacy_skills.pdf), and 
[Rachael Lam](inputs/pdfs/Lam_Rachael-final_paper.pdf).








## Paper 3

### Task

Please consider this scenario: 

> You are employed as a junior data scientist at Petit Poll - a Canadian polling company. Petit Poll has a contract with a 'client' - an Ontario government department - to provide them with advice. In particular, the client wants to understand the effect of COVID shut-downs on restaurant businesses and has asked Petit Poll to design an experiment about some aspect of this.

Working as part of a small team of 1-3 people, and in an entirely reproducible way, please decide on an intervention, and some measurement strategies, and then write a short paper telling a story about the effect.


### Guidance

- Working as part of a team of 1-3 people, prepare a PDF in R Markdown with the following features (you are welcome to use this starter folder: https://github.com/RohanAlexander/starter_folder): 
    - title, 
    - author/s, 
    - date, 
    - abstract, 
    - introduction, 
    - data,
    - discussion,
    - appendix with survey details, and 
    - references. 
- Decide on an intervention. Some aspects to address include:
  - How will it be designed and implemented?
  - What will be random about it?
  - How will you ensure the separation of treatment and non-treatment?
  - How long will it run?
- you will need to run surveys to gather information about your intervention. Decide on a survey methodology. Some aspects to address include: 
  - What is the population, frame, and sample? 
  - What sampling methods will you use and why? What are some of the statistical properties that the method brings to the table? 
  - How are you going to reach your desired respondents?
  - How much do you estimate this will cost?
  - What steps will you take to deal with non-response and how will non-response affect your survey? 
  - How are you going to protect respondent privacy? 
  - Remember to consider all of this in the context of your 'client' - for instance, what are they interested in?
- Develop a survey on a platform that was introduced in class, or another that you're familiar with. 
  - Be sure to test it yourselves. You will want to test this as much as possible, maybe even swap informally with another group?
- Now release the surveys into the (simulated) 'field'. 
  - Please do this by simulating an appropriate number of responses to your survey in R. 
  - Don't forget to simulate in relation to the intervention that you proposed. 
  - Do you need two, or even more, surveys (and hence multiple sets of simulated results)? 
- Show the results and discuss your 'findings'. Everything must be entirely reproducible.
- You may wish to scrape some data and/or use open data sources to appropriately parameterize your simulations. Don't forget to cite them when you do this.
- Use R Markdown to write a PDF report about all of this. Discuss your intervention, results and findings, your survey design and motivations, etc - all of it. You are writing a report that will eventually go to the client, so you must set the scene, and use language that demonstrates your command of statistical concepts but brings the reader along with you. Be sure to include graphs and tables and reference them in your discussion. Be sure to be clear about weaknesses and biases, and opportunities for future work. 
- Your report must be well written. You are allowed to, and should, use mathematical notation and statistical concepts, but you must explain all of it in plain language. Similarly, you can, and should, use experimental/survey/sampling/observational data terminology, but again, you need to explain it. 
- In the data section you should specify the intervention and data gathering methodology. You should also show your data, with tables and graphs as necessary. In addition to summaries, be sure to plot your raw data to the extent possible.
- Your graphs and tables must be of an incredibly high standard. Graphs and tables should be well formatted and report-ready. They should be clean and digestible. Furthermore, you should label and describe each table/figure/equation.
- In the discussion section and any other relevant section, please be sure to discuss ethics and bias with reference to relevant literature. For instance, think about who is and who is not in your dataset. What are the statistical and ethical implications of this? 
- Often folks struggle with the Discussion section of reports. For a 10 page report, we're looking for about 2-3 pages of content. Here's an example of sub-sections that you could include:
  - A sub-section containing a brief overview of the paper, and also how it fits into the literature and improves existing contributions.
  - Three sub-sections that detail the three main points that we learn about the world from the paper.
  - A sub-section on limitations, but discussed in a sophisticated way. So this means not just stating them, but explaining and justifying.
  - A sub-section on how it could be extended and future directions.
- Your client has stats graduates working for it who need to be impressed by the main content of the report, but also has people who barely know what an average is and these people need to be impressed also. 
- Check that you have referenced everything, including R, R packages, and datasets. Strong submissions will draw on related literature and would be sure to also reference those. The style of references does not matter - there are various options in R Markdown - provided it is consistent and that `bibtex` has been used.
- Via Quercus, submit your PDF report. You must provide a link to the GitHub repo where the code that you used for this assignment lives. Comment. Your. Code. Your entire workflow must be entirely reproducible. Your repo should be clearly organised, and a useful README included. You must include a separate R script that accomplishes something (probably the simulations makes sense). And you must include the R Markdown file that produced the PDF in that repo.
- Please be sure to include a link to your survey/s in your report and screenshots of the survey/s in the appendix of your report. 
- Everyone in the team receives the same mark.
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

- Can I work by myself? Yes. But I recommend forming a group and the workload for the course assumes you will work on the second and third paper as part of a group of four.
- Can we switch groups for the third paper? Yes.
- How can I find a group? I will randomly create groups of four in Quercus. You are welcome to shift out of those groups and form your own groups if you'd like.
- Can I get a different mark to the rest of my group? No. Everyone in the group gets the same mark.
- I wrote my paper by myself, so can I be graded on a different scale? No. All papers are graded in the same way.
- How much should I write? Most students submit something in the 10-to-15-page range, but it's really up to you. Be precise and thorough.
- How do students collaborate successfully? Groups that split up the work typically seem to do the best. So one student worries about the survey, one about simulating and analysing data, and another about the write-up. If you're worried about using GitHub to collaborate, then just create different folders in GitHub to place your separate bits of work, and then have one person bring it together at the end.
- What intervention should we use? The intention is that you do something of interest to you. A well-written introduction would make the intervention clear.




### Rubric

- Go/no-go #1: R is cited - [1 'Yes', 0 'No']
	- Both referred to in the main content and included in the reference list.
	- If not, no need to continue marking, just give paper 0 overall.
- Title - [2 'Exceptional', 1 'Yes', 0 'Poor or not done']
	- An informative title is included.
	- Tell the reader what your story is - don't waste their time. 
	- Ideally tell them what happens at the end of the story.
	- 'Problem Set X' is not an informative title. There should be no evidence this is a school paper.
- Author, date, and repo - [2 'Yes', 0 'Poor or not done']
	- The author, date of submission, and a link to a GitHub repo are clearly included. (The later likely, but not necessarily, through a statement such as: 'Code and data supporting this analysis is available at: LINK').
- Abstract - [4 'Exceptional', 3 'Great', 2 'Fine', 1 'Gets job done',  0 'Poor or not done']
	- An abstract is included and appropriately pitched to a general audience.
	- The abstract answers: 1) what was done, 2) what was found, and 3) why this matters (all at a high level).
	- If your abstract is longer than four sentences then you need to think a lot about whether it is too long. It may be fine (there are always exceptions) but you should probably have a good reason.
	- Your abstract must tell the reader your top-level finding. What is the one thing that we learn about the world because of your paper?
- Introduction - [4 'Exceptional', 3 'Great', 2 'Fine', 1 'Gets job done',  0 'Poor or not done']
	- The introduction is self-contained and tells a reader everything they need to know, including putting it into a broader context.
	- Your introduction should provide a bit of broader context to motivate the reader, as well as providing a bit more detail about what you're interested in, what you did, what you found, why it's important, etc. 
	- A reader should be able to read only your introduction and have a good idea about the research that you carried out. 
	- It would be rare that you would have tables or figures in your introduction (again there are always exceptions but think deeply about whether yours is one). 
	- It must outline the structure of the paper.
	- For instance (and this is just a rough guide) an introduction for a 10 page paper, should probably be about 3 or 4 paragraphs, or 10 per cent, but it depends on specifics.
- Data - [10 'Exceptional', 8 'Great', 6 'Good', 4 'Some issues', 2 'Many issues',  0 'Poor or not done']
  - The survey has a clear, detailed, and justified methodology that has been thoroughly discussed. The statistical basis for the approach that is used is clear.
	  - It would achieve the aims of the report. 
	  - Population, frame, sample, and other key aspects are described. 
	  - There is a detailed plan for reaching respondents.
	  - Cost is discussed and appropriate. 
	  - Non-response is discussed and a plan for dealing with it clearly articulated. 
	  - There is clear respect for the survey respondents.
  - When you discuss the dataset (that you have likely largely simulated) you should make sure to discuss at least:
	  - The source of the data.
	  - The methodology and approach that is used to collect and process the data.
	  - The population, the frame, and the sample (as appropriate).
	  - Information about how respondents were found. What happened to non-response?
	  - What are the key features, strengths, and weaknesses about the survey generally.
  - You should thoroughly discuss the variables in the dataset that you use. Are there any that are very similar that you nonetheless don't use? Did you construct any variables by combining various ones?
  - What do the data look like?
  - Plot the actual data that you're using (or as close as you can get to it).
  - Discuss these plots and the other features of these data.
  - These are just some of the issues strong submissions will consider. Show off your knowledge. If this becomes too detailed, then you should push some of this to footnotes or an appendix.
  - 'Exceptional' means that when I read your submission I learn something about the dataset that I don't learn from any other submission (within a reasonable measure of course).
- Discussion - [10 'Exceptional', 8 'Great', 6 'Good', 4 'Some issues', 2 'Many issues', 0 'Poor or not done']
  - Some questions that a good discussion would cover include: 
    - What is done in this this paper? 
    - What are the main points that we learn about the world?
    - What are some weaknesses of what was done?
    - What is left to learn?
- Details of the survey - [6 'Exceptional', 5 'Great', 4 'Good', 3 'Some issues', 2 'Many issues', 0 'Poor or not done']
  - A working link to survey is included in the appendix.
  - Screenshots or at least the survey questions are included in the appendix.
	- The survey has been well put together.
	- The number and length of the questions is appropriate. 
	- The question type and potential answers are appropriate. 
	- It is clear how this survey could accomplish the aims of the report.
	- The questions flow in an appropriate way.
- The simulation of survey responses is appropriate to the survey and the scenario - [4 'Exceptional', 3 'Great', 2 'Fine', 1 'Gets job done',  0 'Poor or not done']
	- It has been done in a reproducible way and either contained in a separate R file, or is in the report appendix.
- Numbering - [2 'Yes', 0 'Poor or not done']
	- All figures, tables, equations, etc are numbered and referred to in the text.
- Proofreading - [2 'Yes', 0 'Poor or not done']
	- All aspects of submission are free of noticeable typos.
- Graphs/tables/etc - [4 'Exceptional', 3 'Great', 2 'Fine', 1 'Gets job done',  0 'Poor or not done']
	- You must include graphs and tables in your paper and they must be to a high standard. 
	- They must be well formatted and camera-ready They should be clear and digestible.
	- They must: 1) serve a clear purpose; 2) be fully self-contained through appropriate use of labels/explanations, etc; and 3) appropriately sized and coloured (or appropriate significant figures in the case of stats).
- References - [4 'Perfect', 3 'One minor issue', 0 'Poor or not done']
	- All data/software/literature/etc are appropriately noted and cited.
	- You must cite the software and software packages that you use.
	- You must cite the datasets that you use.
	- You must cite literature that you refer to (and you should refer to literature).
	- If you take a small chunk of code from Stack Overflow then add the page in a comment next to the code.
	- If you take a large chunk of code then cite it fully.
	- 3 means one minor issue. More than one minor issue receives 0.
- Reproducibility - [4 'Exceptional', 3 'Great', 2 'Fine', 1 'Gets job done',  0 'Poor or not done']
	- The paper and analysis must be fully reproducible.
	- A detailed README is included.
	- All code should be thoroughly documented.
	- An R project is used. Do not use `setwd()`.
	- The code must appropriately read data, prepare it, create plots, conduct analysis, generate documents, etc. Seeds are used where needed.
	- Code must have a preamble etc.
	- You must appropriately document your scripts such that someone coming in could follow them.
	- Your repo must be thoroughly organized and not contain extraneous files.
- General excellence - [3 'Exceptional', 2 'Wow', 1 'Huh, that's interesting',  0 'None']
  - There are always students that excel in a way that is not anticipated in the rubric. This item accounts for that.














## Paper 4

### Task

Working in teams of one to four people, please consider this scenario:

- 'You are employed as a junior statistician at Petit Poll - a Canadian polling company. Petit Poll has a contract with a Canadian political party to provide them with monthly polling updates.'
- Working as part of a small team of 1-4 people, and in an entirely reproducible way, please write a short paper that tells the client a story about their standing.


### Recommended steps

- Please pick a political party that you are 'working for', and pick a geographic focus: 1) the overall election, 2) a particular province, or 3) a specific riding. 
- Then decide on a survey methodology (hint: p. 13 of Wu & Thompson provides a handy checklist). Some questions you should address include: 
- What is the population, frame, and sample? 
- What sampling methods will you use and why (e.g. you could choose SRSWOR, stratified, etc). What are some of the statistical properties that the method brings to the table (e.g. for SRSWOR you could discuss Wu & Thompson, Theorem 2.2, etc, as appropriate)? 
- How are you going to reach your desired respondents?
- How much do you estimate this will cost?
- What steps will you take to deal with non-response and how will non-response affect your survey? 
- How are you going to protect respondent privacy? 
- Remember to consider all of this in the context of your 'client' - for instance, who would be more interested in Alberta ridings: Bloc Québécois or the Conservatives? Who likely has more money to spend - the Liberals or the Greens?
- Develop a survey on a platform that was introduced in class. Be sure to test it yourselves. You will want to test this as much as possible, maybe even swap informally with another group?
- Now release the surveys into the (simulated) 'field'. Please do this by simulating an appropriate number of responses to your survey in R. Don't forget to simulate in relation to the survey methodology that you proposed. Show the results and discuss your 'findings'. Everything must be entirely reproducible. You may like to consider linking your survey 'responses' with other data such as the census or GSS.
- Use R Markdown to write a PDF report about all of this. Discuss your results and findings, your survey design and motivations, etc - all of it. You are writing a report that will eventually go to the 'client', so you must set the scene, and use language that demonstrates your command of statistical concepts but brings the reader along with you. Be sure to include graphs and tables and reference them in your discussion. Be sure to be clear about weaknesses and biases, and opportunities for future work. 
- Your report must be well written. You are allowed to, and should, use mathematical notation, but you must explain all of it in plain english. Similarly, you can, and should, use surveys/sampling/observational data terminology, but again, you need to explain it. 
- Your report must include at least the following aspects: title, date, authorship, non-technical executive summary, introduction, survey methodology, results, discussion, appendices that detail the survey, and references. Your 'client' has stats graduates working for it who need to be impressed by the main content of the report, but also has people who barely know what an average is and these people need to be impressed also. This is why your report should include a non-technical executive summary. In terms of length, this would typically be roughly 10 per cent of the report. It would be more detailed than an introduction, but still at a high level. 
- Your graphs must be of an extremely high standard.
- Check that you have referenced everything. Strong submissions will draw on related literature in the discussion and would be sure to also reference those. The style of references does not matter, provided it is consistent.
- Via Quercus, submit a link to your PDF report which is hosted on GitHub. At some point in the introduction to your report, you must provide a link to the GitHub repo where the code that you used for this assignment lives (Hint: Comment. Your. Code.). Your entire workflow must be entirely reproducible.
- Please be sure to include a link to your survey in your report and screenshots of the survey in the appendix of your report. 
- There should be no evidence that this is a class assignment.

### Checks

### FAQ







## Paper 5

### Task

- Working in teams of one to four people, and in an entirely reproducible way, please use the Canadian General Social Survey (GSS) and a regression model to tell a story. 


### Recommended steps

- Depending on your focus and background, you may like to use a Bayesian hierarchical model, but regardless of the particular model that you use it must be well explained, thoroughly justified, appropriate to the task at hand, and the results must be beautifully described.
- You may focus on any year, aspect, or geography that is reasonable given the focus and constraints of the GSS. As a reminder, the GSS 'program was designed as a series of independent, annual, cross-sectional surveys, each covering one topic in-depth.' So please consider the topic and the year.
- The GSS is available to University of Toronto students via the library. In order to use it you need to clean and prepare it. Code to do this for one year is being distributed alongside this problem set and was discussed in lectures. 
- You are welcome to simply use this code and this year, but the topic of that year will constrain your focus. Naturally, you are welcome to adapt the code to other years. If you use the code exactly as is then you must cite it. If you adapt the code then you don't have to cite it, as it has a MIT license, but it would be appropriate to at least mention and acknowledge it, depending on how close your adaption is.
- Using R Markdown, please write a paper about your analysis and compile it into a PDF.
- Your paper must be well-written, draw on relevant literature, and show your statistical skills by explaining all statistical concepts that you draw on. 
- Your paper must have the following sections: title, name/s, and date, abstract, introduction, data, model, results, discussion, and references. 
- You are welcome to use appendices for supporting, but not critical, material. Your discussion must include sub-sections on weaknesses and next steps.
- In your report you must provide a link to a GitHub repo that fully contains your analysis. Your code must be entirely reproducible, documented, and readable. Your repo must be well-organised and appropriately use folders.
- Your graphs and tables must be of an incredibly high standard. Graphs and tables should be well formatted and report-ready. They should be clean and digestible. Furthermore, you should label and describe each table/figure.
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



## Paper 6

### Task

- The primary goal of this paper is to predict the overall popular vote of the 2020 American presidential election using multilevel regression with post-stratification.

### Recommended steps

- We expect you to work as part of a group of 4 people, but groups of size 1-4 are fine. We have suggested a split of the work based on a 4-person group, but these are just suggestions.
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
    - Download the relevant post-stratification data (it's probably easiest to change the data format to .dta). Again, this can take some time. Please start this early. 
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
- (Again, it's probably efficient to start with simulated data/results while waiting) 
    - Write up.
    - Using R Markdown, please write a very thorough paper about your analysis and compile it into a PDF. 
    - The paper must be well-written, draw on relevant literature, and show your statistical skills by explaining all statistical concepts that you draw on. 
    - The paper must have the following sections: title, name/s, and date, abstract and keywords, introduction, data, model, results, discussion, and references. 
    - The paper may use appendices for supporting, but not critical, material. 
    - The discussion needs to be substantial. For instance, if the paper were 10 pages long then a discussion should be at least 2.5 pages. In the discussion, the paper must include subsections on weaknesses and next steps - but these must be in proportion.
    - The report must provide a link to a GitHub repo that contains everything (apart from the raw data that you git ignored because it is not yours to share). The code must be entirely reproducible, documented, and readable. The repo must be well-organised and appropriately use folders and README files.
    - The graphs and tables must be of an incredibly high standard, well formatted, and report-ready. They should be clean and digestible. Furthermore, you should label and describe each table/figure.
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









## Final paper

### Task

- Working individually, please conduct original research that applies methods from statistics to a question that involves an experiment. 


### Guidance

You have various options for topics (pick one):

  - Develop a research question that is of interest to you and obtain or create a relevant dataset. This option involves developing your own research question based on your own interests, background, and expertise. I encourage you to take this option, but please discuss your plans with me. How does one come up with ideas? One way is to be question-driven, where you keep an informal log of small ideas, questions, and puzzles, that you have as you're reading and working. Often, after dwelling on it for a while you can manage to find some questions of interest. Another way is to be data-driven - try to find some interesting dataset and then work backward. Finally, yet another way, is to be methods-driven - let's say that you happen to understand Gaussian processes, then just apply that expertise.
  - A replication exercise, being sure to use the paper as a foundation rather than as a ends-in-itself.

- You should know the expectations by now. If you need a refresher then review the past problem sets. But essentially: 
  - Everything is entirely reproducible. 
  - Your paper must be written in R Markdown.
  - Your paper must have the following sections:
    - Title, date, author, keywords, abstract, introduction, data, model, results, discussion, appendix (optional, for supporting, but not critical, material), and a reference list. 
  - Your paper must be well-written, draw on relevant literature, and show your statistical skills by explaining all statistical concepts that you draw on. 
  - The discussion needs to be substantial. For instance, if the paper were 10 pages long then a discussion should be at least 2.5 pages. In the discussion, the paper must include subsections on weaknesses and next steps - but these must be in proportion.
  - The report must provide a link to a GitHub repo that contains everything (apart from any raw data that you git ignored if it is not yours to share). The code must be entirely reproducible, documented, and readable. The repo must be well-organised and appropriately use folders and README files. 


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

- Do you have a causal story, or at least a sub-section in the discussion that talks about causality and why you cannot speak to it, or what you would do if you could?


### FAQ

- Can I work as part of a team? No. It's important that you have some work that is entirely your own. You really need your own work to show off for job applications etc.
- How much should I write? Most students submit something that has 10-to-16-pages of main content, with additional pages devoted to appendices, but it's really up to you. Be precise and thorough.




### Rubric

- Go/no-go #1: R is cited - [1 'Yes', 0 'No']
	- Both referred to in the main content and included in the reference list.
	- If not, no need to continue marking, just give paper 0 overall.
- Title - [2 'Exceptional', 1 'Yes', 0 'Poor or not done']
	- An informative title is included.
	- Tell the reader what your story is - don't waste their time. 
	- Ideally tell them what happens at the end of the story.
	- 'Problem Set X' is not an informative title. There should be no evidence this is a school paper.
- Author, date, and repo - [2 'Yes', 0 'Poor or not done']
	- The author, date of submission, and a link to a GitHub repo are clearly included. (The later likely, but not necessarily, through a statement such as: 'Code and data supporting this analysis is available at: LINK').
- Abstract - [4 'Exceptional', 3 'Great', 2 'Fine', 1 'Gets job done',  0 'Poor or not done']
	- An abstract is included and appropriately pitched to a general audience.
	- The abstract answers: 1) what was done, 2) what was found, and 3) why this matters (all at a high level).
	- If your abstract is longer than four sentences then you need to think a lot about whether it is too long. It may be fine (there are always exceptions) but you should probably have a good reason.
	- Your abstract must tell the reader your top-level finding. What is the one thing that we learn about the world because of your paper?
- Introduction - [4 'Exceptional', 3 'Great', 2 'Fine', 1 'Gets job done',  0 'Poor or not done']
	- The introduction is self-contained and tells a reader everything they need to know, including putting it into a broader context.
	- Your introduction should provide a bit of broader context to motivate the reader, as well as providing a bit more detail about what you're interested in, what you did, what you found, why it's important, etc. 
	- A reader should be able to read only your introduction and have a good idea about the research that you carried out. 
	- It would be rare that you would have tables or figures in your introduction (again there are always exceptions but think deeply about whether yours is one). 
	- It must outline the structure of the paper.
	- For instance (and this is just a rough guide) an introduction for a 10 page paper, should probably be about 3 or 4 paragraphs, or 10 per cent, but it depends on specifics.
- Data - [10 'Exceptional', 8 'Great', 6 'Good', 4 'Some issues', 2 'Many issues',  0 'Poor or not done']
  - You should thoroughly discuss the variables in the dataset that you use. Are there any that are very similar that you nonetheless don't use? Did you construct any variables by combining various ones?
  - What do the data look like?
  - Plot the actual data that you're using (or as close as you can get to it).
  - Discuss these plots and the other features of these data.
  - These are just some of the issues strong submissions will consider. Show off your knowledge. If this becomes too detailed, then you should push some of this to footnotes or an appendix.
  - 'Exceptional' means that when I read your submission I learn something about the dataset that I don't learn from any other submission (within a reasonable measure of course).
- Model - [10 'Exceptional', 8 'Great', 6 'Good', 4 'Some issues', 2 'Many issues',  0 'Poor or not done']
  - The model is nicely written out, well-explained, justified, and appropriate.
  - When you discuss your model you must be extremely careful to spell out the statistical model that you are using defining and explaining each aspect and why it is important. Failure to do this suggests you don't understand the model.
  - The model is appropriately complex - that is, not too simple, but not unnecessarily complicated.
  - The model has well-defined variables and these correspond to what is discussed in the data section.
  - The model needs to be written out in appropriate mathematical notation but also in plain English. 
  - Every aspect of that notation must be defined otherwise the most this section can receive is poor.
  - The model makes sense based on the substantive area, and also the form of the model.
  - If the model is Bayesian, then priors need to be defined and sensible.
  - Discussion needs to occur around how features enter the model and why. For instance, (and these are just examples) why use ages rather than age-groups, why does province have a levels effect, why is gender categorical, etc? 
  - In general, in order to be adequate, there needs to be a clear justification that this is the model for the situation.
  - The assumptions underpinning the model are clearly discussed.
  - Alternative models, or variants, must be discussed and strengths and weaknesses made clear. Why was this model chosen?
  - You should mention the software that you used to run the model.
  - There is some evidence of thought about the circumstances in which the model may not be appropriate.
  - There is evidence of model validation and checking, whether that is out of sample or comparison to a straw man or RMSE, test/training, or appropriate sensitivity checks.
  - You should be clear about model convergence, model checks, and diagnostic issues, but if this becomes too detailed then you could push some of this to an appendix. 
  - Great answers would discuss things such as, how do the aspects that you discussed in the data section assert themselves in the modelling decisions that you make. Again if it becomes too detailed then push some of the details to footnotes or an appendix.
  - Again, explain what your model is and what is going on with it.
- Results - [10 'Exceptional', 8 'Great', 6 'Good', 4 'Some issues', 2 'Many issues',  0 'Poor or not done']
  - Results will likely require summary statistics, tables, graphs, images, and possibly statistical analysis or maps. 
  - To be clear, you should also have text associated with all these aspects.
  - Show the reader the results by plotting them. Talk about them. Explain them. That said, this section should strictly relay results.
- Discussion - [10 'Exceptional', 8 'Great', 6 'Good', 4 'Some issues', 2 'Many issues', 0 'Poor or not done']
  - Some questions that a good discussion would cover include (each of these would be a sub-section of something like half a page to a page): 
    - What is done in this this paper? 
    - What is something that we learn about the world?
    - What is another thing that we learn about the world?
    - What are some weaknesses of what was done?
    - What is left to learn or how should we proceed in the future?
- Numbering - [2 'Yes', 0 'Poor or not done']
	- All figures, tables, equations, etc are numbered and referred to in the text.
- Proofreading - [2 'Yes', 0 'Poor or not done']
	- All aspects of submission are free of noticeable typos.
- Graphs/tables/etc - [4 'Exceptional', 3 'Great', 2 'Fine', 1 'Gets job done',  0 'Poor or not done']
	- You must include graphs and tables in your paper and they must be to a high standard. 
	- They must be well formatted and camera-ready They should be clear and digestible.
	- They must: 1) serve a clear purpose; 2) be fully self-contained through appropriate use of labels/explanations, etc; and 3) appropriately sized and coloured (or appropriate significant figures in the case of stats).
- References - [4 'Perfect', 3 'One minor issue', 0 'Poor or not done']
	- All data/software/literature/etc are appropriately noted and cited.
	- You must cite the software and software packages that you use.
	- You must cite the datasets that you use.
	- You must cite literature that you refer to (and you should refer to literature).
	- If you take a small chunk of code from Stack Overflow then add the page in a comment next to the code.
	- If you take a large chunk of code then cite it fully.
	- 3 means one minor issue. More than one minor issue receives 0.
- Reproducibility - [4 'Exceptional', 3 'Great', 2 'Fine', 1 'Gets job done',  0 'Poor or not done']
	- The paper and analysis must be fully reproducible.
	- A detailed README is included.
	- All code should be thoroughly documented.
	- An R project is used. Do not use `setwd()`.
	- The code must appropriately read data, prepare it, create plots, conduct analysis, generate documents, etc. Seeds are used where needed.
	- Code must have a preamble etc.
	- You must appropriately document your scripts such that someone coming in could follow them.
	- Your repo must be thoroughly organized and not contain extraneous files.
- Enhancements - [4 'Exceptional', 3 'Great', 2 'Fine', 1 'Gets job done',  0 'Poor or not done']
  - You should pick at least one of the following and include it to enhance your submission:
    - Datasheets for for your datasets (see: https://arxiv.org/abs/1803.09010) and model cards for your models (see: https://arxiv.org/pdf/1810.03993.pdf).
    - Shiny application.
    - R package.
    - API for your model.
  - There are always students that excel in a way that is not anticipated in the rubric. This item accounts for that.
- General excellence - [3 'Exceptional', 2 'Wow', 1 'Huh, that's interesting',  0 'None']
  - There are always students that excel in a way that is not anticipated in the rubric. This item accounts for that.



## 'What's next?'

### Task

Please work individually. In this paper, you will conduct original research that applies methods from statistics to a question involving surveys, sampling or observational data. 

### Recommended steps

You have various options for topics (pick one):
Develop a research question that is of interest to you and obtain or create a relevant dataset. This option involves developing your own research question based on your own interests, background, and expertise. I encourage you to take this option, but please discuss your plans with me. How does one come up with ideas? One way is to be question-driven, where you keep an informal log of small ideas, questions, and puzzles, that you have as you’re reading and working. Often, after dwelling on it for a while you can manage to find some questions of interest. Another way is to be data-driven - try to find some interesting dataset and then work backward. Finally, yet another way, is to be methods-driven - let’s say that you happen to understand Gaussian processes, then just apply that expertise.
(Thanks to Jack Bailey for this idea.) Build a MRP model based on the CES and a post-stratification dataset that you obtain, to identify how the 2019 Canadian Federal Election would have been different if 'everyone’ had voted. What do we learn about the importance of turnout based on your model and results? (This option involves logistic regression in either frequentist or Bayesian settings.)
Reproduce a paper. This means that you download the data and then write your own code (using their code and paper as a guide if it’s available) to try to get their results and then write up what you did and found. Options include: 
Angelucci, Charles, and Julia Cagé, 2019, 'Newspapers in times of low advertising revenues’, American Economic Journal: Microeconomics, please see: https://www.openicpsr.org/openicpsr/project/116438/version/V1/view. (This option can be accomplished with just OLS. It is a 'safe’ pick. I even already provided you with some code in class to get started - see the notes! ). 
Bailey, Michael A., Daniel J. Hopkins & Todd Rogers, 2016, 'Unresponsive and Unpersuaded: The Unintended Consequences of a Voter Persuasion Effort’, Political Behavior.
Clark, Sam, 2019, 'A General Age-Specific Mortality Model With an Example Indexed by Child Mortality or Both Child and Adult Mortality’, Demography, please see: https://github.com/sinafala/svd-comp. (This is an ambiguous pick!)
Skinner, Ben, 2019, 'Making the connection: Broadband access and online course enrollment at public open admissions institutions’, Research in Higher Education, please see: https://github.com/btskinner/oa_online_broadband_rep. 
Pons, Vincent, 2018, 'Will a Five-Minute Discussion Change Your Mind? A Countrywide Experiment on Voter Choice in France’ American Economic Review.
Valencia Caicedo, Felipe, 2019, 'The Mission: Human Capital Transmission, Economic Persistence, and Culture in South America’, The Quarterly Journal of Economics, please see: https://dataverse.harvard.edu/dataset.xhtml?persistentId=doi:10.7910/DVN/ML1155. 
If you have a favourite paper and want to reproduce it, then please let me know by the end of Week 12 so that I can check that it’s appropriate.
Pretend that you work for Upworthy. Request the Upworthy dataset and then use it to evaluate the result of an A/B test. This request could take a week. Please plan ahead if you choose this option.
Critique the following paper: AlShebli, Bedoor, Kinga Makovi & Talal Rahwan, 2020, 'The association between early career informal mentorship in academic collaborations and junior author performance’, Nature Communications. You should be able to download the data here: https://github.com/bedoor/Mentorship and the paper here: https://www.nature.com/articles/s41467-020-19723-8. For background and starting points for your critique, please see: https://statmodeling.stat.columbia.edu/2020/11/19/are-female-scientists-worse-mentors-this-study-pretends-to-know/ and https://danieleweeks.github.io/Mentorship/#summary. (This option involves extensive data exploration and thinking really hard about what they are trying to do and how they are doing it.) 
Use this post by Andrew Whitby - https://andrewwhitby.com/2020/11/24/contact-tracing-biased/ - as a starting point to explore biased sampling and its effects on what we know about COVID and how this affects public policy. (This option involves extensive simulation.)
In 'Bias Behind Bars’, data journalist Tom Cardoso finds that '(a)fter controlling for a number of variables, … Black and Indigenous inmates are more likely to get worse scores than white inmates, based solely on their race.’ 
The main story is here: https://www.theglobeandmail.com/canada/article-investigation-racial-bias-in-canadian-prison-risk-assessments/ 
The methodology discussion is here: https://www.theglobeandmail.com/canada/article-investigation-racial-bias-in-canadian-prisons-methodology/ 
The observational data is available here: https://www.theglobeandmail.com/files/editorial/News/nw-na-risk-1023/The_Globe_and_Mail_CSC_OMS_2012-2018_20201022235635.zip 
Your task is to follow the methodology that Tom published and attempt to replicate the results. Are you able to replicate them? Do the results change significantly under slightly different assumptions? (This option involves only frequentist logistic regression, although doing everything in a Bayesian setting would be lovely too).
You should know the expectations by now. If you need a refresher then review the past problem sets.
Everything is entirely reproducible. 
Your paper must be written in R Markdown.
Your paper must have the following sections:
Title, date, author, keywords, abstract, introduction, data, model, results, discussion, appendix (optional, for supporting, but not critical, material), and a reference list. 
Your paper must be well-written, draw on relevant literature, and show your statistical skills by explaining all statistical concepts that you draw on. 
The discussion needs to be substantial. For instance, if the paper were 10 pages long then a discussion should be at least 2.5 pages. In the discussion, the paper must include subsections on weaknesses and next steps - but these must be in proportion.
The report must provide a link to a GitHub repo that contains everything (apart from any raw data that you git ignored if it is not yours to share). The code must be entirely reproducible, documented, and readable. The repo must be well-organised and appropriately use folders and README files. 
My expectations for this paper are very high. I’m very excited to read what you submit. To help you achieve this standard, there are two initial 'submissions’ where you can get comments and feedback and then the final, actual, submission. 
Due dates:
(Optional) December 9 11:59pm ET
Submit initial materials for peer-review.
As an individual, via Quercus, submit a PDF of your rough draft on Quercus by 11:59pm ET on Wednesday, December 9, 2020.
At a minimum this must include:
All top-matter (title, author (you can use a pseudonym if you want), date, keywords, abstract) completely filled out.
A fully written Introduction section.
All other sections must be present in your paper, but don’t have to be filled out (e.g. you must have a 'Data’ heading, but you don’t need to have content in that section).
To be clear - it is fine to later change any aspect of what you submit at this checkpoint.
You will be awarded 1 percentage point just for submitting a draft that meets this minimum (that is 1 out of the 30 that are available for the final paper). If you don’t submit, then the percentage point will be pushed to part d).
The point of this is to get feedback on your work (and to make sure you have at least started thinking about this project) so you are more than welcome to include other sections that you wish to get feedback on.
There will be no extensions granted for this submission since the following submission is dependent on this date.
(Optional) December 12 11:59pm ET
Conduct peer-review.
As an individual, on December 10, you will randomly be assigned a handful of rough drafts to provide feedback. You have until December 12, 2020 11:59pm ET to provide feedback to your peers.
If you provide feedback to one peer you will receive 1 percentage point, if you provide feedback to two peers you will receive 2 percentage points, if you provide feedback to three (or more) peers you will receive the full 3 percentage points.
You may complete this aspect whether or not you submitted something in part a). If you don’t complete it then the percentage points will be pushed to part d). 
Your feedback must include at least six comments (meaningful/useful bullet points). These must be well-written and thoughtful.
There will be no extensions granted for this submission since the following submission is dependent on this date.
Please remember that you are providing feedback here to help your colleagues. All comments should be professional and kind. It is challenging to receive criticism. Please remember that your goal here is to help your peers advance their writing/analysis. Any feedback that is inappropriate or not up to standard will receive a 0 and cannot be redeemed later. 
(Optional) December 16 11:59pm ET
Submit materials for TA review.
Submit a PDF to Quercus. The TA will provide high-level comments on December 17.
At a minimum this must include:
All top-matter.
Fully written Introduction, Data, Model, and Results sections.
All other sections must be present in your paper, but don’t have to be filled out (e.g. you must have a 'Discussion’ heading, but you don’t need to have content in that section).
To be clear - it is fine to later change any aspect of what you submit at this checkpoint.
You receive 1 percentage point for submitting something that meets that minimum. If you don't submit anything then this is pushed to the final paper.
There are no extensions possible on this aspect.
(Compulsory) December 20 11:59pm ET
As an individual, via Quercus, submit a PDF of your paper. Again, in your paper, you must have a link to the associated GitHub repo. 
This submission will be graded based on a rubric that will be posted on Quercus and will be worth 25-30 percentage points depending on parts a) - c).


### Checks



### FAQ

- Do I have to submit an initial paper in order to do the peer-review? Yes.
