
red='\033[0;31m'          # Red
green='\033[0;32m'        # Green
yellow='\033[0;33m'       # Yellow
blue='\033[0;34m'         # Blue
purple='\033[0;35m'       # Purple
cyan='\033[0;36m'         # Cyan
white='\033[0;37m'        # White
end='\033[0m'

Bwhite='\033[1;37m'       # Bold White
Bred='\033[1;31m'         # Red

# Background
On_White='\033[47m'       # White
On_Red='\033[41m'         # Red


clear

echo -e "\t${On_Red}${Bwhite}\033[5mCOMMAND LINE TEST\033[m\n${end}" 
echo -e "${red}----------------------------------------
		WELCOME
----------------------------------------${end}\n"

while true
do
    
echo -e "${green}What would you like to continue?${end}\n1)Sign_Up\n2)Sign_In\n3)Exit" 
read option
	
user_arr=(`cat user_name.txt`)
passwd_arr=(`cat user_passwd.txt`)
sum=0

case ${option} in 
    1)  
        clear	
	echo -e "\t\t\t${yellow}=========\n\t\t\t Sign Up\n\t\t\t-~-~-~-~-${end}"
	
	flag=1	
	
	while [ ${flag} -eq 1 ] 
	do

	echo -e "${green}Enter User Name:${end}"
	read -p "-> " user_name
	
	
	if [ ${#user_arr} -gt 0 ] 
	then

	for i in `seq 0 1 ${#user_arr[@]}`
    	do
    		if [ "$user_name" == "${user_arr[i]}" ]
		then
		    echo -e "${purple}User already exists..${end}"
		    flag=1
		    break
		else
		    # echo -n "Checked"
		    flag=0
		fi	    
	done
    	
    	else
	flag=0
	fi

    	done

	echo ${user_name} >> user_name.txt

	while [ 1 ]
	do
	echo -e "${green}Enter Password :${end}"
	read -p "-> " user_passwd
	echo -e "${green}Confirm Password :${end}"
	read -sp "-> " user_confirm_passwd

	if [ "${user_passwd}" == "${user_confirm_passwd}" ]
	then
	    echo -e "${purple}Sign Up Successfull..${end}"
	    echo ${user_confirm_passwd} >> user_passwd.txt
	    break
	else
	    echo -e "${red}Password does not match..${end}"
	fi
    	done

	;;

    2)
        clear	
	echo -e "\t\t\t${yellow}=========\n\t\t\t Sign In\n\t\t\t-~-~-~-~-${end}"
	flag=0

	while [ ${flag} -eq 0 ]
	do
	
	echo -e "${green}Enter User Name:${end}"
	read -p "-> " user_name

	if [ ${#user_arr[@]} -gt 0 ]
	then
	
	for i in `seq 0 1 ${#user_arr[@]}`
	do 
    	    if [ "$user_name" == "${user_arr[i]}" ]
	    then
		flag=1
		
		echo -e "${green}Enter Password :${end}"
		read -sp "-> " user_passwd
		
		if [ "$user_passwd" == "${passwd_arr[i]}" ]
		then
		    echo -e "${purple}Sign In Successfully..${end}"
		else
		    echo -e "${red}Password doesn't match..${end}"
		    flag=0
		fi

		break	
	    else
		# echo -n "Checked"
		flag=0
	    fi    	    
	done
    		    
        else
	flag=0
	echo -e "${red}Please Signup First..!${end}"
	break
	fi
	
        done

	## TEST ##
	sleep 2
	
	echo -e "${green}Would you like to take\n${end}1)Test\n2)exit"
	read choice

	if [ ${choice} -eq 2 ] 
	then
	    for i in `seq 3 -1 1`
	    do
		echo -en "\rExiting in ${i} seconds"
		read -t 1
	    done	
	    echo
	    exit
	fi
	
	clear

echo -e "${On_White}${Bred}\033[5m----------------------------------------
                    TEST                
----------------------------------------\033[m${end}\n"	
	
	for i in `seq 5 5 50`
	do
	    head -${i} questions.txt | tail -5 
	    for j in `seq 10 -1 1`
	    do 
		echo -en "\rAnswer in ${j} seconds, "
		read -t 1 ans

		if [ "$ans" != "" ]
		then
		    echo
		    break
		else if [ $j -eq 1 ]
		then
		    ans=$
		    echo
		fi
		fi
	    done

	    echo "$ans" >> user_ans.txt
	done

	user_ans=(`cat user_ans.txt`)
	actual_ans=(`cat answers.txt`)

	clear	
echo -e "\n${On_White}${Bred}\033[5m----------------------------------------
                    RESULT                
----------------------------------------\033[m${end}\n"	

	for i in `seq 0 1 9`
	do
	    head -$(($((5 * $i)) + 5)) questions.txt | tail -5
	    	echo -e "${cyan}${user_ans[i]}${end}"
		if [ "${user_ans[i]}" == '$' ]
		then
		    echo -e "${yellow}Timed Out\n${end}"
		else if [ "${user_ans[i]}" != "${actual_ans[i]}" ]
		then
		    echo -e "${red}Wrong Answer\n${end}"
		else
		    echo -e "${green}Correct Answer\n${end}"
		    sum=$(expr $sum + 1)
		fi
		fi
	done

	rm -r user_ans.txt
	echo -e "${blue}Total Obtained Marks: ${end}${green} ${sum}/10${endl}"
	;;

    3)
	    for i in `seq 3 -1 1`
	    do
		echo -en "\rExiting in ${i} seconds"
		read -t 1
	    done
    	echo	    
	exit
esac

done
