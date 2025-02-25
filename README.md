# my_study
Basic information I need


# Linux task

# Get context from URL
curl -s "https://google.com

ls                # Показать файлы и папки в текущем каталоге
ls -l             # Подробный список (размер, права, владелец)
ls -a             # Показать скрытые файлы
ls -lh            # Читаемый формат размера файлов
ls -lt            # Сортировать по дате изменения

cd /var/log       # Переход в /var/log
cd ..             # Подняться на уровень выше
cd ~/projects     # Перейти в каталог "projects" в домашней папке
cd -              # Вернуться в предыдущую папку

grep "error" /var/log/syslog    # Найти слово "error" в файле syslog
grep -i "warning" file.txt      # Игнорировать регистр при поиске
grep -r "TODO" ~/projects       # Рекурсивный поиск "TODO" в папке
ps aux | grep nginx             # Найти процессы с "nginx"

awk '{print $1, $3}' file.txt   # Вывести 1-й и 3-й столбец
awk -F: '{print $1}' /etc/passwd  # Вывести имена пользователей из /etc/passwd

sed 's/foo/bar/' file.txt       # Заменить первое "foo" на "bar" в строке
sed 's/foo/bar/g' file.txt      # Заменить все "foo" на "bar"
sed '/error/d' log.txt          # Удалить строки, содержащие "error"

find /var/log -name "*.log"     # Найти все .log файлы в /var/log
find /home -type d              # Найти все папки в /home
find . -type f -size +10M       # Найти файлы больше 10MB

find . -name "*.log" | xargs rm   # Найти и удалить .log файлы
echo "file1 file2 file3" | xargs rm   # Удалить файлы через список

cut -d: -f1 /etc/passwd    # Вывести только имена пользователей
echo "hello world" | cut -c1-5   # Вывести первые 5 символов

sort file.txt         # Обычная сортировка
sort -r file.txt      # Обратная сортировка
sort -n numbers.txt   # Числовая сортировка

lscpu, top        # CPU
free              # Memory
df -h             # Disks
ifconfig          # Network
free, top         # RAM
top,ps            # Processes

ss, isof -i, netstat -tlnp, telnet <ip>         # Port
ping, curl                                      # remote host
mv <file> <path or new_name>                    # move file\rename
echo "smth" >> <file>                           # change
history | grep <word>                           # search
rm -r <name>       # remove dir
ssh keygen         # ssh
etc                # config
bash <name>        #  script start
uptime             # time work OS

# Add user and add to sudo group
sudo adduser vladoss | sudo userdel vladoss
sudo usermod -aG sudo vladoss | sudo deluser vladoss sudo
sudo user > root user

# Create file and change permissions for only sudo user access
nano file.txt, touch 
sudo chown silver:vlad file.txt
sudo chmod 700 file.txt


  
# Git
  
  
create branch - git checkout -b <name_branch>; 
create a new branch based on the remote branch - git checkout -b <new_branch_name> origin/<remote_branch_name>
delete branch - git branch -d <branch_name>
delete in remote repo - git push origin --delete <branch_name>

# Synchronize git 
synchronize - git fetch ;
  accept synchronize - git merge ;
update repo - git pull ;

connect to git - git remote add origin <ssh-key> ;
revers commit - git log, git revert <id> ;
  git reset --hard HEAD (все изменения + комит удаляются) ;
  git reset --hard HEAD~1 (все изменения + комит удаляются, перекидвает на прошлый комит) ;
  git reset --soft HEAD~1 (комит удаляется, но не изменения, перекидывает на прошлый комит) ;
  
check branch - git branch
copy - git checkout <name_branch> . (all) ;
  switch to desired branch ;
  paste - git add . ;
different - git diff,  git diff <commit1> <commit2>, git diff <commit> -- <file>, git diff <branch1> <branch2> ;
push - git push / git push origin <name_branch> ;
add - git add -A (file)

  
# Docker
  

search - docker search <name> ;
download - docker pull <name> ;
list - docker images -q;
  active imag - docker ps ; 
  all imag - docker ps -a
  
run interactive - docker run -it(interactive) -p (ports) <port:port> <name>
run - docker run -d(deamon) -p <ports:ports> <name>
  docker run --cpus=<volume,0.5> --memory=<volume, 512m> --storage-opt size=<volume, 1GB> -d -p <ports:ports> <name>
delete imag - docker rmi -f <id>
build - docker build -t <name:tag> . 
new tag - docker tag <name:tag> <name:tag>
 copy - docker commit <id> <name:tag>
 
login - docker ps 
  docker exec -it <container_id> /bin/bash
stop - docker stop <name or id>
stats - docker stats <name>
process - docker top <name>
  
# Volume
create - docker volume create <name>
add cont to vol - docker run -v <name_volume:path_in_cont name>
  path cont - docker inspect <name/id>

docker run -d --name test --cpus=0.5 --memory=8MB -p 7777:80 -v web:/app maks:latest
  
  
# Docker-compose 

 
list - docker-compose ps
login - docker-compose exec db bash
   createdb - createdb -U myuser -h localhost -p 5432 <name>
   backup - pg_dump -U myuser -d mydatabase -f <name_file>
   insertbackup - psql -U myuser -d newbd -f <name_file>
prosmotr - docker-compose exec db cat <file>

  
# SQL


 login - psql -h localhost -p 5444 -U myuser -d mydatabase


#Terraform


start - terraform init
plan - terraform plan
run - terraform apply
del - terraform destroy
count - if count 0 they delete all
replace resource - terraform -replace <name_resource>


# K8s


kubectl create: Створити ресурс (под, сервіс, конфігмап і т. д.).
kubectl apply: Застосувати конфігурацію з файлу або URL.
kubectl get: Отримати інформацію про ресурси (под, сервіс, реплікаційні контролери і т. д.).
kubectl describe: Отримати детальну інформацію про ресурс.
kubectl logs: Переглянути журнал виведення контейнера.
kubectl exec: Виконати команду в контейнері пода.
kubectl delete: Видалити ресурс.
kubectl scale: Змінити розмір реплікаційного контролера.
kubectl rollout: Керувати розгортанням ресурсу.
kubectl port-forward: Перенаправити порти з локального комп'ютера на под.
kubectl expose: Створити сервіс для ресурсу.


kubectl edit: Редагувати ресурс в реальному часі.
kubectl apply -f: Застосувати конфігурацію з файлу YAML.
kubectl get pods --all-namespaces: Отримати список всіх подів у всіх просторах імен.
kubectl describe pods <pod-name>: Отримати детальну інформацію про під зазначеним ім'ям.
kubectl logs <pod-name>: Переглянути журнал виведення піду зазначеним ім'ям.
kubectl exec -it <pod-name> -- /bin/bash: Виконати інтерактивний bash-сеанс в контейнері піду.
kubectl delete pod <pod-name>: Видалити під за зазначеним ім'ям.
kubectl get services: Отримати список усіх сервісів.
kubectl describe service <service-name>: Отримати детальну інформацію про сервіс за зазначеним ім'ям.
kubectl expose deployment <deployment-name> --type=NodePort: Створити сервіс для ресурсу деплоймента із типом NodePort.
kubectl scale deployment <deployment-name> --replicas=3: Змінити розмір реплікаційного контролера деплоймента на 3 репліки.


kubectl expose service prometheus-server --type=NodePort --target-port=9090 --name=prometheus-server-ext
kubectl expose service grafana --type=NodePort --target-port=3000 --name=grafana-ext
