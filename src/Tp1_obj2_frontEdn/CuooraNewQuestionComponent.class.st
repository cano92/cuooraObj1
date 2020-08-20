Class {
	#name : #CuooraNewQuestionComponent,
	#superclass : #WACuOOra,
	#instVars : [
		'title',
		'description',
		'topic'
	],
	#category : #'Tp1_obj2_frontEdn'
}

{ #category : #private }
CuooraNewQuestionComponent >> clearForm [
	self title: nil.
	self description:nil.
	self topic: nil.
]

{ #category : #acccessing }
CuooraNewQuestionComponent >> description [
	^description.
]

{ #category : #acccessing }
CuooraNewQuestionComponent >> description:aDesc [
	description:=aDesc.
]

{ #category : #private }
CuooraNewQuestionComponent >> informe:atexts [
	|text|
	text:='pregunta guardada correctamente!. en los topics: '.
	atexts do: [:txt| text:= ' ',text,', ',txt ].
	^text.
]

{ #category : #rendering }
CuooraNewQuestionComponent >> renderBanner: htmlCanvas [
	htmlCanvas heading level2;with:'Nueva Pregunta'.
]

{ #category : #rendering }
CuooraNewQuestionComponent >> renderContent: htmlCanvas [
	"muestra el formulario para ingresar la pregunta"
	self showForm:htmlCanvas.
	
	"lista de sugerencias de topics "
	self showSuggestion:htmlCanvas.

]

{ #category : #appfunction }
CuooraNewQuestionComponent >> saveQuestion [
	|topicsValid aQuest|
	"revisa que almenos un topic exista"
	topicsValid :=self topicsControl.
	(topicsValid isEmpty)
	ifTrue: [  self alertText: 'ningun Topic ingresado es correcto'	]
	ifFalse:["el usuario agrega la nueva pregunta"
		aQuest:=self user newQuestionTitle: (self title) description:(self description).
		"guradar question en los topics"
		topicsValid do:[:aTopic| aTopic addQuestion:aQuest].		
		self clearForm.
		"notificar que la pregunta fue subida con los Topic de topicssvalid"
		"self alertText:(self informe:'pregunta guardada con exito')."
		self alertText:'pregunta guardada exitosamente'.
	]. 
	
]

{ #category : #private }
CuooraNewQuestionComponent >> showForm:htmlCanvas [
	htmlCanvas form:[
		htmlCanvas text:'titulo'.
		htmlCanvas textInput on:#title of:self.
		htmlCanvas break.
		htmlCanvas text:'descripcion'.
		htmlCanvas textInput on:#description of:self.
		htmlCanvas break.
		htmlCanvas text:'topics separados ","'.
		htmlCanvas textInput on:#topic of:self.
		htmlCanvas break.
		htmlCanvas submitButton callback: [ self saveQuestion ];value:'guardar'.
		htmlCanvas submitButton callback: [  self clearForm ];value:'cancelar'.
	].
]

{ #category : #private }
CuooraNewQuestionComponent >> showSuggestion:htmlCanvas [
	"lista de nombres de topics"
	htmlCanvas break.
	htmlCanvas text:'topics:'.
	(CuOOra singleton)topics do:[:aTopic| 
		htmlCanvas text:(aTopic name,',').	
	].

]

{ #category : #acccessing }
CuooraNewQuestionComponent >> title [
	^title.
]

{ #category : #acccessing }
CuooraNewQuestionComponent >> title:aTitle [
	title:=aTitle.
]

{ #category : #acccessing }
CuooraNewQuestionComponent >> topic [
	^topic.
]

{ #category : #acccessing }
CuooraNewQuestionComponent >> topic:aTopic [
	topic:=aTopic.
]

{ #category : #private }
CuooraNewQuestionComponent >> topicsControl [
	"guarda los topics validos en un arreglo y lo devuelve"
	|aTopic aCol|
	aCol :=OrderedCollection new.
	((self topic)splitOn:',')do:[:str| 
		  aTopic:=(CuOOra singleton)findTopic_title:str.
		aTopic ifNotNil:[aCol add:aTopic]. 
	].
	^aCol.
]
