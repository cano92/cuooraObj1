Class {
	#name : #CuooraUserQuestionsComponent,
	#superclass : #CuooraUserPerfilComponent,
	#category : #'Tp1_obj2_frontEdn'
}

{ #category : #rendering }
CuooraUserQuestionsComponent >> renderContent:htmlCanvas [
"mostrar detalles de la persona y sus preguntas"
	super renderContent: htmlCanvas.
	htmlCanvas heading level3;with:'preguntas..'.
	htmlCanvas break.
	"muestra la lista de preguntas"
	self showListQuestion:(self userPerfil)questions  on:htmlCanvas.
]
