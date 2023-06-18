from flask import Flask,render_template,request
import numpy as np
from tensorflow.keras.utils import load_img
from tensorflow.keras.utils import img_to_array
from keras.applications.efficientnet import preprocess_input
from keras.models import load_model

app = Flask(__name__)
model = load_model('saved_model/bird_test_case_5_d02.h5')
class_names = np.load('brids_class.npy',allow_pickle=True)
class_status = np.load('brids_status.npy',allow_pickle=True)

@app.route('/',methods=['GET'])
def hello_word():
    return render_template('index.html')

@app.route('/', methods=['POST'])
def predict():
    imagefile = request.files['imagefile']
    image_path = "./images/" + imagefile.filename
    imagefile.save(image_path)
    
    image =  load_img(image_path, target_size=(224,224))
    image = img_to_array(image)
    image = image.reshape((1,image.shape[0],image.shape[1],image.shape[2]))
    image = preprocess_input(image)
    yhat = model.predict(image)


    position = np.argmax(yhat) 
    label = class_names[position].title()
    status = class_status[position]
    value = yhat.max()

    classification = '%s %s (%.2f%%)' % (label,status,value*100)

    return  render_template('index.html', prediction = classification)  


if __name__ == '__main__':
    app.run(port=3000,debug=True)