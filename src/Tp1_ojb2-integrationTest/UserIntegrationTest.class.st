Class {
	#name : #UserIntegrationTest,
	#superclass : #TestCase,
	#instVars : [
		'cuoora',
		'user',
		'suoora',
		'topicA',
		'topicB',
		'questionA',
		'questionB',
		'topicC',
		'response'
	],
	#category : #'Tp1_ojb2-integrationTest'
}

{ #category : #running }
UserIntegrationTest >> setUp [ 
	user:=User name: 'user' password:'user'. 
	topicA:=Topic name: 'topicA' description:'TopicA'. 
	topicB:=Topic name: 'topicB' description:'TopicB'.
	topicC:=Topic name: 'topicB' description:'TopicB'.
	
	"preguntas"
	questionA:=Question newQuestionTitle: 'pruebaA' description:'pruebaA' .
	questionB:=Question newQuestionTitle: 'pruebaB' description:'pruebaB'.
	"se crea las preguntas para los topics"
	topicA addQuestion: questionA. 
	topicA addQuestion: questionB.
	topicB addQuestion: Question new.
	topicB addQuestion: Question new.
	topicB addQuestion: Question new.
]

{ #category : #tests }
UserIntegrationTest >> testAddResponse [

	self assert: questionA responses isEmpty.	
	"se agrega una respuesta a la pregunta"
	response:=user addResponse_question: questionA description: 'respuesta a pregunta a'.
	self assert: questionA responses size==1.
	"agrega otra respuesta"
	response:=user addResponse_question: questionA description: 'respuesta a pregunta a'.
	self assert: questionA responses size==2.
	
	"revisa que soy el autor de la respuesta"
	self assert: response user==user.
	
	"revisa la pregunta a la que pertenece la respuesta "
	self assert: response responseToQuestion == questionA.
	
]

{ #category : #running }
UserIntegrationTest >> testTopicsMeQuestions [
	"revisa que las preguntas traidas de sus Topic favoritos son correctos"
	"interaccion de user y Topics"
	self assert: user userTopicsMe isEmpty.
	self assert: user topicsMeQuestions isEmpty.
	"agrega un topic a favoritos con 2 preguntas"
	user addTopicMe: topicA.
	self assert: user topicsMeQuestions size==2.
	"agrega otro topic a Favoritos con 3 preguntas"
	user addTopicMe: topicB.
	self assert: user topicsMeQuestions size==5.
	"se agrega a favoritos un topic vacio"
	user addTopicMe: topicC.
	self assert: user topicsMeQuestions size==5.
	"se elimina una pregunta del topicA"
	topicA removeQuestion: questionA.
	self assert: user topicsMeQuestions size==4.
	topicA removeQuestion: questionB.
	self assert: user topicsMeQuestions size==3.
	"se agregan las preguntas al topic vacio"
	topicC addQuestion: questionA.
	self assert: user topicsMeQuestions size==4.
	topicC addQuestion: questionA.
	self assert: user topicsMeQuestions size==5.	
]
