Class {
	#name : #CuOOraIntegrationTest,
	#superclass : #TestCase,
	#instVars : [
		'cuoora',
		'question',
		'topic',
		'user'
	],
	#category : #'Tp1_ojb2-integrationTest'
}

{ #category : #'tests-integration' }
CuOOraIntegrationTest >> setUp [
	cuoora:= CuOOra new.
	question:=Question newQuestionTitle: 'pregunta' description:'pregunta'.
	topic:=Topic name: 'topic' description: 'topic'.
	user:=User name: 'user' password:'user'. 
	""
	topic addQuestion: question.
	user addQuestion: question.
	"agregar a cuoora"
	cuoora addUser: user.
	cuoora addTopic: topic.
	

]

{ #category : #'tests-integration' }
CuOOraIntegrationTest >> testRemoveQuestion [
	
	self assert:( (cuoora findQuestion_title: 'pregunta')ifNotNil: [ true ] ).
	self assert: topic questions size==1.
	self assert: user questions size==1.
	
	"eliminar la pregunta de cuoora"
	cuoora removeQuestion_title: 'pregunta'.
	"revisa que no este"
	self assert:( (cuoora findQuestion_title: 'pregunta')ifNil: [ true ] ).
	self assert: topic questions isEmpty.
	self assert: user questions isEmpty.
	
	
]
