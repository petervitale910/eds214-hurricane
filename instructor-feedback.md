Peter Vitale

#### Exceed Spec 

##At least one piece of functionality has been refactored into a function in its own file
I believe I have exceeded this in two ways. The first is that I refactored two pieces of functionality into functions. The second is that my refactoring file has a roxygen skeleton, documenting what the functions need as imports and what the functions export. 

##The code is appropriately commented
When commenting code I try to make it so someone who has never looked at or heard of R can follow along with what I did. I believe this commenting makes it so I have exceeded this spec. 

####Collaboration 

My collaboration style is a sort of compliment sandwich. I like to make sure to balance good things with things that could be tweaked. In this way I felt like I was able to help Ixel continue working on her qmd. For example, Ixel had a large portion of her rolling average script in spaghetti, so i made note of this and added that once it goes into the qmd that it would work great because of her naming conventions. I also was able to collaborate with Ixel on her graph, which in turn gave me greater clarity on my own graph 

##Issue links
https://github.com/IIDonaji/eds214-Repro/issues/15
https://github.com/IIDonaji/eds214-Repro/issues/13
https://github.com/IIDonaji/eds214-Repro/issues/16


##Merge conflict 
https://github.com/petervitale910/eds214-hurricane/commit/4eeb9f827f95db1ab6cc4d920eef5700e442eeba

# Instructor feedback

## Automate

[M] **Running the entire analysis requires rendering one Quarto document**

[M] The analysis runs without errors

[M] **The analysis produces the expected output**

[NY] **Data import/cleaning is handled in its own script(s)**
- Missing `library()` from `data_import.qmd`

## Organize

[M] Raw data is contained in its own folder

[M] Intermediate outputs are created and saved to a separate folder from raw data

[M] **At least one piece of functionality has been refactored into a function in its own file**
- Each function should be housed in it's separate `.R` script

## Document

[M] The repo has a README that explains where to find (1) data, (2) analysis script, (3) supporting code, and (4) outputs

[M] **The README includes a flowchart and text explaining how the analysis works**

[M] **The code is appropriately commented**

[M] **Variable and function names are descriptive and follow a consistent naming convention**

## Scale

After cloning the repo on Workbench:

[NY] Running the environment initialization script installs all required packages

[M] The analysis script runs without errors

## Collaborate

[M] **The student has provided attentive, constructive feedback in a peer review**

[M] **The student has contributed to a peer's repo by opening an issue and creating a pull request**

[M] The repo has at least three closed GitHub issues

[M] The commit history includes at least one merged branch and a resolved merge conflict

[M] The rendered analysis is accessible via GitHub Pages
