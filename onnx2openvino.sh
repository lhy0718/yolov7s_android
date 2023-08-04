# usage: sh onnx2openvino.sh

python3 /opt/intel/openvino_2021.3.394/deployment_tools/model_optimizer/mo.py \
 --input_model yolov7-tiny.onnx \
 --input_shape [1,3,640,640] \
 --output_dir ./openvino \
 --data_type FP32 \
 --output /model.77/m.0/Conv,/model.77/m.1/Conv,/model.77/m.2/Conv