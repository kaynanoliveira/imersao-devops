FROM python:3.13.5-alpine3.22

# Define o diretório de trabalho no contêiner para /app
WORKDIR /app

# Copia o arquivo de dependências para o diretório de trabalho
COPY requirements.txt .

# Instala as dependências listadas no requirements.txt
# A flag --no-cache-dir desativa o cache do pip, reduzindo o tamanho da imagem.
RUN pip install --no-cache-dir -r requirements.txt

# Copia o restante do código da aplicação para o diretório de trabalho
COPY . .

# Expõe a porta 8000 para permitir a comunicação com a aplicação
EXPOSE 8000

# Comando para executar a aplicação usando o servidor Uvicorn
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]
