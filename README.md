#### How to start

- open a terminal with nodejs and docker installed
- `git clone git@github.com:robinlant/github-actions-playground.git`
- `cd github-actions-playground`
- `npm install`
- `npm run build`
- `docker build -t github-actions-playground .`
- `docker run --name name -p 5555:80 github-actions-playground`

Once the Docker container is running, you can access the application by navigating to http://localhost:5555 in your web browser.