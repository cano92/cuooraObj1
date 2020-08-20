Class {
	#name : #CuooraQuestionDetailComponent,
	#superclass : #CuooraFunctionsComponent,
	#instVars : [
		'question'
	],
	#category : #'Tp1_obj2_frontEdn'
}

{ #category : #acccessing }
CuooraQuestionDetailComponent >> question [
	^question.
]

{ #category : #acccessing }
CuooraQuestionDetailComponent >> question:aQuest [
	question:=aQuest.
]

{ #category : #rendering }
CuooraQuestionDetailComponent >> renderBanner:htmlCanvas [
	"htmlCanvas heading level2;with:'Detalles'."
]

{ #category : #rendering }
CuooraQuestionDetailComponent >> renderContent:htmlCanvas [
	"muestra los detalles de la pregunta indicada"
	self showDetailQuestion:(self question) on:htmlCanvas.
	"muestra el boton de responder"
	htmlCanvas break.htmlCanvas break.
	htmlCanvas anchor callback: [ self viewResponseQuestion: self question ];with:' < Responder > '.
	"muestra todas las resouestas de la pregunta, enviandole la lista de respuestas"
	self showListResponse:(self question) responses  on:htmlCanvas.
	
	
]
