---
title: "Un IDE web Arduino sviluppato in Python e Flask"
layout: post
date: 2017-01-06
image: https://raw.githubusercontent.com/ludusrusso/images/master/arduino-rasp-web/main.jpg
headerImage: false
tag:
 - Tutorials
 - Raspberry-Pi
 - Arduino
category: blog
author: ludusrusso
description: Un mio progetto dell'estate del 2015 che permette di programmare Arduino da un'interfaccia Web esposta da un Raspberry Pi
---

<div class="post-body">
    <p>Solitamente, quando devo imparare ad utilizzare una nuova tecnologia, cerco di inventarmi un progetto interessante che potrebbe essere sviluppato con questa tecnologia e mi impegno a portarlo avanti fino alla fine. Quando ho iniziato ad interessarmi a Flask e Python, ho ideato il progetto che vi presento oggi, proprio per motivarmi ad imparare ad utilizzare bene questa libreria.</p>

<p><img src="https://raw.githubusercontent.com/ludusrusso/images/master/arduino-rasp-web/main.jpg" alt="main"></p>

<h2>Idea e Sviluppo</h2>

<p>L'idea di base era quella di sviluppare un semplice IDE web per Arduino, che mi permettesse di sviluppare codice su un Arduino direttamente connesso ad un Raspberry Pi (ormai sapete che utilizzo tantissimo entrambi questi Hardware), ma senza la scomodità di dover utilizzare direttamente l'interfaccia grafica del Raspberry Pi per programmare.</p>

<p>Quindi lo scenario di utilizzo è il seguente (si vede che sono un PhD? Solo i PhD parlano di scenari di utilizzo :D):</p>

<ul>
<li>Arduino collegato via USB a Raspberry Pi</li>
<li>Raspberry Pi connesso ad una rete WiFi o Ethernet local</li>
<li>Un computer/tablet/smartphone connesso alla stessa rete</li>
</ul>

<p>Il progetto doveva permettere di programmare Arduino e di accedere al monitor seriale (esattamente come fa l'IDE Arduino ufficiale).</p>

<h2>Installazione</h2>

<p>Trovate tutto il codice sviluppato a questo <a href="https://github.com/ludusrusso/arduino-compiler-web">link GitHub</a>. Per utilizzarlo è necessario accedere alla shell del Raspberry Pi e configurarlo come segue:</p>

<h4>Installazione Dipendenze</h4>

<p>Prima di tutto dobbiamo installare le dipendenze, che sono:</p>

<ul>
<li>Arduino-mk: un progetto che permette di interagire con Arduino da linea di comando</li>
<li>pySerial: libreria Python per accedere alla porta seriale</li>
<li>Flask: libreria Python per creare e gestire webapp</li>
</ul>

<p>Arduino-mk si installa da apt-get da linea di comando</p>

<pre><code>$ sudo apt-get install arduino-mk
</code></pre>

<p>Per le librerie Python, invece, conviene creare prima di tutto un virtualenv.</p>

<p>Per installare virtualenv basta eseguire il comando</p>

<pre><code>$ sudo pip install virtualenv
</code></pre>

<p>Una volta installato, entriamo nella cartella dove mettiamo solitamente i nostri progetti (nel mio caso è <code>/devs</code>), creiamo un ambiente virtuale e installiamo le dipendenze Python</p>

<pre><code>$ virtualenv remote-arduino
$ cd remote-arduino
$ source bin/activate
(remote-arduino)$ pip install flask flask-bootstrap flask-script pyserial
</code></pre>

<p>A questo punto possiamo clonare la repository GitHub</p>

<pre><code>git clone https://github.com/ludusrusso/arduino-compiler-web
</code></pre>

<p>Prima di lancare la webapp, dobbiamo informare il programma della scheda Arduino che utilizziamo e della porta a cui è collegato. Per farlo, bisogna esportare le seguenti variabili d'ambiente:</p>

<pre><code>(remote-arduino)$ export ARDUINO_PORT=/dev/ttyACM0
(remote-arduino)$ export ARDUINO_BOARD=uno
</code></pre>

<p>In questo caso, utilizziamo un Arduino UNO collegato alla porta ttyACM0.</p>

<h4>Lanciare l'applicazione</h4>

<p>Per lanciare l'app, basta entrare nella cartella <code>arduino-compiler-web</code> e lancaire il seguente comando </p>

<pre><code>./manage.py runserver -h 0.0.0.0 --threaded
</code></pre>

<h4>Utilizzo della WebApp</h4>

<p>A questo punto, da qualsiasi browser, collegandosi all'url <code>http://&lt;IP RASPBERRY&gt;:5000</code> accederemo all'applicazione.</p>

<p><img src="https://raw.githubusercontent.com/ludusrusso/images/master/arduino-rasp-web/index.png" alt="main"></p>

<p>Possiamo utilizzare l'editor di testo per scrivere codice</p>

<p><img src="https://raw.githubusercontent.com/ludusrusso/images/master/arduino-rasp-web/code.png" alt="main"></p>

<p>E installarlo su Arduino premendo il tasto <strong>Compile</strong></p>

<p><img src="https://raw.githubusercontent.com/ludusrusso/images/master/arduino-rasp-web/compilation.png" alt="main"></p>

<p>Allo stesso modo, possiamo aprire e chiudere il serial monitor dai tasti <strong>Monitor</strong> e <strong>Stop</strong></p>

<p><img src="https://raw.githubusercontent.com/ludusrusso/images/master/arduino-rasp-web/monitor.png" alt="main"></p>

<h2>Conclusioni</h2>

<p>Questo progetto è ancora molto acerbo, ma mi ha permesso di sviluppare tantissime competenze in ambito di programmazione web in Python e Flask. </p>

<p>Avete dei commenti e suggerimenti su come migliorarlo? Scrivetemi sulla mia pagina <a href="http://facebook.com/ludusrusso.cc">facebook</a>. </p>

  </div>