```
docker build -t lang-chain-python .
```

login to docker account

```
docker login -u prajinprakash4u
```

tag docker image and push

```
docker tag lang-chain-python prajinprakash4u/lang-chain-python:1.0.0
docker tag lang-chain-python prajinprakash4u/lang-chain-python
docker push prajinprakash4u/lang-chain-python:1.0.0
docker push prajinprakash4u/lang-chain-python

```

