from fastapi import FastAPI

app = FastAPI()

@app.get("/")
def read_root():
    return {"Hello": "World"}

@app.get('/hello')
async def hello():
    return {"text": "hello world!"}

@app.get("/name/{name}")
def get_myname(name: str):
    return {"name": name}
