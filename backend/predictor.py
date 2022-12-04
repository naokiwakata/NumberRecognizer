from nnabla.utils import nnp_graph
import cv2
from PIL import Image
import numpy as np


class Predictor:
    _predictor = None
    _x = None
    _y = None

    def __init__(self):
        # モデル読み込み
        model_path = "result.nnp"
        nnp = nnp_graph.NnpLoader(model_path)

        # 推論用ニューラルネットワークを取得
        graph = nnp.get_network('MainRuntime', batch_size=1)

        # 入力変数の取得
        self._x = list(graph.inputs.values())[0]
        self._y = list(graph.outputs.values())[0]

    def predict(self, img):
        cv2.imwrite('predict.jpg', img=img)
        img = Image.open('predict.jpg').convert('L')
        img.thumbnail((28, 28))  # 28*28に変換
        img.save('28-28.jpg')
        img = np.array(img)
        self._x.d = img

        # 推論実行
        self._y.forward()
        return self._y.d
