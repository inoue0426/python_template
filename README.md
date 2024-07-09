# python_template

## Environment

Our experiment was conducted on Ubuntu with an NVIDIA A100 Tensor Core GPU.  
If you want to re-train model, we reccomend to use GPU.

## Installation using Docker

```shell
git clone git@github.com:inoue0426/python_template.git
cd drGAT
docker run -it -p 9999:9999 tmp:latest
docker build -t tmp:latest .
```

Then access to http://localhost:9999/
