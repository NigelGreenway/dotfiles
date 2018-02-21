#!/usr/bin/env zsh

ZSH_THEME_PROMPT_CHAR="> "


function is_a_git_directory {
    [[ -n "$(git rev-parse --is-inside-work-tree 2> /dev/null)" ]] && echo 1
}

function git_info {
    if [[ -n $(is_a_git_directory) ]]; then
        local git_status=$(git status -sb 2> /dev/null)

        function is_ahead {
            local count=`echo "${git_status}" | sed -n 's/.*\(ahead [[:digit:]]*\).*/\1/p' | awk '{ print $2 }'`
            [[ ${count} -gt 0 ]] && echo " ${count}${SCM_GIT_AHEAD_CHAR}"
        }

        function is_behind {
            local count=`echo "${git_status}" | sed -n 's/.*\(behind [[:digit:]]*\).*/\1/p' | awk '{ print $2}'`
            [[ ${count} -gt 0 ]] && echo " ${count}${SCM_GIT_BEHIND_CHAR}"
        }

        function is_dirty {
            if [[ $(git diff --shortstat 2> /dev/null | tail -n1) != "" ]]
            then
                echo -e "\e[31m✗"
            else
                echo -e "\e[32m✓"
            fi
        }

        function new_files_added {
            local count=`echo "${git_status}" | grep "^A" | wc -l`
            [[ ${count} -gt 0 ]] && echo " A:${count}"
        }

        function staged_changes {
            local count=`echo "${git_status}" | egrep "^(M|D)" | wc -l`
            [[ ${count} -gt 0 ]] && echo " S:${count}"
        }

        function tracked_changes {
            local count=`echo "${git_status}" | egrep "^( M|MM| D|D)" | wc -l`
            [[ ${count} -gt 0 ]] && echo " U:${count}"
        }

        function unstaged_changes {
            local count=`echo "${git_status}" | grep "^??" | wc -l`
            [[ ${count} -gt 0 ]] && echo " ?:${count}"
        }

        function stashed_count {
            local count=`git stash list| wc -l`
            [[ ${count} -gt 0 ]] && echo -e "\e[97m[\e[94m${count}\e[97m] "
        }

        local project_path=`git rev-parse --show-toplevel`
        local branch_name="\e[95m$(git rev-parse --abbrev-ref HEAD)"
        local ahead="\e[32m$(is_ahead)"
        local behind="\e[31m$(is_behind)"
        local dirty="$(is_dirty)"
        local added="\e[32m$(new_files_added)"
        local staged="\e[32m$(staged_changes)"
        local tracked="\e[34m$(tracked_changes)"
        local unstaged="\e[31m$(unstaged_changes)"
        local stash_count="$(stashed_count)"

        function show_changes {
            if [[ $(git status -s | wc -l) -gt 0 ]]
            then
                echo -e " \e[96m(${added}${staged}${tracked}${unstaged} \e[96m)"
            fi
        }

        echo -e "\n${branch_name} ${dirty}${ahead}${behind}\n${stash_count}$(show_changes)"
    fi
}


PROMPT='%F{cyan}%~%F{magenta}$(git_info)
%F{yellow}${ZSH_THEME_PROMPT_CHAR}'
