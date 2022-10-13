# Passenger + Ruby on rails + Nginx

## Setup
- `vagrant up` # Launch vagrant machine
- `vagrant ssh` # Login to the VM

### Manual steps
Comment default nginx server
```
# path /etc/nginx/sites-available/default
#listen 80 default_server;
#listen [::]:80 default_server;
```