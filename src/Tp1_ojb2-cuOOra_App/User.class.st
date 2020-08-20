Class {
	#name : #User,
	#superclass : #Object,
	#instVars : [
		'name',
		'pass',
		'dateCreation',
		'userQuestions',
		'userResponses',
		'userFollowers',
		'userTopicsMe'
	],
	#category : #'Tp1_ojb2-cuOOra_App'
}

{ #category : #'instance creation' }
User class >> name: aName password: aPass [
	^(self new)name:aName;pass:aPass.
	 
	
]

{ #category : #adding }
User >> addFollower:aUser [
	userFollowers add: aUser.
]

{ #category : #adding }
User >> addQuestion:aQuest [
	"se agrega como autor"
	aQuest user:self.
	"agrega la pregunta a sus preguntas"
	userQuestions add:aQuest.
	^aQuest.
]

{ #category : #adding }
User >> addResponse:aResp [
	userResponses add:aResp.
	^aResp.
]

{ #category : #adding }
User >> addResponse_question:aQuestion description:aDesc [
	|response|"retorna la respuesta agregada"
	"agrego la respuesta a mi lista de respuestas"
	response:=self addResponse: (self createResponse_description: aDesc).
	"la pregunta conoce sus respuestas"
	aQuestion addResponse:response.
	"la respuesta conoce su pregunta"
	^response responseToQuestion:aQuestion.

]

{ #category : #adding }
User >> addTopicMe:aTopic [
	"retorna el topic agregado"
	userTopicsMe add:aTopic.
	^aTopic.
]

{ #category : #private }
User >> addUserTopicMe:aTopic [
	"deberia revisar que el parametro no es nil"
	userTopicsMe add: aTopic.
]

{ #category : #private }
User >> createQuestionTitle:aTitle description:aDesc [
	"crea la Question con titulo descripcion y se agrega como autor"
	^(Question newQuestionTitle:aTitle  description: aDesc)user:self.
]

{ #category : #private }
User >> createResponse_description:aDesc [
	"crea la Question con titulo descripcion y se agrega como autor"
	^(Response newResponse_description: aDesc) user:self.
]

{ #category : #appfunction }
User >> findFollowUser:aUser [
	"revisa si el usuario es un seguidor"
	^(self followers) detect: [:user| user =aUser ] 
	ifNone: [ nil].
]

{ #category : #acccessing }
User >> findQuestion_title:aTitle [
	"retorna una Question"
	^userQuestions detect:  [:question| question title = aTitle] 
		ifNone:[nil]. 
]

{ #category : #acccessing }
User >> findQuestions_title:aTitle [
	"retorna una collection"
	^userQuestions select: [:question| question title = aTitle]
]

{ #category : #acccessing }
User >> findResponses_Description:aDesc [
	^userResponses select: [:response| response description = aDesc]
]

{ #category : #appfunction }
User >> findTopic:aTopic [
	^(self userTopicsMe)detect: [:topic| topic = aTopic ]  
	ifNone:[nil].  
	
]

{ #category : #acccessing }
User >> followers [
	^userFollowers.
]

{ #category : #initialization }
User >> initialize [
	super initialize.
	dateCreation:=DateAndTime now.
	userQuestions:= OrderedCollection new.
	userResponses :=OrderedCollection new.
	userFollowers :=OrderedCollection new.
	userTopicsMe :=OrderedCollection new.
]

{ #category : #acccessing }
User >> name [
	^name
]

{ #category : #private }
User >> name:aName [
	name:=aName
]

{ #category : #private }
User >> newQuestionTitle:aTitle description:aDesc [
	"crea y agrega la pregunta, retorna la pregunta creada"
	^self addQuestion: (self createQuestionTitle: aTitle  description:aDesc). 
]

{ #category : #acccessing }
User >> pass [
	^pass
]

{ #category : #private }
User >> pass:aPass [
	pass:=aPass
]

{ #category : #acccessing }
User >> questions [
	^userQuestions.
]

{ #category : #appfunction }
User >> removeFollower:aUser [
	self followers remove:aUser.
]

{ #category : #adding }
User >> removeQuestion:aQuestion [	
	userQuestions remove: aQuestion.
]

{ #category : #adding }
User >> removeTopicMe:aTopic [
	
	userTopicsMe remove:aTopic.
]

{ #category : #acccessing }
User >> responses [
	^userResponses.
]

{ #category : #appfunction }
User >> topicsMeQuestions [
	"devuelve la lista de las preguntas de mis topics favoritos"
	"iterar los topics guardando los"
	|col|
	col:=OrderedCollection new.
	userTopicsMe do: [:topic |col add: topic questions ].
	^(col flattened).
]

{ #category : #acccessing }
User >> userTopics [
	^userTopicsMe.
]

{ #category : #acccessing }
User >> userTopicsMe [
	^userTopicsMe.
]
