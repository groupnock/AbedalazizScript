#!/usr/bin/env bash
set -e

# ← ONLY change this:
PUBKEY="3MXohQ9ExcSQa1qttFgj15yZi3Xptwh2R99FoAgU5MxZYhFMN9bKhAPRWNmrUfXPy3WJoocvkHicCRfm7WV3BLXx7CHKJTnEPJMpdvdNF5rPRfowUBM6HB7LFgorcp6z464V"

# name of your tmux session
SESSION="nock-miner"

# kill old session if it exists
tmux kill-session -t "$SESSION" 2>/dev/null || true

# verify the binary is there
ls ~/nockchain/target/release/nockchain

# launch miner in tmux
tmux new-session -d -s "$SESSION" \
  "cd ~/nockchain && ./target/release/nockchain --mining-pubkey $PUBKEY --mine"

echo "✅ Started! Attach to it with:"
echo "    tmux attach -t $SESSION"
