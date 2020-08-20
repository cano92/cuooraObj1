Class {
	#name : #CuOOra,
	#superclass : #Object,
	#instVars : [
		'topics',
		'users'
	],
	#classVars : [
		'application',
		'me'
	],
	#category : #'Tp1_ojb2-cuOOra_App'
}

{ #category : #'class initialization' }
CuOOra class >> cargarPrueba [
	|cuoora pedro diego juan topicA topicB topicC questA questB|
	cuoora:=CuOOra singleton.
	"crea los usuarios"
	pedro:=cuoora newUserName: 'pedro@cuoora.com' pass:'pedro@cuoora.com'.
	diego:=cuoora newUserName: 'diego@cuoora.com' pass:'diego@cuoora.com'.
	juan:=cuoora newUserName: 'juan@cuoora.com' pass:'juan@cuoora.com'.
	"crear topics"
	topicA:= cuoora newTopicName:'OO1' description:'descripcion de topic OO1'.
	topicB:= cuoora newTopicName:'Test de unidad' description:'descripcion de topic Test de unidad'.
	topicC:= cuoora newTopicName:'Smalltalk' description:'descripcion de topic Smalltalk'.
	" crear preguntas "
	questA:= pedro newQuestionTitle:'¿Para qué sirve el método SetUp?' description:'descripcion de pregunta de pedro para iniciar casos de prueba '.
	questB:=diego newQuestionTitle:'¿Qué significa #messageNotUnderstood?' description:'descripcion de pregunta de diego tastads '.
	"cargar las preguntas a los topics"
	topicA addQuestion: questA.
	topicA addQuestion: questB.
	topicB addQuestion: questA.
	topicC addQuestion: questB.
	"cargar respuesta"
	diego addResponse_question:questA description:'Sirve para instanciar los objetos que son evaluados por el test en un único método y que se
ejecute siempre antes de cada test'.
	pedro addResponse_question:questB description:'Significa que el objeto que recibió el mensaje no encontró ningún método para ejecutar en
respuesta.'.
]

{ #category : #'class initialization' }
CuOOra class >> initialize [
	"|application|"
	"se crea una instancia de si mismo para el objeto singleton"
	me:=self new.
	"carga los valores de prueba"
	self cargarPrueba.
]

{ #category : #'class initialization' }
CuOOra class >> singleton [
	^me.
]

{ #category : #adding }
CuOOra >> addTopic:aTopic [
	"retorna el Topic agregado"
	topics add:aTopic.
	^aTopic.
]

{ #category : #private }
CuOOra >> addUser:aUser [ 
	"retorna el user agregado"
	users add:aUser.
	^aUser.
]

{ #category : #acccessing }
CuOOra >> findQuestionTotalUsers_title:aTitle [
	"busca la pregunta por titulo en todos las usuarios trae incluso repetidos mismo titulo"
	|col|
	col:=OrderedCollection new.
	self users do: [:user| col add:(user findQuestions_title:aTitle)].
	^col flattened.
]

{ #category : #acccessing }
CuOOra >> findQuestion_title:aTitle [
	"en caso de preguntas repetidas algun filtro o algo"
	"busca la pregunta por titulo en todas las preguntas de cuOOra"
	^(self findQuestionTotalUsers_title: aTitle) detect: [:question| question title=aTitle] 
	ifNone:[nil].
]

{ #category : #acccessing }
CuOOra >> findResponseTotalUsers_description:aDescription [
	"busca la pregunta por titulo en todos las usuarios trae incluso repetidos mismo titulo"
	|col|
	col:=OrderedCollection new.
	users do: [:user| col add:(user findResponses_title:aDescription)].
	^col flattened.
]

{ #category : #acccessing }
CuOOra >> findResponse_description:aDesc [
	"en caso de preguntas repetidas algun filtro o algo"
	"busca la pregunta por titulo en todas las preguntas de cuOOra"
	^(self findResponseTotalUsers_description: aDesc) detect: [:response| response title=aDesc] 
	ifNone:[nil].
]

{ #category : #acccessing }
CuOOra >> findTopic_title:aTopic [
	"busca el topic por titulo"
	^topics detect: [:topic| topic name=aTopic] 
	ifNone:[nil]
	yourself.
]

{ #category : #acccessing }
CuOOra >> findUser_name:aName [
	"busca el user por nombre y lo devuelve"
	^users detect: [:user| user name=aName] 
	ifNone:[nil]
	yourself.
]

{ #category : #initialization }
CuOOra >> initialize [
	topics:= OrderedCollection new.
	users := OrderedCollection new.
]

{ #category : #appfunction }
CuOOra >> login_userName:aName pass:aPass [
	|us|
	us:=self findUser_name:aName.
	(us isNil not) ifTrue: [ ]
]

{ #category : #appfunction }
CuOOra >> newTopicName:aName description:aDesc [
	^( self findTopic_title: aName)
	ifNil: [ self addTopic:(Topic name: aName Description:aDesc) ] ifNotNil: [false].
]

{ #category : #appfunction }
CuOOra >> newUserName:aName pass:aPass [
	"revisa que el nombre de usuario no este ocupado"
	^( self findUser_name: aName)
	ifNil: [ self addUser:( User name:aName  password:aPass) ] ifNotNil: [false].
]

{ #category : #remove }
CuOOra >> removeQuestionTotal: aQuestion [
	"elimina la pregunta de todo el Sistema"
	"elimina la pregunta de la lista de preguntas del user"
	(aQuestion user) removeQuestion: aQuestion.
	"recupera un collection con los topics y se elimina iterando la collection"
	(aQuestion topicsTo)do:[:topic|topic removeQuestion: aQuestion].
	"falta eliminar las respuestas que aun son conservadośpor los usuarios que respondieron********************"
]

{ #category : #remove }
CuOOra >> removeQuestion_title: aTitle [
	"recupera la pregunta y la elimina"
	self removeQuestionTotal: (self findQuestion_title: aTitle).
]

{ #category : #private }
CuOOra >> removeTopic:aTopic [
	(self topics) remove: aTopic.
]

{ #category : #private }
CuOOra >> removeUser:aUser [
	self users remove: aUser.
]

{ #category : #acccessing }
CuOOra >> topics [
	^topics.
]

{ #category : #acccessing }
CuOOra >> users [
	^users.
]
