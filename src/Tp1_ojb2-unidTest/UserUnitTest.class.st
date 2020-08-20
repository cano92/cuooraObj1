Class {
	#name : #UserUnitTest,
	#superclass : #TestCase,
	#instVars : [
		'user',
		'userAux',
		'topic',
		'question',
		'response'
	],
	#category : #'Tp1_ojb2-unidTest'
}

{ #category : #'basic tests' }
UserUnitTest >> setUp [
	user:=User name: 'prueba' password:'prueba'. 
	userAux:=User name: 'otro' password:'otro'.


]

{ #category : #'basic tests' }
UserUnitTest >> testFollowers [
	self assert: user followers isEmpty.
	
	"agrega seguidor"
	user addFollower:userAux.
	self assert: user followers size==1. 
	
	self assert: (user findFollowUser: userAux)==userAux.
	
	"elimina seguidor"
	user removeFollower: userAux.
	self assert: user followers isEmpty.
	
]

{ #category : #'basic tests' }
UserUnitTest >> testQuestions [
	
	self assert: user questions isEmpty.
	"agregar pregunta a su lista de preguntas"
	question:=user newQuestionTitle: 'prueba' description:'prueba'. 
	self assert: user questions size==1.
	self assert: (user findQuestion_title: 'prueba')==question.
	"revisa que soy el autor de la pregunta"
	self assert: (question user) == user.
	self deny: (question user)==userAux.
	"se agrega otra pregunta  con el mismo titulo"
	user newQuestionTitle: 'prueba' description:'prueba'.
	self assert: (user findQuestions_title: 'prueba')size==2.
	
	"se elimina la primer pregunta"
	user removeQuestion: question.
	self assert: user questions size==1. 
	"remover el ultimo"
	question:=user findQuestion_title: 'prueba'.
	user removeQuestion: question.
	self assert: user questions isEmpty.
	
]

{ #category : #'basic tests' }
UserUnitTest >> testResponses [
	self assert: user responses isEmpty.
	"agrega una respuesta"
	response:=user addResponse_question: (Question new) description:'una descripcion de prueba'.
	self assert: user responses size==1.
	"revisa que la respuesta este en sus respuestas"
	"self assert: (user findResponses_Description: 'una descripcion de prueba')==response."
	
]

{ #category : #'basic tests' }
UserUnitTest >> testUserTopicsMe [
	
	self assert: user userTopicsMe isEmpty.
	"agregar topics"
	topic:=user addTopicMe: Topic new.
	self assert: user userTopicsMe size ==1.
	self assert: (user findTopic: topic)==topic.
	
	"eliminar topic"
	user removeTopicMe: topic.
	self assert: user userTopicsMe isEmpty.
	self assert:( (user findTopic: topic)ifNil: [true] ).
]
