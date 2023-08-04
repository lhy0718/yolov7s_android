# usage: source export.sh

INPUT_SIZES=(320 640)

#yolov7-tiny yolov7 yolov7x yolov7-w6 yolov7-e6 yolov7-d6 yolov7-e6e
MODEL_NAME=yolov7-e6

for i in ${INPUT_SIZES[@]}; do
    python3 /opt/intel/openvino_2021.3.394/deployment_tools/model_optimizer/mo.py \
        --input_model yolov7/${MODEL_NAME}_${i}.onnx \
        --input_shape [1,3,${i},${i}] \
        --output_dir ./openvino \
        --data_type FP32 \
        --output /model.140/m.0/Conv,/model.140/m.1/Conv,/model.140/m.2/Conv,/model.140/m.3/Conv

    source /opt/intel/openvino_2021/bin/setupvars.sh

    export PYTHONPATH=/opt/intel/openvino_2021/python/python3.6/:$PYTHONPATH
    openvino2tensorflow \
        --model_path ./openvino/${MODEL_NAME}_${i}.xml \
        --model_output_path tflite \
        --output_pb \
        --output_saved_model \
        --output_no_quant_float32_tflite 

    mv tflite/model_float32.tflite tflite/${MODEL_NAME}_fp32_${i}.tflite

    python3 convert_model/quantize.py \
        --input_size $i \
        --pb_path tflite/model_float32.pb \
        --output_path tflite/${MODEL_NAME}_int8_${i}.tflite \
        --calib_num 100 \
        --download_tfds

done
