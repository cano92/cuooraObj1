Class {
	#name : #CuooraFunctionsComponent,
	#superclass : #WACuOOra,
	#category : #'Tp1_obj2_frontEdn'
}

{ #category : #appfunction }
CuooraFunctionsComponent >> showDetailQuestion:aQuest on:htmlCanvas [
	"muestra la pregunta y sus campos faltantes"
	htmlCanvas heading level1;with:aQuest title.
	htmlCanvas text:aQuest description.
	htmlCanvas break.htmlCanvas break.
	htmlCanvas text:'fecha y hora: '.
	htmlCanvas text:aQuest dateCreation.
	htmlCanvas break.
	htmlCanvas text:'topics: '.
	"funcion que muesta la lista de topics como liks"
	self showLisTopicsToQuestion:(aQuest topicsTo ) on:htmlCanvas.
	htmlCanvas break.
	htmlCanvas text:'realizada por: '.
	htmlCanvas anchor callback: [ self viewPerfilUser:(aQuest user)];with:(aQuest user)name.
	htmlCanvas break.
	htmlCanvas text:(aQuest responses)size.
	htmlCanvas anchor callback: [ self viewQuestionDetail:aQuest ];with:' respuestas '.
	htmlCanvas break.
	"funcion que muesta el cuadro de likes y lo links para emitir voto"
	self showQualifications:aQuest on:htmlCanvas.
	
]

{ #category : #rendering }
CuooraFunctionsComponent >> showLisTopicsToQuestion:aTopics on:htmlCanvas [
	"muestra la lista de topics a la que pertenece la pregunta"
	aTopics do:[:topic| self showTopicItem: topic on:htmlCanvas ].
]

{ #category : #appfunction }
CuooraFunctionsComponent >> showListQuestion:aListQuest on:htmlCanvas [
	"muestra una lista de preguntas"
	aListQuest do:[:ques| self showQuestion:ques on:htmlCanvas ]
]

{ #category : #appfunction }
CuooraFunctionsComponent >> showListResponse:aListResponses on:htmlCanvas [
	"muestra una lista de respuestas"
	htmlCanvas heading level3;with:'respuestas..'.
	aListResponses do:[:resp| self showResponse:resp on:htmlCanvas ]
]

{ #category : #rendering }
CuooraFunctionsComponent >> showQualifications:aPost on:htmlCanvas [
"muestra la zona de los like y de los dislike cantidad y opcion de votar"
	"le pide a aPost la cantidad de likes"
	htmlCanvas text:aPost likes.
	htmlCanvas text:' likes | '.
	"le pide a aPost la cantidad de  dislikes"
	htmlCanvas text:aPost dislikes.
	htmlCanvas text:' dislikes '.
	htmlCanvas break.
	htmlCanvas anchor callback:[aPost addLike: self user ];with:' | like | '.
	htmlCanvas anchor callback:[aPost addDislike: self user ];with:' | dislike | '.
]

{ #category : #appfunction }
CuooraFunctionsComponent >> showQuestion:aQuestion on:htmlCanvas [
	"muestra una pregunta para listar (resumida)"
	htmlCanvas text:'__________________________________________________________'.
	htmlCanvas heading level1;with:aQuestion title.
	htmlCanvas break.
	htmlCanvas text:'topics: '.
	"funcion que muesta la lista de topics como liks"
	self showLisTopicsToQuestion:(aQuestion topicsTo ) on:htmlCanvas.
	htmlCanvas break.
	htmlCanvas text:'realizada por: '.
	aQuestion.
	htmlCanvas anchor callback: [ self viewPerfilUser:(aQuestion user)];with:(aQuestion user)name.
	htmlCanvas break.
	htmlCanvas text:(aQuestion responses)size.
	htmlCanvas anchor callback: [ self viewQuestionDetail:aQuestion ];with:' respuestas '.
	htmlCanvas break.
	"funcion que muesta el cuadro de likes y lo links para emitir voto"
	self showQualifications:aQuestion on:htmlCanvas.
	htmlCanvas break.	htmlCanvas break.
	htmlCanvas anchor callback: [ self viewResponseQuestion: aQuestion ];with:' < Responder > '.
	htmlCanvas break.

	
]

{ #category : #appfunction }
CuooraFunctionsComponent >> showQuestionsToTopic:aTopic on:htmlCanvas [	
	"muestra lista de preguntas de un topic"
	htmlCanvas heading level3;with:'ultimas preguntas'.	
	self showListQuestion:aTopic questions  on:htmlCanvas .
]

{ #category : #appfunction }
CuooraFunctionsComponent >> showResponse:aResponse on:htmlCanvas [
	"muestra una Respuesta para listar resumida"
	htmlCanvas text:'__________________________________________________________'.
	htmlCanvas break.
	htmlCanvas break.
	htmlCanvas anchor callback: [  self viewQuestionDetail: (aResponse responseToQuestion) ];with:'pregunta'.
	htmlCanvas break.
	htmlCanvas text:'Respuesta de: '.
	htmlCanvas anchor callback: [ self viewPerfilUser:(aResponse user)] ;with:((aResponse user)name).
	htmlCanvas break.
	htmlCanvas text:aResponse description.
	htmlCanvas break.
	self showQualifications:aResponse  on:htmlCanvas.
	htmlCanvas break.
]

{ #category : #rendering }
CuooraFunctionsComponent >> showTopicItem:aTopic on:htmlCanvas [
	"muestra un topic como link para ver la lista de preguntas del topic"
	"se debe implementar la llamada a la vista del topic viewTopic"
	htmlCanvas anchor callback: [ self viewTopic:aTopic ]; with:('| ', aTopic name, ' | ').
]

{ #category : #private }
CuooraFunctionsComponent >> viewQuestionDetail:aQuestion [
"cambia a vista de detalles de la pregunta"
	|view|
	view:=CuooraQuestionDetailComponent new.
	"usuario actual registrado"
	view user: self user.
	"pregunta a la que se ve los detalles"
	view question: aQuestion.
	self show:view.
]

{ #category : #private }
CuooraFunctionsComponent >> viewResponseQuestion:aQuest [
"muestra la opcion de responder es un view especial porque muestra la pregunta y el formulario"
	|view|
	view:=CuooraResponseQuestionComponent new.
	view user: self user.
	view question:aQuest.
	self show:view.
]

{ #category : #private }
CuooraFunctionsComponent >> viewTopic:aTopic [
	"cambia a vista de detalles del topic"
	|view|
	view := CuooraTopicDetailComponent new.
	view user: self user.
	view topic:aTopic.
	self show:view.
]
