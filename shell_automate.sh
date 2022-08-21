#! /bin/bash

select name in new_proj add_repo_gh proj_push ext
do
  case $name in
	new_proj )
		read -p  "Enter Directory name with: "  Dir_name
		cd $Dir_name
		echo "Movied to this Dir" $PWD
		read -p  "Enter project name: " proj_name
		mkdir $proj_name
		echo "Created project" $proj_name
		cd $proj_name
		echo "Movied to this Dir" $PWD
		git init
		;;
	add_repo_gh )
		read -p "Enter the Directory of the project: " Proj_Dir
		cd $Proj_Dir
		echo "Movied to this Dir" $PWD
		read -p "Enter the new repo name: " rep_name
		read -p  "Enter your read me text here: " content
		echo $content >> README.md
		git add .
		git commit -m "Initial commit"
		gh repo create $rep_name --public --source=. --remote=upstream --push
		;;
	proj_push )
		read -p "Enter the Directory of the project: " Proj_Dir
		cd $PWD/$Proj_Dir
		git add .
		read -p "Enter the Commit String: " comit_str
		git commit -m "$comit_str"
		git push
		;;
	ext )
		exit
		;;
  esac
done
