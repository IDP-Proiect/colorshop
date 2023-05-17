#!/bin/bash
declare -A arr

arr[JWT_SECRET]="https://www.youtube.com/watch?v=tXO2QtjixaM"
arr+=( 
    [DATABASE_URL]="postgresql://postgres:postgres@idp_postgres:5432/Todo?schema=public"
    [MINIO_SECRET_KEY]="minioadmin"
    [MINIO_ACCESS_KEY]="minioadmin"
    [MINIO_ROOT_USER]="minioadmin"
    [MINIO_ROOT_PASSWORD]="minioadmin"
)

for key in ${!arr[@]}; do
    echo ${key} ${arr[${key}]}
    docker secret rm ${key}
    echo ${arr[${key}]} | docker secret create ${key} -
done
