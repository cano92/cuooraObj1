Class {
	#name : #CuooraTopicsMeComponent,
	#superclass : #CuooraTopicComponent,
	#category : #'Tp1_obj2_frontEdn'
}

{ #category : #rendering }
CuooraTopicsMeComponent >> renderBanner: htmlCanvas [
	htmlCanvas heading level3;with:'Mis Topics'.

]

{ #category : #rendering }
CuooraTopicsMeComponent >> renderContent: htmlCanvas [
	"lista los topics guardados como favoritos"
	self showListMyTopics:self user userTopicsMe on:htmlCanvas.
	htmlCanvas text:'___________________________________________'.
	htmlCanvas break.htmlCanvas break.
	htmlCanvas anchor callback: [ self viewTopicsCuoora  ];with:' < Topics de CuOOra! > '.
]
