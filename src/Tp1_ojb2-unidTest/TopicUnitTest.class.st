Class {
	#name : #TopicUnitTest,
	#superclass : #TestCase,
	#instVars : [
		'topic',
		'question'
	],
	#category : #'Tp1_ojb2-unidTest'
}

{ #category : #running }
TopicUnitTest >> setUp [
	topic:=Topic new.
]

{ #category : #running }
TopicUnitTest >> testQuestions [

	self assert: topic questions isEmpty.
	"agrega una pregunta"
	question:=topic addQuestion: (Question newQuestionTitle:'prueba' description:'prueba').
	self assert: topic questions size==1.
	"revisa que este agregado"
	self assert:( (topic findQuestion_title: 'prueba')ifNotNil: [true] ).
	self assert: (topic findQuestion_title: 'prueba')==question.
	
	"eliminar la question"
	topic removeQuestion: question.
	self assert: topic questions isEmpty.
]
