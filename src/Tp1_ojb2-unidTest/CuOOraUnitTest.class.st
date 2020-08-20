Class {
	#name : #CuOOraUnitTest,
	#superclass : #TestCase,
	#instVars : [
		'cuooraSingleton',
		'cuooraInstan',
		'user',
		'topic'
	],
	#category : #'Tp1_ojb2-unidTest'
}

{ #category : #'basic tests' }
CuOOraUnitTest >> setUp [
	"ojo al testear Cuoora porque todo funciona sobre el obj singleton"
	cuooraSingleton:=CuOOra singleton.
	cuooraInstan :=CuOOra new.
]

{ #category : #'basic tests' }
CuOOraUnitTest >> testSingleton [
	
	self assert: (cuooraSingleton  == CuOOra singleton ).
	"generar otra instancia de Cuoora que deba ser distinto"
	self deny: ( cuooraSingleton == cuooraInstan).
	self deny: ( cuooraSingleton == CuOOra new).
]

{ #category : #'basic tests' }
CuOOraUnitTest >> testTopics [
	self assert: cuooraInstan topics isEmpty.
	topic:=cuooraInstan newTopicName: 'asdasd' description:'asdasdas'.
	
	self assert: (cuooraInstan topics size ==1).
	"el topic debe existir y debe ser el mismo"
	self assert: ((cuooraInstan findTopic_title: 'asdasd')ifNotNil: [ true ] ).
	self assert:(cuooraInstan findTopic_title: 'asdasd')==topic.

	"controla que el usuario nose pueda agregar dos veces"
	cuooraInstan newTopicName: 'asdasd' description:'asdasdas'.
	self assert: (cuooraInstan topics size ==1).	
	
	"controla que se elimina"
	cuooraInstan removeTopic: topic.
	self assert: ((cuooraInstan findTopic_title: 'asdasd')ifNil: [ true ] ).
	self assert: (cuooraInstan users isEmpty ).
	

]

{ #category : #'basic tests' }
CuOOraUnitTest >> testUsers [
	self assert: (cuooraInstan users isEmpty ).
	"se agrega un usuario y se revisa que esta"
	user:=cuooraInstan newUserName: 'asdasdas1' pass:'adasdaa'.
	self assert: (cuooraInstan users size ==1).
	"el usuario agregado debe existir"
	self assert: ((cuooraInstan findUser_name: 'asdasdas1')ifNotNil: [ true ] ).
	self assert:(cuooraInstan findUser_name: 'asdasdas1')==user.
	"controla que el usuario nose pueda agregar dos veces"
	cuooraInstan newUserName: 'asdasdas1' pass:'adasdaa'.
	self assert: (cuooraInstan users size ==1).
	"se elimina al usuario agregado"
	cuooraInstan removeUser: user.
	self assert: ((cuooraInstan findUser_name: 'asdasdas1')ifNil: [ true ] ).
	self assert: (cuooraInstan users isEmpty ).
	
]
