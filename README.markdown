Charla Apple Push Notification 
==============================

Pequeña aplicación en rails como prueba de concepto para la charla sobre
el Apple Push Notification  Service en el meetapp del 14 de Mayo del 2010. 

Basicamente es un par de scaffolds y el plugin  Apns4r
http://github.com/thegeekbird/Apns4r

Instalación
===========

Hay que copiar los certificados de apple al directorio certs. Para convertirlos
a .pem con openssl:

	openssl pkcs12 -in cred.p12 -out certkey.pem -nodes -clcerts
	openssl pcks12 -in pkey.p12 -out pkey.pem -nodes -clcerts
	
Una vez que un iphone se haya registrado en el servicio de apple y nos haya dado
su device token, podemos enviarle mensajes por push desde:

http://tu_server/messages/new

Ejemplo
=======

Desde la consola de rails, para enviar un mensaje:

	n = APNs4r::Notification.create 'e754dXXX', { :aps => {:alert => "Hola Meetapp!", :badge => 1}, :custom_data => "asd" } #=> #<APNs4r::Notification:0x11fe2c0>
	APNs4r::Sender.new.push n #=> 97
	

	