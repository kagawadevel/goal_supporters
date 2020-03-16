server '18.180.105.246', user: 'app', roles: %w{app db web}
set :ssh_options, keys: '/Users/kakegawa/.ssh/id_rsa'