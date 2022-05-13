#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias ll='ls -lh --color=auto'
alias lla='ls -lah --color=auto'
#PS1='[\u@\h \W]\$ '

ppbattery_status(){
 # From http://www.basicallytech.com/blog/archive/110/Colour-coded-battery-charge-level-and-status-in-your-bash-prompt
 BATTERY=/sys/class/power_supply/rk818-battery

 BATSTATE=$(cat ${BATTERY}/status)
 CHARGE=$(cat ${BATTERY}/capacity)

 NON='\033[00m'
 BLD='\033[01m'
 RED='\033[01;31m'
 GRN='\033[01;32m'
 YEL='\033[01;33m'

 COLOUR="$RED"

 case "${BATSTATE}" in
    'Charged')
    BATSTT="$BLD=$NON"
    ;;
    'Charging')
    BATSTT="$BLD+$NON"
    ;;
    'Discharging')
    BATSTT="$BLD-$NON"
    ;;
 esac

 # prevent a charge of more than 100% displaying
 if [ "$CHARGE" -gt "99" ]
 then
    CHARGE=100
 fi

 if [ "$CHARGE" -gt "15" ]
 then
    COLOUR="$YEL"
 fi

 if [ "$CHARGE" -gt "30" ]
 then
    COLOUR="$GRN"
 fi

 echo -e "${COLOUR}${CHARGE}%${NON} ${BATSTT}"
}

kbbattery_status(){
 # From http://www.basicallytech.com/blog/archive/110/Colour-coded-battery-charge-level-and-status-in-your-bash-prompt
 BATTERY=/sys/class/power_supply/ip5xxx-battery

 BATSTATE=$(cat ${BATTERY}/status)
 CHARGE=$(cat ${BATTERY}/capacity)

 NON='\033[00m'
 BLD='\033[01m'
 RED='\033[01;31m'
 GRN='\033[01;32m'
 YEL='\033[01;33m'

 COLOUR="$RED"

 case "${BATSTATE}" in
    'Charged')
    BATSTT="$BLD=$NON"
    ;;
    'Charging')
    BATSTT="$BLD+$NON"
    ;;
    'Discharging')
    BATSTT="$BLD-$NON"
    ;;
 esac

 # prevent a charge of more than 100% displaying
 if [ "$CHARGE" -gt "99" ]
 then
    CHARGE=100
 fi

 if [ "$CHARGE" -gt "15" ]
 then
    COLOUR="$YEL"
 fi

 if [ "$CHARGE" -gt "30" ]
 then
    COLOUR="$GRN"
 fi

 echo -e "${COLOUR}${CHARGE}%${NON} ${BATSTT}"
}
PS1='P$(ppbattery_status)K$(kbbattery_status)\n[\u@\h \W]\$'
