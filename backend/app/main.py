from fastapi import FastAPI
from app.celery_worker import run_r
from datetime import datetime

from db.database import db_context

from db.models import Base, Task
from db.database import engine
Base.metadata.create_all(bind=engine)

from starlette.middleware.cors import CORSMiddleware

app = FastAPI()

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

@app.get("/result") #user가 result로 접속했을 때 task id를 입력하도록 함
async def get_task(task_id: str):
    with db_context() as s:  #db에서 task id에 해당하는 걸 가져와 반환함  (실행중이면 run 아니면 done?)
        t = s.query(Task).filter(Task.task_id == task_id).first()
    return t


@app.get("/plot")
async def plot_map(fyear: int, fmonth: int, fday:int, uyear:int, umonth:int, uday:int):
    job = run_r.apply_async([fyear,fmonth,fday,uyear,umonth,uday])
    with db_context() as s:
        t = Task(status="running", start_date=datetime.now(), task_id=job.id)
        s.add(t)
        s.commit()
        s.refresh(t)
    return t




# from typing import Union

# from fastapi import FastAPI

# app = FastAPI()


# @app.get("/")
# def read_root():
#     return {"Hello": "World"}


# @app.get("/items/{item_id}")
# def read_item(item_id: int, q: Union[str, None] = None):
#     return {"item_id": item_id, "q": q}