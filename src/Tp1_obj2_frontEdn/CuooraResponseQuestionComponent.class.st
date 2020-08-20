Class {
	#name : #CuooraResponseQuestionComponent,
	#superclass : #CuooraFunctionsComponent,
	#instVars : [
		'question',
		'response'
	],
	#category : #'Tp1_obj2_frontEdn'
}

{ #category : #accesing }
CuooraResponseQuestionComponent >> question [ 
	^question.
]

{ #category : #accesing }
CuooraResponseQuestionComponent >> question:aQuest [
	question:=aQuest.
]

{ #category : #rendering }
CuooraResponseQuestionComponent >> renderBanner:htmlCanvas [
	"htmlCanvas heading level2;with:'Detalles'."
]

{ #category : #rendering }
CuooraResponseQuestionComponent >> renderContent:htmlCanvas [
	"muestra las los detalles de la pregunta"
	self showDetailQuestion:self question  on:htmlCanvas.
	
	"genera el formulario para responder la pregunta indicada"
	self showFormQuestionResponse:htmlCanvas.

	
]

{ #category : #accesing }
CuooraResponseQuestionComponent >> response [
	^response.
]

{ #category : #accesing }
CuooraResponseQuestionComponent >> response:aResp [
	response:=aResp.
]

{ #category : #private }
CuooraResponseQuestionComponent >> saveResponse [
	"guardar la respuesta ingresado"
	(self user)addResponse_question:(self question) description:(self response).
	"volver a la vista de detalles"
	self viewQuestionDetail:self question. 
]

{ #category : #private }
CuooraResponseQuestionComponent >> showFormQuestionResponse:htmlCanvas [
"genera un formulario para responder"
	htmlCanvas heading level3;with:'Respuesta'.
	htmlCanvas form:[
		htmlCanvas textInput on:#response of:self.	
		htmlCanvas break.
		htmlCanvas submitButton callback: [ self saveResponse ]; value:'Enviar'.
	].
	htmlCanvas break.
]
