# Setuptools
sudo apt-get install -y python-setuptools

# Virtualenv: Provide isolated Python environments
if [ ! -f "/usr/local/bin/virtualenv" ]; then
	echo "Installing Virtualenv..."
	sudo easy_install virtualenv
fi

cd /vagrant/web

# Create an environment named 'webenv'
if [ ! -d "/vagrant/web/webenv" ]; then
	echo "Creating webenv environment..."
	virtualenv --no-site-packages webenv
	echo "webenv" >> .gitignore
fi

# Django: Web framework
if [ ! -f "/vagrant/web/webenv/bin/django-admin.py" ]; then
	echo "Installing Django..."
	./webenv/bin/easy_install django
fi

# IPython: Enhanced interactive shell for python
if [ ! -f "/vagrant/web/webenv/bin/ipython" ]; then
	echo "Installing IPython..."
	./webenv/bin/easy_install ipython
fi

# Start web server
cd RA
echo "Starting web server"
../webenv/bin/python manage.py runserver 0.0.0.0:8000 > /dev/null 2>&1 &