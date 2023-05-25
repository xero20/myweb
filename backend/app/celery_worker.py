from app.celery_app import celery_task
from db.database import db_context
from db.models import Task
from datetime import datetime

@celery_task.task
def run_r(fyear,fmonth,fday,uyear,umonth, uday):
    #import time
    from datetime import datetime,timedelta
    sdate = datetime(fyear,fmonth,fday)
    edate = datetime(uyear,umonth,uday)
    period = (edate-sdate).days

    if period <= 0:
        print("시작날짜는 종료날짜의 이전이어야 합니다.\nStart date must precede the end date.")
        return 
    # sdate + timedelta(days=1)

    import os
    os.system(f'Rscript R/practice.R {fyear} {fmonth} {fday} {uyear} {umonth} {uday}')

    l=[]  
    from base64 import b64encode

    # for i in range(period+1):
    #     sdate+=timedelta(days=1) 
    #     img = open("f../R/image/{sdate}_pm25.svg",'rb')
    #     l.append(b64encode(img.read()).decode("utf-8"))

    
      
    img = open("../R/image/exapmle_image.svg",'rb')
    l.append(b64encode(img.read()).decode("utf-8"))



    with db_context() as s:
        task = s.query(Task).filter(Task.task_id == run_r.request.id).first()
        task.status = "finished"
        task.result = l
        task.end_date = datetime.now()
        s.commit()

    return l