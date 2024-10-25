#using the offical nodejs base image
From node:14

#set up the directory

WORKDIR /home/ipaco/web-application/frontend

#copy the package.json and package-lock.json files

COPY package*.json ./

#installing dependencies

RUN npn install

#COpy the rest of the application

COPY ..

# Build the application

RUN npn run build

# Using nginx to serve the application

FROM nginx:alpine

#Copy the content

COPY --from=0 /home/ipaco/web-application/frontend/dockerfile/build /usr/share/nginx/html

#Expose Port 80 to the outside world
EXPOSE 80

#start nginx

CMD ["nginx","-g","daemon off;"]



