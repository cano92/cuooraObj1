Class {
	#name : #CuooraTopicDetailComponent,
	#superclass : #CuooraFunctionsComponent,
	#instVars : [
		'topic'
	],
	#category : #'Tp1_obj2_frontEdn'
}

{ #category : #rendering }
CuooraTopicDetailComponent >> renderBanner:htmlCanvas [
	htmlCanvas heading level2;with:('Topic: ',(self topic name)).
	htmlCanvas text:topic description.
	htmlCanvas break.htmlCanvas break.
	htmlCanvas text:(self topic questions) size.
	htmlCanvas text:' Preguntas.'.
	htmlCanvas break.
	htmlCanvas break.
	self showFavorite:htmlCanvas.
	htmlCanvas break.
]

{ #category : #rendering }
CuooraTopicDetailComponent >> renderContent:htmlCanvas [
	"muestra los detalles de el topic en renderBanner"
	"mostrar la opcion de ver preguntas de topics "
	((self topic)questions)isEmpty ifTrue: [ ] 
	ifFalse:["mostrar el boton para ver las preguntas del Topics"
		htmlCanvas anchor callback: [ self viewTopicQuestion ];with:' < preguntas > '.
	].	
	
]

{ #category : #private }
CuooraTopicDetailComponent >> showFavorite:htmlCanvas [
	"si ya esta en favoritos mostrar opcion de quitar de favoritos"
	( (self user) findTopic:(self topic))
	"si es nil se puede agregar a favoritos porque no esta agregado"
	ifNil: [ htmlCanvas anchor callback: [ (self user)addTopicMe:self topic ];with:'<agregar Favoritos>'. ] 
	ifNotNil:[htmlCanvas anchor callback: [ (self user)removeTopicMe:self topic ];with:'<quitar Favoritos>'.] .
	
]

{ #category : #acccessing }
CuooraTopicDetailComponent >> topic [
	^topic
]

{ #category : #acccessing }
CuooraTopicDetailComponent >> topic:aTopic [
	topic:=aTopic.
]

{ #category : #private }
CuooraTopicDetailComponent >> viewTopicQuestion [
	|view|
	view:= CuooraTopicQuestionsComponent new.
	"usuario actual registrado"
	view user: self user.
	"setea el topic para ver la lista de preguntas"
	view topic: self topic.
	self show:view.
]
