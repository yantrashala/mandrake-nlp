# mandrake.ai - Open Source Chatbot Platform - NLP Engine


## Setup

### Docker
[Docker](https://www.docker.com/) is required to build and start mandrake. Click here for [setup instructions](https://docs.docker.com/engine/installation/)

#### Checkout code
```
git clone https://github.com/yantrashala/mandrake-nlp.git
```
#### Build Mandrake
```
cd mandrake-nlp
docker-compose build
```

#### Start servers
```
docker-compose up -d
```

#### Test
```
## RASA_QUERY_POST
curl -X "POST" "http://localhost:5000/parse" \
     -H "Content-Type: text/plain; charset=utf-8" \
     -d $'{
  "q": "show me a mexican place in the centre"
}'
```
