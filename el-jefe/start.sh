/etc/init.d/postgresql start

if [ ! -f /home/built.dat ]; then
    touch /home/built.dat

    pg_createcluster 9.5 main --start

    service postgresql start &&\
        sudo -u postgres psql postgres -c "CREATE USER admin with password 'admin'" &&\
        sudo -u postgres psql postgres -c "CREATE DATABASE eljefe OWNER admin" &&\
        sudo -u postgres psql postgres -c "CREATE DATABASE cuckoo OWNER admin" 
        
    python /opt/eljefe-*/webapp/manage.py syncdb --noinput
    /etc/init.d/postgresql restart

fi

/usr/bin/supervisord
