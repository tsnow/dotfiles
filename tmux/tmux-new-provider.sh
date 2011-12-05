#!/bin/sh
tmux new-session -s provider_edit -d
tmux split-window -t provider_edit -h 'ssh rwdev@app001.rips.qa1-trunk.dca1.rws'
tmux split-window -t provider_edit -v 'ssh rwdev@app001.rips.qa1-release.dca1.rws'

tmux select-pane -t provider_edit:.0
tmux split-window -t provider_edit -v  'ssh rwdev@app001.rips.dca1.prod.rws'

tmux -2 attach-session -t provider_edit
