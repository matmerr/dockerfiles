/etc/init.d/postgresql start

if [ ! -f /etc/el-jefe/built.dat ]; then
    touch /etc/el-jefe/built.dat
    service postgresql start &&\
        sudo -u postgres psql postgres -c "CREATE USER admin with password 'admin'" &&\
        sudo -u postgres psql postgres -c "CREATE DATABASE eljefe OWNER admin" &&\
        sudo -u postgres psql postgres -c "CREATE DATABASE cuckoo OWNER admin" &&\
        /etc/init.d/postgresql restart

        echo "from django.contrib.auth.models import User; User.objects.create_superuser('admin', 'admin@el-jefe.local', 'admin')" | ./manage.py shell
fi

/usr/bin/supervisord
