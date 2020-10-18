set PATH $PATH ~/.config/composer/vendor/bin

function art
	php artisan $argv
end

starship init fish | source
