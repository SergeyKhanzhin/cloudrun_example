from typing import Union

# import uvicorn
from fastapi import FastAPI

app = FastAPI()

version = 'V2'


@app.get("/")
async def root():
    return {"message": "Hello World"}


@app.get("/v1/is_value_in_range/")
async def is_value_in_range_v1(
        fieldname: Union[str, None] = None,
        expectedMin: int = 0,
        expectedMax: int = 0):
    # sleep(20)
    return {"message": f"I am {version} and checking {fieldname} for the range [{expectedMin}..{expectedMax}]"}


# if __name__ == "__main__":
#     uvicorn.run(app, host="0.0.0.0", port=8080)
