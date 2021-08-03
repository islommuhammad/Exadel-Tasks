### #1. Create new Github repository.
git init
git remote add origin https://github.com/islommuhammad/task1-exadel.git
### #2. Create Task1 folder in the master branch.
mkdir Task1
### #3. Create new branch dev.
git branch dev
### #4. Create new branch %USERNAME-new_feature.
git checkout -b islommuhammad-new_feature
### #5. Add README.md file to your %USERNAME-new_feature branch
touch README.md
git add README.md
### #6. Check your repo with git status command
git status
### #7. Add .gitignore file to ignore all files whose name begins “.”
echo ".*" >> .gitignore
### #8. Commit and push changes to github repo.
git commit -m "README.md added"
git push --all origin -u
### #9. Create Pull Request to the dev branch.
### #10. Merge your branch with the dev branch and create Pull Request to the master branch. Merge dev with master.
#### Merging islommuhammad-new_feature to dev
#### Merging dev branch to master
git pull
### #11. Checkout to %USERNAME-new_feature, make changes in README.md and commit them. Revert last commit in %USERNAME-new_feature branch.
git checkout islommuhammad-new_feature
nano README.me
git commit -am "README.md changed"
git reset --soft HEAD~1
### #12. Check your repo with git log command, create log.txt file in master branch and save “git log” output in it.
git log
nano log.txt
git add log.txt
### #13. Delete local and remote branch %USERNAME-new_feature.
git branch -d islommuhammad-new_feature
git push origin --delete islommuhammad-new_feature
### #14. Add all used command to the git_commands.md file in the dev branch.
 nano git_commands.ms
