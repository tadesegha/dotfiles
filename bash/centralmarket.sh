export PATH="~/tools/scripts/central-market:$PATH"

alias cm="cd ~/dev/central-market"
alias cmwp="cd ~/dev/central-market/wordpress/centralmarket.com/html"
alias cmrs="cd ~/dev/central-market/react-service"

# central market aliases
alias cm-switch-branch='cmwp && sudo docker run --interactive --tty --rm --volume $PWD:/app composer install --ignore-platform-reqs && cd wp-content/themes/centralmarket-theme/ && npm ci && npm run prod && echo consider running "sudo docker exec centralmarket.com wp plugin activate centralmarket-react-service"'
