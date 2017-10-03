---
title: "TDD con Flask e PyTest per lo sviluppo di API REST. Lezione 1"
layout: post
date: 2017-09-28
#image: /assets/screen-shot.png
headerImage: false
tag:
  - Python
  - Test Driver Development
  - Flask
  - PyTest
category: blog
author: ludusrusso
description: Tutorial su come usare il Test Driver Development (TDD) con Flask e PyTest per sviluppare delle semplici API REST
---

## Un caso pratico: sviluppiamo delle API in Flask usando il TDD

Ho scritto anche troppo, rispetto al mio solito. Vediamo come utilizzare questa metodologia
in un caso pratico: vogliamo sviluppare una semplice app Flask che ci permette di comunicare tramite API REST (in json).
Per semplicità, l'app al momento permetterà solamente di eseguire il Login
(utilizzando una tecnologia chiamata JWT) ed esporrà 3 **end point**:
 - `/login`: per loggarsi;
 - `/protected`: a cui si potrà accedere solo se loggati;
 - `/`: a cui si potrà accedere senza nessuna identificazione.

### Alcune note

Nonostante questa applicazione può sembrare semplice, in realtà la base di questa
di questa applicazione verrà ripresa in seguito da me per un progetto che sto sviluppando
chiamato **Flask-IoT**. L'idea di questa applicazione è quella di sviluppare un
server IoT basato su Flask che permetta a dispositivi connessi (basati su Raspberry Pi),
di inviare dati ad un database.

Inoltre, nonostante la disponibilità di estensioni di Flask molto che potrebbero essere
utili per lo sviluppo di questa applicazione, la mia idea è di svilupparla senza usare troppi
framework già pronti, in piena filosofia *Flask*, che da al programmatore la piena livertà di
scelta nello sviluppo.

