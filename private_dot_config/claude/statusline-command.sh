#!/bin/sh
input=$(cat)

# Build a graphical bar: filled/empty blocks out of BAR_WIDTH total
make_bar() {
  pct="$1"
  bar_width=10
  filled=$(echo "$pct $bar_width" | awk '{n=int($1/100*$2+0.5); if(n>$2) n=$2; print n}')
  empty=$(( bar_width - filled ))
  bar=""
  i=0
  while [ $i -lt $filled ]; do bar="${bar}█"; i=$(( i + 1 )); done
  i=0
  while [ $i -lt $empty ]; do bar="${bar}░"; i=$(( i + 1 )); done
  printf "%s" "$bar"
}

# Git branch
git_branch=$(git -C "$(echo "$input" | jq -r '.cwd')" --no-optional-locks branch --show-current 2>/dev/null)
if [ -n "$git_branch" ]; then
  branch_part=" ⎇ $git_branch"
else
  branch_part=""
fi

# Model display name
model=$(echo "$input" | jq -r '.model.display_name // "Unknown Model"')

# Context window fill %
session_used_pct=$(echo "$input" | jq -r '.context_window.used_percentage // empty')

# Cumulative session token count (input + output)
total_input=$(echo "$input" | jq -r '.context_window.total_input_tokens // empty')
total_output=$(echo "$input" | jq -r '.context_window.total_output_tokens // empty')

context_part=""

if [ -n "$session_used_pct" ]; then
  session_pct_fmt=$(printf "%.0f" "$session_used_pct")
  session_bar=$(make_bar "$session_used_pct")
  context_part=" | Ctx: [${session_bar}] ${session_pct_fmt}%"

  if [ -n "$total_input" ] && [ -n "$total_output" ]; then
    total_tokens=$(( total_input + total_output ))
    total_tokens_fmt=$(echo "$total_tokens" | awk '{
      if ($1 >= 1000000) printf "%.1fM", $1/1000000
      else if ($1 >= 1000) printf "%.1fk", $1/1000
      else printf "%d", $1
    }')
    context_part="${context_part} (${total_tokens_fmt} tokens)"
  fi
fi

printf "%s | %s%s" "$branch_part" "$model" "$context_part" | sed 's/^ | //'
