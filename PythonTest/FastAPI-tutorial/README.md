# Python-Test

---

### FastAPI-tutorial

-   PyCharm IDE 설치
-   프로젝트 생성
-   FastAPI 설치

```bash
pip3 install fastapi uvicorn
```

-   튜토리얼 코드 작성

```python
from typing import Optional
from fastapi import FastAPI

app = FastAPI()


@app.get("/")
def read_root():
    return {
        "Hello": "World"
    }


@app.get("/items/{item_id}")
def read_item(item_id: int, q: Optional[str] = None):
    return {
        "item_id": item_id,
        "q": q
    }
```

-   FastAPI 실행

```bash
uvicorn main:app --reload
```

