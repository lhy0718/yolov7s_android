# yolov7s_android

## Docker build
```sh
git clone --recursive https://github.com/lp6m/yolov5s_android
cd yolov5s_android
docker build ./ -f ./docker/Dockerfile  -t yolov7s_android
docker run -it --gpus all -v `pwd`:/workspace yolov5s_android bash
```