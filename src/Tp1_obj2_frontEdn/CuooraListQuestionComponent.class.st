Class {
	#name : #CuooraListQuestionComponent,
	#superclass : #CuooraFunctionsComponent,
	#instVars : [
		'question'
	],
	#category : #'Tp1_obj2_frontEdn'
}

{ #category : #rendering }
CuooraListQuestionComponent >> renderBanner: htmlCanvas [
	htmlCanvas heading level2;with:'Preguntas'.
	htmlCanvas heading level3;with:'todas las preguntas de CuOOra'.
]

{ #category : #rendering }
CuooraListQuestionComponent >> renderContent: htmlCanvas [
	"lista todas las preguntas de cuOOra-- iterando por todos los usuarios"
	(CuOOra singleton)users do:[:us|
		self showListQuestion: us questions on:htmlCanvas. 
	]
]
