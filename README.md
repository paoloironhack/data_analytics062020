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
  If you are using Windows you will see the name of your branch next to the directory of the repository<br> 
  For example: 
  
  ```
  /git/dataptams2020 (paolo)
  ```
 In any case to check on which local branch you are you can do 
 
  ```
  git branch -lvv
  ```
 and you should see an asterisk next to the name of the branch on which you are working 
 

## How to submit your work and receive updates on labs and projects

 - **You will work almost exclusively on your branch**, so please make sure that you are on your branch. 
 
 - When you want to push your results to the remote repository, to submit or modify your work, 
     after adding and committing the relevant files, do
     
```
    	  git push origin branch_name (use your actual branch name)
```

 - You can update your branch, for example to view feedback given from the teachers by doing
     (Always from your branch).
```
    	  git pull origin branch_name (use your actual branch name)
```
- When new files and labs are posted you can
     receive them by doing, always from your branch,
```
    	  git pull origin master
```

A cheat sheet that summarizes the most important commands can be found [here](https://drive.google.com/file/d/1-Dc2r6tBMtbH4BoisMOKv1nvRZwGrWZc/view?usp=sharing)
     
## Getting notebooks to run

Our main tool to perform data analysis and present results is Jupyter Notebook and Jupyter Lab.
You should be able to start the notebook server by typing *jupyter lab* or *jupyter notebook*
in command line.
A useful cheatsheet to work more effectively with the Jupyter notebook
can be found [here](https://drive.google.com/open?id=1slPTN3g9bepzE84FA6rAHl0OZB_GRR8G)


## Important notes

We don't want to store data, presentations, figures on github. The general strategy will be to download
  the relevant data from our google drive to your local machine
  into the relevant data folder, usually suggested in the lab documentation, and work
  only locally with the data.

