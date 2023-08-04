# usage: source openvino2tflite.sh

source /opt/intel/openvino_2021/bin/setupvars.sh
export PYTHONPATH=/opt/intel/openvino_2021/python/python3.6/:$PYTHONPATH
openvino2tensorflow \
--model_path ./openvino/yolov7-tiny.xml \
--model_output_path tflite \
--output_pb \
--output_saved_model \
--output_no_quant_float32_tflite 