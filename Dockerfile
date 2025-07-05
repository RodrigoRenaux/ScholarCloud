FROM python:3.13.5-alpine3.22

#Define o diretório de trabalho dentro do contêiner como /app. Isso organiza melhor os arquivos do projeto.
WORKDIR /app

#Copia o arquivo requirements.txt (onde você deve listar as dependências do seu projeto) para o diretório de trabalho.
COPY ./requirements.txt /app/requirements.txt

#Instala as dependências listadas no requirements.txt. O uso de --no-cache-dir reduz o tamanho da imagem final, e --upgrade garante que as dependências estejam atualizadas.
RUN pip install --no-cache-dir --upgrade -r /app/requirements.txt

#Copia todo o diretório ellis para dentro do contêiner. Certifique-se de que este diretório contém seu arquivo app.py e outros módulos do projeto.
COPY . .

#Informa que o contêiner irá expor a porta 8000, onde a aplicação estará rodando.
EXPOSE 8000

#Define o comando padrão para iniciar a aplicação quando o contêiner for executado. Aqui, usamos o uvicorn (um servidor ASGI) para rodar sua aplicação FastAPI.
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]