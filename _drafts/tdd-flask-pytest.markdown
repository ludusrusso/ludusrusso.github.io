---
title: "TDD con Flask e PyTest per lo sviluppo di API REST"
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

Nella carriera di ogni buon programmatore, o di chiunque si definisce tale,
arriva un momento in cui ci si rende conto dell'importanza di implementare test
automatici di un codice. Nel mio caso, questo è successo nel momento in cui
la piattaforma che sto sviluppando per [HotBlack Robotics](http://www.hotblackrobotics.com)
è diventata abbastanza complessa che ogni mia modifica al codice causava
la rottura di un'altra parte della piattaforma, senza che io me ne rendessi conto.

Questo era dovuto al fatto che non sono mai stato un gran fan dello sviluppo di Test
automatici del codice, perchè credevo (come molti, da quello che ho visto) che fossero
solo un modo per rallentare lo sviluppo del codice.

All'interno di una startup, inoltre, in cui solitamente si tende a sperimentare
piuttosto che sviluppare sistemi robusti, vedo la scrittura dei test come
una perdita di tempo molto grande.

Ovviamente, se sto scrivendo questo articolo, è perchè ad un certo punto mi sono
trovato nella situazione in cui ho preferito reimplementare la piattaforma da zero
piuttosto che cercare di migliorarla (e rompendola).

Da allora, ho iniziato a studiare e ad applicare uno dei metodi più popolari (ma anche
meno capiti da chi, come me, si avvicina alla programmazione): cioè il Test Driven Development.

Ma andiamo con ordine.

## A che serve implementare test del codice?

Per quanto possa sembrare strano, lo scopo primario di un test non è testare, ma è
documentare.
Scrivere in modo ordinato e conciso i test del proprio codice rendono molto
semplice ai programmatori (e a noi stessi) capire cosa fa ogni pezzo di codice
che abbiamo testato.

Il secondo scopo dei test è, appunto, testare il codice.
Implementare dei test in modo continuo e lanciarli il più frequentemente possibile
ci permette di scoprire subito eventuali bug che vengono introdotti nel codice durante le modifiche.
Scrivere dei test quindi permette di implementare del codice più robosto, a discapito di uno
sviluppo leggermente rallentato.

Se infatti scrivere test vuol dire, solitamente, scrivere il doppio del normale codice
che implementeremmo senza test, è anche vero che, mano a mano che il programma cresce in dimensione,
i test riducono enormenente il tempo di debugging e di test manuali del programma stesso.
Ciò vuol dire che, a lungo andare, lo sviluppo viene velocizzato, non rallentato.

## Test Driven Development (TDD)

È importante, quindi, implementare dei test il più frequentemente possibile.
Istintivamente, i test dovrebbero essere scritti dopo lo sviluppo del codice stesso,
tuttavia, esiste una metodologia di sviluppo molto pragmanti e che (nel mio caso)
risulta essere molto efficiente: il **TDD (Test Driven Development)**.

**TDD** è una metodologia di sviluppo che necessita un po' di tempo per essere
padroneggiata, e che, nel momento in cui i programmatori ci si imbattono per la prima volta,
risulta essere molto inutile.

Il mantra principale del **TDD** è il seguente: *mai sviluppare codice se non abbiamo un test che fallisce!*.

L'idea del **TDD** è infatti che i test per un determinato pezzo di codice o funzionalità del nostro programma debbano essere scritti *prima* dell'implementaizone stessa. La parte di sviluppo del test è la prima parte di un *ciclo* del TDD (*red*).
Questa prima parte finisce nel momento in cui il test implementato viene eseguito: il test deve essere eseguito e quest **deve** fallire: se il test non fallisce vuol dire che qualcosa non va. Infatti, non avendo ancora implementato il codice che il test dovrebbe testare, è naturale che il test stesso fallisca.

Una volta che il test fallisce, passiamo alla seconda fase del ciclo (*green*) dove possiamo, finalmente, metterci a scrivere il codice che aggiusta il test.
Questo pezzo di codice deve essere implementato nel modo più semplice possibile, senza
intessarci troppo al fatto che il codice venga scritto bene. Dobbiamo cioè implementare **solo quel minimo pezzo di codice che fa passare il test**.
Una volta implemetato il codice, e possiamo lanciare l'intera suite di test implemetata fino
ad ora, e vedere se l'intera suite di test funziona. Se si, possiamo passare alla fase successiva, altrimenti dobbiamo risolvere i test che falliscono.

L'ultima fase del ciclo (*refactoring*) consiste nel migliorare il codice sviluppato, cercando di migliorarne la struttura. A questo punto, il ciclo di test riparte.


## I Vantaggi del TDD

Quando ho scoperto per la prima volta il TDD mi sembrava un'assurdità da nerd infomatici
precisini. Tuvvavia, ho voluto provare ad utilizzarla per un po', e adesso non riuscirei a farne a meno. Quando infatti mi capita di iniziare ad implementare del codice senza test (per fretta o perchè mi avvicino a nuove piattaforma che ancora non conosco bene), è come sentirmi nudo, in quanto so benissimo che i test mi proteggono da eventuali errori. Vediamo quindi quali sono i vantaggi di questa metogdologia:

1. Il TDD ci forza a testare la quasi totalità del codice che implementiamo. Questo ha due vantaggia:
  - Quasi tutti i bug che una modifica del codice introduce nelle funzionalità già implementate venogno scoperte all'istante, è anche molto facile risolvere perchè vengono automaticamente riprodotti.
  - Non dobbiamo avere paura di fare il refactoring (anche molto spinto) del codice implementato.
2. Come detto, tutti i test sono un'accurata documentazione del nostro codice. Ogni funzione che implementiamo viene documentata dai test, e questo ci aiuterà nel momento in cui ritorneremo a cercare di capire cosa fa del codice scritto un po' di tempo fa.
3. Il TDD ci forza a scrivere codice in modo semplice. A volte succede di avere la sensazione che implementare un certo codice in modo "più generico" di quanto serva al momento possa tornarci utile in futuro. Il TDD ci obbliga a sviluppare codice nel modo più semplice possilibe. Se poi in futuro il codice dovrà complicarsi, nessun problema, il TDD ci protegge da errori causati dal refactoring.
4. Le 3 fasi del TDD (red, green, refactor) sono molto veloci, e ci permettono di saltare da test a sviluppo in cicli di meno di un minuto. Questo permette al nostro cervello di essere più agile e di pensare in modo più focalizzato, invece che le normali fasi di sviluppo in cui si può stare anche ore dietro lo sviluppo del codice e poi altre ore dietro il debugging.


## Alcune note sul TDD

È importate sottolineare che il TDD non è una scienza esatta, e nemmeno una
tecnica che si padroneggia facilmente.

Molto spesso ci imbatteremo in pezzi di codice che sono difficilmente testabili.
Evitate in questi casi di fare il mio errore di perdere troppo tempo dietro allo sviluppo
di test difficilissimi da implementare.

Inoltre, ricordatevi che l'utilizzo del TDD va acquisito con il tempo. Specialmente
nei primi tempi, vi verrà istintivo buttarvi a scrivere codice. In questo caso, se veramente volete padroneggiare questa modo di sviluppare codice, conviene prendere una boccata d'aria e fermarsi quando ci si accorge di stare sviluppando senza avere un test che fallisce. Col tempo, verrà naturale mettersi a scrivere prima i test.

## Un caso pratico: sviluppiamo delle API in Flask usando il TDD

Ho scritto anche troppo, rispetto al mio solito. Vediamo come utilizzare questa metodologia
in un caso pratico: vogliamo sviluppare una semplice app Flask che ci permette di comunicare tramite API REST (in json).
Per semplicità, l'app al momento permetterà solamente di eseguire il Login
(utilizzando una tecnologia chiamata JWT) ed esporrà 3 **end point**:
 - `/login`: per loggarsi;
 - `/protected`: a cui si potrà accedere solo se loggati;
 - `/`: a cui si potrà accedere senza nessuna identificazione.

### Alcune note prima di iniziare

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

### Implementiamo il primo test

Ricordate il mantra del TDD? *Mai sviluppare se non si ha un test che fallisce*.
Questo vale anche quando si inizia lo sviluppo dell'app: scriviamo prima i test!

Creiamo un file `test.py` ed iniziamo ad implementare il test.

```python
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

## Fixture e le magie di PyTest

Come potete immaginare vedendo la funzione di test, è molto probabile che gli oggetti `app` e `client` debbano essere creati in ogni test che implementiamo.

In particolare, è un'esigenza comune dover eseguire del codice ogni volta che un test viene eseguito (ricordatevi che un test è ogni funzione). Fortunatamente **pyTest** ha una funzionalità molto molto utile chiamata **fixture**.

Essenzialmente, una **fixture** è una funzione che viene chiamata all'inizio di ogni test, il cui valore di ritorno viene
