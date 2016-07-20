/etc/init.d/postgresql start

if [ ! -f /home/built.dat ]; then
    touch /home/built.dat

    pg_createcluster 9.5 main --start

    service postgresql start &&\
        sudo -u postgres psql postgres -c "CREATE USER admin with password 'admin'" &&\
        sudo -u postgres psql postgres -c "CREATE DATABASE eljefe OWNER admin" &&\
        sudo -u postgres psql postgres -c "CREATE DATABASE cuckoo OWNER admin" &&
        
        echo "from django.contrib.auth.models import User; User.objects.create_superuser('admin', 'admin@el-jefe.local', 'admin')" | python /opt/el-jefe*/webapp/manage.py shell
fi
/etc/init.d/postgresql restart
/usr/bin/supervisord
