

## Using Nginx with Docker
---

### Run Nginx Container

```bash
docker run -d -p 80:80 nginx
```

- `-d` is for detached mode, which runs the container in the background and frees up the terminal.

---

### Setting Docker Alias (Windows Users)

```bash
alias docker="winpty docker"
```

- This alias is useful for Windows users to enable a pseudo-TTY, which Docker needs for the `exec` command.

---

### Connect to Running Container

```bash
docker exec -it 5e6c470411b2 sh
```

- Use `docker exec -it` followed by the container ID to connect to the running container via shell (`sh`).

---

### Update and Install Packages Inside the Container

Enter the following commands to update packages and install `nano` and `sudo`.

```bash
apt update -y
apt upgrade -y
apt install nano
apt install sudo
```

---

### Edit Nginx `index.html`

Navigate to the Nginx default HTML directory:

```bash
cd /usr/share/nginx/html
```

Open `index.html` with `nano`:

```bash
nano index.html
```

- Make your desired changes to the file.

---

### See the Updated Web Page

After saving your changes in `nano`, simply refresh the Nginx web page in your browser to see the updated version.

![](updated_nginx.PNG)

---

## Creating docker image 

1. Create a new directory on your local machine, for example, named `my-nginx-profile`.
    ```bash
    mkdir my-nginx-profile && cd my-nginx-profile
    ```
2. Create a file named index.html enter what you want.
 
3. Create a `Dockerfile` in `my-nginx-profile` with the following content:
    ```
    FROM nginx
    COPY index.html /usr/share/nginx/html
    ```
4. Build the Docker image:
    ```bash
    docker build -t your-docker-username/my-nginx-profile:latest .
    ```
![](building.PNG)

### Push to Docker Hub
1. Log in to Docker Hub from the command line if you haven't already:
    ```bash
    docker login
    ```
2. Push the image:
    ```bash
    docker push your-docker-username/my-nginx-profile:latest
    ```

Replace `your-docker-username` with the username you chose when you created your Docker account. Now your customized Nginx image will be available on Docker Hub, and you can pull it or run containers from it on any machine.

![](push.PNG)