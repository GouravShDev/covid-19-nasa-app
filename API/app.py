# 1. Library imports
import uvicorn
from fastapi import FastAPI
from Location import Location
import numpy as np
import pickle
import pandas as pd
# 2. Create the app object
app = FastAPI()
pickle_in = open("classifier.pkl","rb")
classifier=pickle.load(pickle_in)


# 3. Index route, opens automatically on http://127.0.0.1:8000

@app.get('/')
def index():
    return {'message': 'Hello, World'}

# 3. Expose the prediction functionality, make a prediction from the passed
#    JSON data and return the predicted Bank Note with the confidence
@app.post('/predict')
def predict(data:Location):
    data = data.dict()
    lon=data['lon']
    lat=data['lat']
    return {'prediction' : 2}
    # prediction = classifier.predict([[lon,lat,]])
    # if(prediction[0]>0.5):
    #     prediction="Fake note"
    # else:
    #     prediction="Its a Bank note"
    # return {
    #     'prediction': prediction
    # }

# 5. Run the API with uvicorn
#    Will run on http://127.0.0.1:8000
if __name__ == '__main__':
    uvicorn.run(app, host='127.0.0.1', port=8000)
    
#uvicorn app:app --reload