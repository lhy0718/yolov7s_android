# usage: sh quantization.sh

export FORMAT=float32

python3 ./convert_model/quantize.py \
--input_size 640 \
--pb_path /workspace/tflite/model_${FORMAT}.pb \
--output_path /workspace/tflite/model_${FORMAT}_quantized.tflite \
--calib_num 100 \
--download_tfds