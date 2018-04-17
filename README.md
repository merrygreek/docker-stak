# Turtlecoin-stak
This is an XMR-Stak Docker container for the newest algo change for Turtlecoin (cryptonight-lite).

___

Add your own config files and build the image:

```docker build -t turtlecoin-stack .```

Then start a container:

```docker run -d turtlecoin-stack```

To be able to view stats via a browser be sure to map the port when starting the container:

```docker run -d -p 8080:8080 turtlecoin-stack```
