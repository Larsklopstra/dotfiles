set PATH $PATH ~/.config/composer/vendor/bin
set fish_greeting

function art
	php artisan $argv
end

function wip
	git add .
	git commit -am "wip"
	git push
end

starship init fish | source
