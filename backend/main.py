import base64
import cv2
import numpy as np
from flask import Flask, make_response, request, jsonify
from flask_cors import CORS
from predictor import Predictor

app = Flask(__name__)
CORS(app)


@app.route("/recognize_number", methods=['GET', 'POST'])
def recognizeNumber():
    # jsonからimgを取り出す
    data = request.get_json()
    post_img = data['post_img']
    img_binary = base64.b64decode(post_img)
    img_array = np.asarray(bytearray(img_binary), dtype=np.uint8)
    img = cv2.imdecode(img_array, 1)
    img = img[20: img.shape[0]-20, 20: img.shape[1]-20]  # トリミング
    cv2.imwrite('original.jpg', img)

    # 色反転
    invertedColorImg = cv2.bitwise_not(img)
    # グレースケールに変換
    greysSaleImg = 0.299 * invertedColorImg[:, :, 0] + 0.587 * \
        invertedColorImg[:, :, 1] + 0.114 * invertedColorImg[:, :, 2]

    # 予測
    predictor = Predictor()
    result = predictor.predict(greysSaleImg)

    # 予測結果取り出す
    predictedNumber = np.argmax(result)
    print(f'予測結果は{predictedNumber}です')

    response = {'result': int(predictedNumber)}
    print(response)
    return make_response(jsonify(response))


if __name__ == "__main__":
    app.debug = True
    app.run(host='127.0.0.1', port=5000, threaded=True)
