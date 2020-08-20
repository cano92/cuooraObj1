Class {
	#name : #CuooraUserResponsesComponent,
	#superclass : #CuooraUserPerfilComponent,
	#category : #'Tp1_obj2_frontEdn'
}

{ #category : #rendering }
CuooraUserResponsesComponent >> renderContent:htmlCanvas [
"mostrar detalles de la persona y sus respuestas"
	super renderContent: htmlCanvas.
	"muestra la lista de preguntas"
	self showListResponse:(self userPerfil)responses  on:htmlCanvas.
	
]
