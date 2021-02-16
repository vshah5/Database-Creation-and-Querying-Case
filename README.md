# Excel-to-SQL-Dataset-Case

A database was created based on the case info, data fields were inserted into the database, and finally SQL queries were used to do the following:
a) Provide an alphabetical list showing common and legal names of all Ontario charities.
b) Generate a list with employee first name, last name, and number of articles published.
c) How many times was each article viewed, from most to least popular?
d) List the common name of each charity, along with its sector and sum of all donations made during 2020, starting with the highest donation total.

Case Info:

Charity Intelligence (Ci)* Kate Bahen, retired Equity Research Associate and founder of the online Canadian watchdog Charity Intelligence (Ci), was on the phone and staring at a three-year-old sticky note on her desk labelled “FUNDRAISE!!” The note served a constant reminder of her goal of having Ci funded entirely by donations. Ironically, the purpose of her current call was to instruct her financial advisor to withdraw $80,000 from her retirement savings to finance Ci’s deficit, for the 10th year in a row. Donations to Ci had plateaued, and Kate didn’t know what to do.

Canadians collectively donated $16 billion annually to over 86,000 registered Canadian charities.† Ci’s mission was “to provide Canadian donors with information to help them make informed and intelligent giving decisions to have the greatest impact.” This was accomplished through publication of easy-to-read analytical reports on their website featuring each of the 700 largest charities in Canada, as well as articles on charitable giving entitled “Views on Charity News”. 

Ci’s message was spreading. Website visits had grown 83 percent annually, with over 260,000 hits in the current year. Despite this growth, Ci was chronically underfunded. Bahen had a sense that certain types of charity advertisements, articles, messages, and efforts must be more effective than others – and Ci seemed to have a mountain of website visitor data. How was it that they were always flying in the dark? 

Operationally, all charity data was currently stored on Excel spreadsheets, one spreadsheet per charity profile. The hundreds of resulting Excel files were inconsistent, and many contained buggy VBA macros. When an intern completed a charity profile, they logged in to Ci’s website account and manually input the final calculated information from the Excel spreadsheet into that page’s source code. Thus, all the comments, financial information, and scores for each charity were essentially hardcoded into the HTML code of each charity profile’s webpage. 

Bahen had learned from her intern, Ethan Smart, that the non-profit was sitting on a “data lake” of unstructured user session information that was not very useful in its current form. If Ci were to organize its data and user session information into a structured database, Smart argued, it would be possible to analyze donor web behaviours to learn what kinds of content was associated with higher donation amounts. 

Bahen barely understood technology, or what Smart was talking about – she much preferred to keep everything on nice clean spreadsheets! But if she kept spending her retirement savings to keep CI afloat, she realized she wouldn’t be able to stay retired for long. And she did see value in knowing more about what kinds of content donors were responding to. Maybe a centralized database really was the solution to her biggest problem. Bahen asked Smart to dig into the problem and make a recommendation.
