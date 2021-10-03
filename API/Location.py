from pydantic import BaseModel
# 2. Class which describes Locatioin
class Location(BaseModel):
    state: str