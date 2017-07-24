function fzf_recentd
    set -l query (commandline)

    if test -n $query
        set flags --query "$query"
    end

    z -l | fzf $flags | awk '{ print $2 }' | read recentd
    if [ $recentd ]
        cd $recentd
        commandline -r ''
        commandline -f repaint
    end
end
