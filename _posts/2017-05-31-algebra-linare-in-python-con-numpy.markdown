---
title: "Algebra linare in Python con numpy"
layout: post
date: 2017-05-31
image: 
headerImage: false
tag:
 - Numpy
 - Algebra
 - Python
category: blog
redirect_from:
 - /posts/2017-05-31-algebra-linare-in-python-con-numpy
author: ludusrusso
description: 
---

Scrivo questo post come introduzione all'utilizzo di Python per per l'algebra lineare. Nella robotica, ed in particolare nella robotica industriale, l'algebra lineare è uno strumento basilare per descrivere e controllare il movimento del robot.

Scopo di questo tutorial è sia fornire una base teorica sull'algebra lineare, sia mostrare come è possibile utilizzare python per svolgere calcoli matematici.

## La libreria numpy

Numpy è una libreria molto potente implementata in python per la gestione dei numeri.

Per utilizzare la libreria, dobbiamo installarla utilizzando pip, eseguendo il comando

```python
(alg)$ pip install numpy
```

## Vettori

Non voglio tediarvi descrivendovi il concetto matematico di Vettore (che mi obbliga a introdurre cose astrattissime come gli spazi vettoriali e simili). Sappiate solo che un vettore, in uno spazio ad N dimensioni, è definito come una lista di numeri posti in una colonna:

$$
{\bf{v}} = \begin{pmatrix}v_1 \\ v_2 \\ \vdots \\ v_n\end{pmatrix} \in \mathbb{R}^N,
$$

dove $v_1$, $v_2$ fino a $v_n$ sono $N$ numeri.


Per definire un vettore in nunpy, usiamo il seguente comando:

```python
import numpy as np

v = np.array( ( 0.5,2.2,0.0 ) )
```

Questo codice genera un vettore 

$$
{\bf{v}} = \begin{pmatrix} 0.5 \\ 2.2 \\ 0.0 \end{pmatrix} \in \mathbb{R}^3
$$

###Operazioni tra vettori
####Moltiplicare uno scalare per un vettore

Un vettore può essere moltiplicato per un numero (scalare):

$$
a \cdot {\bf{v}} = \begin{pmatrix}av_1 \\ av_2 \\ \vdots \\ av_n\end{pmatrix}, \text{con } a \in\mathbb{R}.
$$

Questa operazione si traduce in Python semplicemente con

```python
a = 10
r = a*v
print r
# result: [  5.  22.   0.]
```

####Somma e differenza tra vettori

Due vettori della stessa dimensione possono essere sommati e sottrati. Somma e differenza sono definite come segue:

$$
{\bf{v}}\pm{\bf{w}} = \begin{pmatrix}v_1\pm w_1 \\ v_2 \pm w_2 \\ \vdots \\ v_n \pm w_n\end{pmatrix} \in \mathbb{R}^N, \text{con } {\bf{v}}, {\bf{w}}\in \mathbb{R}^N
$$

Le due operazioni sono banali in Python

```python
w = np.array( (5.0, 2.0, 4.3) )
print v+w
print v-w
# result: [ 5.5  4.2  4.3]
#         [-4.5  0.2 -4.3]
```

####Prodotto scalare
Il prodotto scalare tra due vettore è un'operazione che restituisce uno scalare. Questo è definito nel seguente modo:

$$
{\bf{v}}\cdot{\bf{w}} = \sum_iv_iw_i
$$

In python, questo è implementato dalla funzione `np.dot`

```python
print np.dot(v,w)
# result: 6.9
```