Per ultimo, utilizzerò [**PyTest**](https://docs.pytest.org/en/latest/) come framework per lo sviluppo dei test.

### Iniziamo: Setup dell'ambiente di sviluppo

```
$ mkdir flask-tdd-tutorial && cd flask-tdd-tutorial
$ virtualenv -ppython3 env
$ source env/bin/activate
```

Notare il parametro `-ppython3` che forza l'ambiente virtuale ad utilizzare Python 3.

### Implementiamo il primo test

Ricordate il mantra del TDD? *Mai sviluppare se non si ha un test che fallisce*.
Questo vale anche quando si inizia lo sviluppo dell'app: scriviamo prima i test!

Creiamo un file `test.py` ed iniziamo ad implementare il test.

```python
# file test.py

from app import create_app

def test_app_runs():
    app = create_app()
    client = app.test_client()
    res = client.get('/')
    assert res.status_code == 200
```

Come vedete, il test non è altro che una semplice funzione

# TODO: Write

Per lanciare il test, dobbiamo prima di tutto installare il pacchetto *pytest*. Inoltre, sabbiamo che utilizzeremo *Flask*, quindi installiamo anche quest pacchetto.

```
(env)$ pip install pytest flask
```

e quindi lanciare il comando `pytest test.py`

```bash
$ pytest test.py
============================= test session starts ==============================
platform darwin -- Python 2.7.12, pytest-3.2.2, py-1.4.34, pluggy-0.4.0
rootdir: /Users/ludus/develop/github/flask-tdd-tutorial, inifile:
collected 0 items / 1 errors

==================================== ERRORS ====================================
___________________________ ERROR collecting test.py ___________________________
ImportError while importing test module '/Users/ludus/develop/github/flask-tdd-tutorial/test.py'.
Hint: make sure your test modules/packages have valid Python names.
Traceback:
test.py:1: in <module>
    from app import create_app
E   ImportError: No module named app
!!!!!!!!!!!!!!!!!!! Interrupted: 1 errors during collection !!!!!!!!!!!!!!!!!!!!
=========================== 1 error in 0.11 seconds ============================
```

Il primo test fallisce! Dobbiamo essere contenti: possiamo iniziare a sviluppare.
Vediamo gli errori che vengono generati, e cerchiamo di risolverli nel modo più
banale possibile.

Il primo errore lo abbiamo su `from app import create_app`, causato dal fatto che non esiste un modulo `app` (`ImportError: No module named app`).

Risolviamolo: creiamo un file `app.py` e rilanciamo il test.

```
============================= test session starts ==============================
platform darwin -- Python 2.7.12, pytest-3.2.2, py-1.4.34, pluggy-0.4.0
rootdir: /Users/ludus/develop/github/flask-tdd-tutorial, inifile:
collected 0 items / 1 errors

==================================== ERRORS ====================================
___________________________ ERROR collecting test.py ___________________________
ImportError while importing test module '/Users/ludus/develop/github/flask-tdd-tutorial/test.py'.
Hint: make sure your test modules/packages have valid Python names.
Traceback:
test.py:1: in <module>
    from app import create_app
E   ImportError: cannot import name create_app
!!!!!!!!!!!!!!!!!!! Interrupted: 1 errors during collection !!!!!!!!!!!!!!!!!!!!
```

Adesso otteniamo l'errore `cannot import name create_app`: perchè il nostro modulo non definisce la funzione `create_app`.

Aggiustiamolo definendo la verisone `create_app` nel modo più stupido possibile:

```
# file app.py

def create_app():
    pass
```

Si esatto, so già che avrò altri errori oltre a questo, ma l'idea del TDD è proprio questa: risolviamo un errore alla volta (nel modo più semplice possibile).

Lanciamo il test:

```
$ python -m pytest test.py
============================= test session starts ==============================
platform darwin -- Python 2.7.12, pytest-3.2.2, py-1.4.34, pluggy-0.4.0
rootdir: /Users/ludus/develop/github/flask-tdd-tutorial, inifile:
collected 1 item

test.py F

=================================== FAILURES ===================================
________________________________ test_app_runs _________________________________

    def test_app_runs():
        app = create_app()
>       client = app.test_client()
E       AttributeError: 'NoneType' object has no attribute 'test_client'

test.py:5: AttributeError
=========================== 1 failed in 0.03 seconds ===========================
```

Ok, le cose migliorano: il test si lamente dal fatto che la variabile `app` è non definita, e quindi non possiamo chiamare la funzione `app.test_client()`. Rosolviamolo facendo tornare alla funzione `create_app` un qualcosa di più interessante (magari un'app Flask?).

```python
# file app.py

from flask import Flask

def create_app():
    app = Flask(__name__)
    return app
```

E rilanciamo il test

```
$ python -m pytest test.py
============================= test session starts ==============================
platform darwin -- Python 2.7.12, pytest-3.2.2, py-1.4.34, pluggy-0.4.0
rootdir: /Users/ludus/develop/github/flask-tdd-tutorial, inifile:
collected 1 item

test.py F

=================================== FAILURES ===================================
________________________________ test_app_runs _________________________________

    def test_app_runs():
        app = create_app()
        client = app.test_client()
        res = client.get('/')
>       assert res.status_code == 200
E       assert 404 == 200
E        +  where 404 = <Response streamed [404 NOT FOUND]>.status_code

test.py:7: AssertionError
```


Ok, le cose migliorano. Il test non fallisce più, ma da un errore sul nostro primo `assert`. In particolare, l'url `/` ritorna un errore *404 (not found)* invece che il codice di successo (200). Il modo migliore per risolverlo? Definiamo una route su `/`.

```python
# file app.py

from flask import Flask

def create_app():

    app = Flask(__name__)

    @app.route('/')
    def index():
        return ''

    return app
```

Codice un po' brutto vero? Personalmente non adoro definire una route dentro `create_app`, ma non preoccupiamoci ora. Notare che la funzione ritorna una stringa vuota: attualmente stiamo risolvendo l'errore 404, non il messaggio nella risposta HTML.

Lanciamo il test...

```
$ python -m pytest test.py
============================= test session starts ==============================
platform darwin -- Python 2.7.12, pytest-3.2.2, py-1.4.34, pluggy-0.4.0
rootdir: /Users/ludus/develop/github/flask-tdd-tutorial, inifile:
collected 1 item

test.py .

=========================== 1 passed in 0.10 seconds ===========================
```

Evviva! Il test è passato. Abbiamo concluso la seconda fase del ciclo (green). Al momento potremmo fare il refactoring del codice, ma è ancora troppo acerbo per preoccuparcene... Però possiamo migliorare i test!

## Fixture e le magie di PyTest

Come potete immaginare vedendo la funzione di test, è molto probabile che gli oggetti `app` e `client` debbano essere creati in ogni test che implementiamo.

In particolare, è un'esigenza comune dover eseguire del codice ogni volta che un test viene eseguito (ricordatevi che un test è ogni funzione). Fortunatamente **pyTest** ha una funzionalità molto molto utile chiamata **fixture**.

Essenzialmente, una **fixture** è una funzione che viene chiamata all'inizio di ogni test, il cui valore di ritorno viene passato automatica alle funzioni che lo richiedono.

Implementare una fixture è semplicissimo: basta decorare una funzione.

Partiamo dall'inizio:
è molto probabile che ogni nostro test che implementeremo utilizzerà l'oggetto `app`.
Possiamo quindi farlo diventare una fixture, implementando la seguente funzione:

```python
import pytest

@pytest.fixture
def app():
    _app = create_app()
    return _app
```

Per non fare confusioni, ho chiamato la funzione `app`, mentre l'oggetto che questa
funzione ritorna `_app`. Capirete dopo perchè questa differenza.

Adesso viene il bello delle fixture: ogni funzione di test che avrà come argomento
`app` (nome della funzione), chiemerà automaticamente questa fixture, e il valore di
ritorno della fixture sarà passato all'argomento della funzione di test.

Nei test Flask, avremo molto spesso bisogno anche della variabile `client`, creiamo quindi una fixture anche per questo:

```python
@pytest.fixture
def client(app):
    _client = app.test_client()
    return _client
```

Si noti che questa seconda fixture implementata dipende dalla precedente, perchè
riceve un parametro chiamato (appunto) `app`.

Ok, ora possiamo reimplementare la vecchia funzione `test_app_runs` come segue:

```python
def test_app_runs(client):
    res = client.get('/')
    assert res.status_code == 200
```

Semplice, no?

Ok, fatto questo, la nuova verisone del file `test.py` dovrebbe essere questa:

```python
# file test.py

from app import create_app
import pytest

@pytest.fixture
def app():
    _app = create_app()
    return _app

@pytest.fixture
def client(app):
    _client = app.test_client()
    return _client

def test_app_runs(client):
    res = client.get('/')
    assert res.status_code == 200
```

Abbiamo appena finito di fare refactoring del nostro codice (si, non è il refactoring "standard") del codice di produzione, ma del codice di test. Ma parliamo sempre di refactoring.

Lanciamo il test e controlliamo che questo vada bene. Abbiamo concluso il nostro primo ciclo di TDD. Passiamo al ciclo successivo.
