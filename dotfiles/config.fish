set PATH $PATH ~/.config/composer/vendor/bin
set fish_greeting

function art
	php artisan $argv
end

starship init fish | source
