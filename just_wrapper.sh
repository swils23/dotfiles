"""
~/just_wrapper.sh

Note: Add 'source ~/just_wrapper.sh' to your ~/.zshrc file to enable this script
"""

function j() {
    case $1 in
        dump_prod)
            PGPASSWORD=abc123 \
            pg_dump -h URL -p 5432 -U USERNAME -d fns-prod -F c -f dump_`date +%Y%m%d_%H%M%S`.dump
            ;;
        makemigrations)
            dcrr web python manage.py makemigrations
            ;;
        migrate)
            dcrr web python manage.py migrate
            ;;
        d)
            dka; dcc; dci; dcb
            ;;
        dbr)
            j d &&\
            docker volume rm n-pears_db-data || true &&\
            j db_restore $2
            ;;
        flttp)
            j fl && j ttp
            ;;
        flt)
            j format lint test
            ;;
        fl)
            j format lint
            ;;
        f)
            j format
            ;;
        l)
            j lint
            ;;
        t)
            j test $2
            ;;
        tp)
            j d && j test_playwright $2
            ;;
        ttp)
            j t && j d; j tp
            ;;
        m)
            j migrate
            ;;
        mm)
            j makemigrations
            ;;
        mmm)
            j mm && j m
            ;;
        ss)
            j snapshot_save $2
            ;;
        sr)
            j snapshot_restore $2
            ;;
        u)
            j d && j start
            ;;
        *)
            just "$@"
            ;;
    esac
}

# Function to print out the cases of the 'j' function
_print_cases() {
    sed -n '/^function j() {/,/esac/p' ~/just_wrapper.sh | grep -E '^\s*[a-zA-Z_][a-zA-Z0-9_]*\)' | sed 's/)//' | tr '\n' ' ' | xargs
}

_j_completions() {
    local cur prev opts just_completions
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"

    # Custom options
    opts=$(_print_cases)

    # Get completions from just
    just_completions=$(just --summary 2>/dev/null)

    # Combine custom options with just completions
    combined_opts="${opts} ${just_completions}"
    combined_opts=$(echo $combined_opts | tr ' ' '\n' | sort | uniq | tr '\n' ' ')

    if [[ ${cur} == --* ]]; then
        COMPREPLY=( $(compgen -W "${combined_opts}" -- ${cur}) )
    else
        COMPREPLY=( $(compgen -W "${combined_opts}" -- ${cur}) )
    fi

    return 0
}

complete -F _j_completions j