# Repository dataptams2020

Document/collaborate on analysis using Jupyter Notebook or Jupyter Lab


## General strategy

The goal is to work all together on this repository.<br/> 
The general strategy to achieve this is to have a main master branch where labs<br/>
and exercises will be posted periodically by the teaching staff
while the students can work on their own branches.<br/>
The teaching staff will visit the students’ branch and provide feedback on their work.

## Steps to setup your branch

  1. Clone the repository on your local machine
  2. Create a local branch and give it your name.
     For example, if your name is 'paolo' do 
     
     ```
      git branch paolo
     ```
     
  3. Switch to your local branch 
    
     ```
      git checkout paolo
     ```
  You will see the name of your branch next to the directory of the repository 
  For example: /Documents/git/dataptams2020 (paolo)

## How to share your work with teaching staff and receive updates on labs and projects

  - **You will work almost exclusively on your branch**. 
     When you want to push your results to the remote repository, 
     after adding and committing the relevant files, do
     
```
    	  git push origin branch_name (use your actual branch name)
```

   - You can update your branch, for example to view feedback 
      given from the teachers by doing
     (Always from your branch).
```
    	  git pull origin branch_name (use your actual branch name)
```
   - When new files and labs are posted you can
     receive them by doing, always from your branch,
```
    	  git pull origin master
```
     
## Getting notebooks to run

Our main tool to perform data analysis and present results is Jupyter Notebook.
You should be able to start the notebook server by typing *jupyter lab* or *jupyter notebook*
in command line.


## Important notes

- We don't want to store data, presentations, figures on github. The general strategy will be to download
  the relevant data from our google drive to your local machine
  into the relevant data folder, usually suggested in the lab documentation, and work
  only locally with the data.

