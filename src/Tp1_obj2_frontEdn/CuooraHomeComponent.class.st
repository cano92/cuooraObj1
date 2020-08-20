Class {
	#name : #CuooraHomeComponent,
	#superclass : #CuooraFunctionsComponent,
	#category : #'Tp1_obj2_frontEdn'
}

{ #category : #rendering }
CuooraHomeComponent >> renderBanner: htmlCanvas [
	htmlCanvas heading level2;with:'Inicio'.
	
]

{ #category : #rendering }
CuooraHomeComponent >> renderContent:htmlCanvas [
	"muestra las 5 preguntas de los topics de mi interes, los topic marcados como favoritos"	
	|listQuestions|
	listQuestions:=(self user)topicsMeQuestions.
	(listQuestions isEmpty)
	ifTrue:[
		 self showAddTopicsOption:htmlCanvas.
	]  
	ifFalse:[ "mostrar la lista de preguntas de los topics"
		self showTopicMeQuestion:listQuestions on:htmlCanvas. 
	].
]

{ #category : #rendering }
CuooraHomeComponent >> showAddTopicsOption:htmlCanvas [
	htmlCanvas heading level3;with:'oohh!!. no tiene preguntas de su interes, agregue Topics en favoritos'. 
	htmlCanvas heading level3;with:'quiere agregar mas Topics??'.
	htmlCanvas anchor callback: [ self viewTopicsCuoora  ];with:' < Topics de CuOOra! > '.
]

{ #category : #rendering }
CuooraHomeComponent >> showTopicMeQuestion:listQuestions on:htmlCanvas [
	"lista de preguntas de topics favorits, se debe eliminar repetidos convirtiendo a una collecion sin repetidos "
		htmlCanvas heading level3;with:'ultimas preguntas de mis Topics Favoritos'.
		self showListQuestion: listQuestions  on:htmlCanvas. 
]
