import os

from fastapi import FastAPI


app = FastAPI(
    title="API Projeto Final",
    version="1.0.0",
)


@app.get("/")
def root() -> dict[str, str]:
    return {"message": "API funcionando"}


@app.get("/health")
def health() -> dict[str, str]:
    return {"status": "ok"}


@app.get("/info")
def info() -> dict[str, str]:
    return {
        "app": app.title,
        "version": app.version,
        "environment": os.getenv("APP_ENV", "development"),
    }
