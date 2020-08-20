Class {
	#name : #CuooraTopicComponent,
	#superclass : #WACuOOra,
	#instVars : [
		'topic'
	],
	#category : #'Tp1_obj2_frontEdn'
}

{ #category : #rendering }
CuooraTopicComponent >> renderContent: htmlCanvas [
	htmlCanvas heading level3;with:'Mis Topics'.
	self showListMyTopics:self user userTopicsMe on:htmlCanvas 
]

{ #category : #private }
CuooraTopicComponent >> showListMyTopics:listTopics on:htmlCanvas [ 
	listTopics isEmpty 
	ifTrue: [htmlCanvas text:'ohh! no tienes Topics'. htmlCanvas break. ] 
	
	"muestra tus topics agregados a favoritos"
	ifFalse:[  	listTopics do:[:aTopic| self showTopic:aTopic on:htmlCanvas]. ].
]

{ #category : #private }
CuooraTopicComponent >> showTopic:aTopic on:htmlCanvas [
	htmlCanvas text:'___________________________________________'.
	htmlCanvas heading level3;with:aTopic name.
	htmlCanvas text:(aTopic questions) size.
	htmlCanvas text:' Preguntas.'.
	htmlCanvas break.
	htmlCanvas anchor callback: [ self viewTopic:aTopic  ];with:'detalles'.
	htmlCanvas break.
	
]

{ #category : #private }
CuooraTopicComponent >> viewTopic:aTopic [
	"cambia a vista de detalles del topic"
	|view|
	view := CuooraTopicDetailComponent new.
	view user: self user.
	view topic:aTopic.
	self show:view.
]
