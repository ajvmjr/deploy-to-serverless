from fastapi import FastAPI
from classes.Email import Email

app = FastAPI()

db = []

db.append("maria@mail.com")
db.append("alex@mail.com")

@app.get("/emails")
def get():
    return db
  
@app.get("/emails/{email}")
def get_by_email(email):
    if email in db:
        return email
        
    return { "error": "Email not found" }
        
@app.post("/emails")
def create_email(payload: Email):    
    if payload.email in db:
        return { "error": "Email already exists" }
    
    db.append(payload.email)
    
    return { "success": "Email created" }

@app.delete("/emails/{email}")
def delete_user(email):
    for idx, item in enumerate(db):
        if item == email:
            del db[idx]
            return { "success": "Email deleted" }
        
    return { "error": "Email not found" }
    
    