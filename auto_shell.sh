#! /bin/bash

dir_checker(){
	read -p "Present directory or different directory (y/n)" dir_c
	if [ $dir_c == "n" ]
	then
		read -p  "Enter Directory name with: "  Dir_name
		if ! cd $Dir_name
                then
                        cc
                fi
	fi
}

cc () {
select name in new_proj add_repo_gh proj_push clone_repo add_ssh_key ext
do
  case $name in
	new_proj )
		echo "Present Location: " $PWD
		dir_checker
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
		dir_checker
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
		dir_checker
		git add .
		read -p "Enter the Commit String: " comit_str
		git commit -m "$comit_str"
		git push
		;;
	clone_repo )
                echo "Present Location: " $PWD
		dir_checker
		read -p "Enter the repo link: " repo_link
		if ! git clone $repo_link
		then
			cc
		fi
		;;
	add_ssh_key )
		echo "Present Loction:" $PWD
		read -p "Enter the public key files : " fil_loc
		gh ssh-key add $fil_loc
		;;
	ext )
		exit
		;;
  esac
done
}

cc
