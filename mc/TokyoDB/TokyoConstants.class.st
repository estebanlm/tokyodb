"
I contain all general tokyo constants (like error codes, etc.).

Constants here are taken from ==tokyocabinet.idl== file.
"
Class {
	#name : #TokyoConstants,
	#superclass : #SharedPool,
	#classVars : [
		'ECLOSE',
		'EINVALID',
		'EKEEP',
		'ELOCK',
		'EMETA',
		'EMISC',
		'EMKDIR',
		'EMMAP',
		'ENOFILE',
		'ENOPERM',
		'ENOREC',
		'EOPEN',
		'EREAD',
		'ERENAME',
		'ERHEAD',
		'ERMDIR',
		'ESEEK',
		'ESTAT',
		'ESUCCESS',
		'ESYNC',
		'ETHREAD',
		'ETRUNC',
		'EUNLINK',
		'EWRITE'
	],
	#category : 'TokyoDB'
}

{ #category : #'class initialization' }
TokyoConstants class >> initialize [ 
	"the error codes"
	ESUCCESS := 0.
	ETHREAD := 1.
	EINVALID := 2.
	ENOFILE := 3.
	ENOPERM := 4.
	EMETA := 5.
	ERHEAD := 6.
	EOPEN := 7.
	ECLOSE := 8.
	ETRUNC := 9.
	ESYNC := 10.
	ESTAT := 11.
	ESEEK := 12.
	EREAD := 13.
	EWRITE := 14.
	EMMAP := 15.
	ELOCK := 16.
	EUNLINK := 17.
	ERENAME := 18.
	EMKDIR := 19.
	ERMDIR := 20.
	EKEEP := 21.
	ENOREC := 22.
	EMISC := 9999.
]
