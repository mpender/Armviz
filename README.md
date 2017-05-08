#Armviz container
# All credit to https://github.com/ytechie/AzureResourceVisualizer
# This is merely a method to have it in a container

Example:  docker run -d  -p 3000:3000 -p 3001:3001 armviz:latest

Exposes Armviz and Bower on ports 3000 and 3001

I use /tmp as a dumping ground only (feel free to use the dockerfile to change it however you want)

You can map /tmp/AzureResourceVisualizer/.tmp to a host volume to persist files uploaded

NPM is quite large so its balloons the size of the image, I will work on to reduce the size and scope of the image
