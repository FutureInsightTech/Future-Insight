#!/bin/bash

# Banner
echo "
            ███████╗██╗   ██╗████████╗██╗   ██╗██████╗ ███████╗    ██╗███╗   ██╗███████╗██╗ ██████╗ ██╗  ██╗████████╗
            ██╔════╝██║   ██║╚══██╔══╝██║   ██║██╔══██╗██╔════╝    ██║████╗  ██║██╔════╝██║██╔════╝ ██║  ██║╚══██╔══╝
            █████╗  ██║   ██║   ██║   ██║   ██║██████╔╝█████╗      ██║██╔██╗ ██║███████╗██║██║  ███╗███████║   ██║   
            ██╔══╝  ██║   ██║   ██║   ██║   ██║██╔══██╗██╔══╝      ██║██║╚██╗██║╚════██║██║██║   ██║██╔══██║   ██║   
            ██║     ╚██████╔╝   ██║   ╚██████╔╝██║  ██║███████╗    ██║██║ ╚████║███████║██║╚██████╔╝██║  ██║   ██║   
            ╚═╝      ╚═════╝    ╚═╝    ╚═════╝ ╚═╝  ╚═╝╚══════╝    ╚═╝╚═╝  ╚═══╝╚══════╝╚═╝ ╚═════╝ ╚═╝  ╚═╝   ╚═╝                                                                                                      
                                       "Unlocking the Future, One Insight at a Time"                                                                                      
"

# Version 2,0.5:
# Problem:
# Same Problem as the version 2.0.4, thinked solved it but not sure where is the problem

# Section: System Check
echo "=== System Check ==="
echo "Checking system status..."

# Check if git is installed
if ! command -v git &> /dev/null; then
    echo "❌ Git is not installed. Please install Git to use this script."
    exit 1
fi

echo "✅ Git is installed."

echo

# Section: Commit Message
echo "=== Commit Message ==="
read -rp "✏️ Enter your commit message: " message

echo

# Section: Git Add
echo "=== Git Add ==="
git add .
add_exit_code=$?

if [ $add_exit_code -ne 0 ]; then
    git add . &> add.log
fi

echo

# Section: Check Git Add Success
echo "=== Check Git Add Success ==="
if [ $add_exit_code -eq 0 ]; then
    echo "Git add successful! ✅"
    rm add.log
else
    echo "Git add failed. Please check your changes and try again. ❌"
    echo "Errors encountered during git add. Please check add.log for more details."
fi

echo

# Section: Git Commit
echo "=== Git Commit ==="
git commit -m "$message"
commit_exit_code=$?

if [ $commit_exit_code -ne 0 ]; then
    git commit -m "$message" &> commit.log
fi

echo

# Section: Check Git Commit Success
echo "=== Check Git Commit Success ==="
if [ $commit_exit_code -eq 0 ]; then
    echo "Commit successful! 🎉"
    rm commit.log
else
    echo "Commit failed. Please check your changes and try again. ❌"
    echo "Errors encountered during commit. Please check commit.log for more details."
fi

echo

# Section: Push Commit
echo "=== Push Commit ==="
current_branch=$(git symbolic-ref --short HEAD)

git push
push_exit_code=$?

if [ $push_exit_code -ne 0 ]; then
    git push &> push.log
fi

echo

# Section: Check Push Commit Success
echo "=== Check Push Commit Success ==="
if [ $push_exit_code -eq 0 ]; then
    echo "Commit pushed successfully! 🚀"
    rm push.log
else
    echo "Push failed. Please check your network connection and try again. ❌"
    echo "Errors encountered during push. Please check push.log for more details."
fi

echo

# Section: Push Commit Upstream
echo "=== Push Commit Upstream ==="

git push -u origin "$current_branch"
push_upstream_exit_code=$?

if [ $push_upstream_exit_code -ne 0 ]; then
    git push -u origin "$current_branch" &> push_upstream.log
fi

echo

# Section: Check Push Commit Upstream Success
echo "=== Check Push Commit Upstream Success ==="
if [ $push_upstream_exit_code -eq 0 ]; then
    echo "Branch published and commit pushed successfully! 🚀"
    rm push_upstream.log
else
    echo "Push upstream failed. Please check your network connection and try again. ❌"
    echo "Errors encountered during push upstream. Please check push_upstream.log for more details."
fi

echo
