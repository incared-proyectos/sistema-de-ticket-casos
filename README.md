<p align="center"><a href="https://incared.net/" target="_blank"><img src="https://incared.net/wp-content/uploads/2015/03/logo_incared.png" width="400"></a></p>

## SISTEMA DE CASOS
<p>Sistema especializado para asignar y resolver tickets</p>

## LENGUAJES, FRAMEWORKS UTILIZADOS Y HERRAMIENTAS <g-emoji class="g-emoji" alias="hammer_and_wrench" fallback-src="https://github.githubassets.com/images/icons/emoji/unicode/1f6e0.png">🛠️</g-emoji>
<ul>
	<li><b>PHP</b></li>
	<li><b>LARAVEL VER: 8.5</b></li>
	<li><b>MYSQL</b></li>
	<li><b>VUE.JS</b></li>
	<li><b>ADMIN-LTE</b></li>
</ul>

## COMENZANDO <g-emoji class="g-emoji" alias="rocket" fallback-src="https://github.githubassets.com/images/icons/emoji/unicode/1f680.png">🚀</g-emoji>

<p><em>Estas instrucciones te permitirán obtener una copia del proyecto en funcionamiento en tu máquina local, para propósitos de desarrollo y pruebas.</em></p>

## PRE-REQUISITOS <g-emoji class="g-emoji" alias="clipboard" fallback-src="https://github.githubassets.com/images/icons/emoji/unicode/1f4cb.png">📋</g-emoji>

<ul>
	<li><b>PHP >= 7.3</b></li>
	<li><b>NODEJS:</b> LINK DESCARGA https://nodejs.org/es/</li>
	<li><b>COMPOSER:</b> LINK DESCARGA https://getcomposer.org/download/</li>
</ul>

## INSTALACIÓN <g-emoji class="g-emoji" alias="wrench" fallback-src="https://github.githubassets.com/images/icons/emoji/unicode/1f527.png">🔧</g-emoji>

<h3>Sigue paso a paso nuestras intrucciones para ejecutar correctamente el sistema</h3>

<em>Clonamos el repositorio</em>
<pre><code><b>git clone https://github.com/incared-proyectos/sistema-de-ticket-casos.git</b></code></pre>
<em>Instalamos nuestras dependencias con</em>
<pre><code><b>composer install</b></code></pre>
<em>Realizamos una copia de nuestro archivo .env con el siguiente comando</em>
<pre><code><b>cp .env.example .env</b></code></pre>
<em>Generamos la key para nuestro .env</em>
<pre><code><b>php artisan key:generate</b></code></pre>
<em>Instalamos nuestros paquetes necesarios </em>
<pre><code><b>npm install</b></code></pre>
<em> Compilamos </em>
<pre><code><b>npm run dev</b></code></pre>
<em> Importamos la base de datos alojada en la carpeta <b>Base de datos</b>  </em>

<h3>Una vez terminemos con los pasos anteriores, procedemos a configurar nuestro archivo .env</h3>

## ACTIVAR CRON JOB  <g-emoji class="g-emoji" alias="wrench" fallback-src="https://github.githubassets.com/images/icons/emoji/unicode/1f527.png">🔧</g-emoji>
<h3>El sistema cuenta con un cron par enviar correos cuando se cree un envie un mensaje sobre nuestro ticket. Para activar el cron usa el siguiente comando:</h3>
<pre><code><b>php artisan work:email</b></code></pre>

