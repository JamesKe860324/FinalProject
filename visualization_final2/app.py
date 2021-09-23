from flask import Flask, render_template, request
from flask_wtf import FlaskForm
from wtforms import StringField, SubmitField, RadioField
from wtforms.validators import DataRequired


app = Flask(__name__)


# practice start
app.config['SECRET_KEY'] = 'hard to guess string'


@app.route('/')
def index():
    return render_template('home.html')

@app.route('/home')
def home():
    return render_template('home.html')

@app.route('/predict_newTaipei')
def predict_new_taipei():
    return render_template('predict_newTaipei.html')

@app.route('/predict_district')
def predict_district():
    return render_template('predict_district.html')

@app.route('/loan')
def loan():
    return render_template('loan.html')

# <!-- district-->
@app.route('/district_Jinshan')
def district_Jinshan():
    return render_template('district_Jinshan.html')

@app.route('/district_Wanli')
def district_Wanli():
    return render_template('district_Wanli.html')

@app.route('/district_Sanzhi')
def district_Sanzhi():
    return render_template('district_Sanzhi.html')

@app.route('/district_Danshui')
def district_Danshui():
    return render_template('district_Danshui.html')

@app.route('/district_Bali')
def district_Bali():
    return render_template('district_Bali.html')

@app.route('/district_Linkou')
def district_Linkou():
    return render_template('district_Linkou.html')

@app.route('/district_Wugu')
def district_Wugu():
    return render_template('district_Wugu.html')

@app.route('/district_Taishan')
def district_Taishan():
    return render_template('district_Taishan.html')

@app.route('/district_Luzhou')
def district_Luzhou():
    return render_template('district_Luzhou.html')

@app.route('/district_Sanchong')
def district_Sanchong():
    return render_template('district_Sanchong.html')

@app.route('/district_Xinzhuang')
def district_Xinzhuang():
    return render_template('district_Xinzhuang.html')

@app.route('/district_Shulin')
def district_Shulin():
    return render_template('district_Shulin.html')

@app.route('/district_Yingge')
def district_Yingge():
    return render_template('district_Yingge.html')

@app.route('/district_Tucheng')
def district_Tucheng():
    return render_template('district_Tucheng.html')

@app.route('/district_Sanxia')
def district_Sanxia():
    return render_template('district_Sanxia.html')

@app.route('/district_Wulai')
def district_Wulai():
    return render_template('district_Wulai.html')

@app.route('/district_Banqiao')
def district_Banqiao():
    return render_template('district_Banqiao.html')

@app.route('/district_Yonghe')
def district_Yonghe():
    return render_template('district_Yonghe.html')

@app.route('/district_Zhonghe')
def district_Zhonghe():
    return render_template('district_Zhonghe.html')

@app.route('/district_Xindian')
def district_Xindian():
    return render_template('district_Xindian.html')

@app.route('/district_Shenkeng')
def district_Shenkeng():
    return render_template('district_Shenkeng.html')

@app.route('/district_Xizhi')
def district_Xizhi():
    return render_template('district_Xizhi.html')

#-----


if __name__ == "__main__":
    app.run(debug=True)
