# Update Kheops

# Update the PACS in Kheops

This is a list of main command coming from :
[dcm4chee-arc-light](https://github.com/dcm4che/dcm4chee-arc-light/wiki/Upgrade-on-Docker)

## 5.15.0 to 5.16.2

### Backup your data

#### Wildfly configuration

```
$ docker cp pacsarc:/opt/wildfly/ .
```

#### LDAP

```
$ docker exec slapd-container-name export-data > config_backup.ldif
```

#### PSQL

```
$ docker exec -t postgres-container-name pg_dump -U pacsarc_username pacsarc_dbname > pacsarcbackup.sql
```

### Stop Kheops

Stop the docker **without removing the volumes**.

If you remove your volumes, you can lose all your data.

```
$ docker-compose down
```

### Remove previous Wildfly configuration and deployment

If the configuration and deployment of Wildfly are in a volume :

```
$ docker volume rm wildfly-configuration-deployment
```

If the Wildfly configuration and deployment is mapped, remove or rename the directory :

```
rm -r wildfly-configuration-deployment
```

```
mv wildfly-configuration-deployment /tmp
```

### Run new version

Update the file **.env** with the new version.

For example:

```
KHEOPS_DATABASE_IMAGE_TAG=upgrade_16
KHEOPS_ARC_IMAGE_TAG=5.16.2
PACS_LDAP_IMAGE_TAG=2.4.44-16.2
```

Pull the new images.

```
$ docker-compose pull
```

Launch Kheops.

```
$ docker-compose up
```

### Update LDAP schema and configuration data

#### Update LDAP schema

```
$ docker exec slapd-container-name update-schema
```

#### Update LDAP configuration

```
$ docker exec slapd-container-name update-data 5.15.1
$ docker exec slapd-container-name update-data 5.16.0
$ docker exec slapd-container-name update-data 5.16.1
$ docker exec slapd-container-name update-data 5.16.2
```

### Update PSQL

```
psql -U pacs_username -d pacs_dbname -a -f /sqlPacs/sql/update-5.15-1-psql.sql
psql -U pacs_username -d pacs_dbname -a -f /sqlPacs/sql/update-5.15-2-psql.sql
psql -U pacs_username -d pacs_dbname -a -f /sqlPacs/sql/update-5.15-3-psql.sql
psql -U pacs_username -d pacs_dbname -a -f /sqlPacs/sql/update-5.16-psql.sql
psql -U pacs_username -d pacs_dbname -a -f /sqlPacs/sql/update-5.16-1-psql.sql
psql -U pacs_username -d pacs_dbname -a -f /sqlPacs/sql/update-5.16-2-psql.sql
```
