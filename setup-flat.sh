#This script is not meant to be called directly

echo
echo "--------------------------------------------------------------"
echo "Setting up FLAT"
echo "--------------------------------------------------------------"

export PYTHONPATH=$(pwd)/LaMachine
export DJANGO_SETTINGS_MODULE=flat_settings

if [ -z "$VIRTUAL_ENV" ]; then
    mkdir /var/flat.docroot
    chmod a+rwx /var/flat.docroot
fi

django-admin makemigrations
django-admin migrate --run-syncdb

#create superuser automatically if it does not exist already
echo -n "
from django.contrib.auth.models import User

username = 'flat'
password = 'flat'
email = 'flat@localhost'

if User.objects.filter(username=username).count() == 0:
    User.objects.create_superuser(username, email, password)
    print('Superuser created.')
else:
    print('Superuser creation skipped.')
" | django-admin shell -i python

if [ -d /vagrant ]; then
    chgrp vagrant /var/db
    chmod g+w /var/db
    chown vagrant /var/db/flat.db
fi
