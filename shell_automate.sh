#! /bin/bash

cc () {
select name in new_proj add_repo_gh proj_push clone_repo clone_repo_dir ext
do
  case $name in
	new_proj )
		echo "Present Location: " $PWD
		read -p  "Enter Directory name with: "  Dir_name
		if ! cd $Dir_name
		then
			cc
		fi
		echo "Movied to this Dir" $PWD
		read -p  "Enter project name: " proj_name
		if ! mkdir $proj_name
		then
			cc
		fi
		echo "Created project" $proj_name
		cd $proj_name
		echo "Movied to this Dir" $PWD
		git init
		;;
	add_repo_gh )
		echo "Present Location: " $PWD
		read -p "Enter the Directory of the project: " Proj_Dir
		if ! cd $Proj_Dir
		then
			cc
		fi
		echo "Movied to this Dir" $PWD
		read -p "Enter the new repo name: " rep_name
		read -p  "Enter your read me text here: " content
		echo $content >> README.md
		git add .
		git commit -m "Initial commit"
		gh repo create $rep_name --public --source=. --remote=upstream --push
		;;
	proj_push )
                echo "Present Location: " $PWD
		read -p "Enter the Directory of the project: " Proj_Dir
		if ! cd $PWD/$Proj_Dir
		then
			cc
		fi
		git add .
		read -p "Enter the Commit String: " comit_str
		git commit -m "$comit_str"
		git push
		;;
	clone_repo )
                echo "Present Location: " $PWD
		read -p "Enter the repo link: " repo_link
		if ! git clone $repo_link
		then
			cc
		fi
		;;
	clone_repo_dir )
                echo "Present Location: " $PWD
		read -p "Enter the Directory location in which you want to clone the repo: " repo_link_dir
		if ! cd $repo_link_dir
		then
			cc
		fi
		read -p "Enter the repo link: " repo_link_2
		git clone $repo_link_2
		;;
	ext )
		exit
		;;
  esac
done
}

cc
