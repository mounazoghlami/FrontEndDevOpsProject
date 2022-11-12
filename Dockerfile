FROM node : frontenddevops AS BUILD
WORKDIR /app
COPY package.json .
COPY package-lock.json .
RUN npm config set legacy-peer-deps true
RUN npm install
COPY . .
RUN npm run build 

FROM nginx:latest
COPY --from=BUILD /app/dist/crudtuto-Front /usr/share/nginx/html
EXPOSE 80