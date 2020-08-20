Class {
	#name : #CuooraListTopicComponent,
	#superclass : #CuooraTopicComponent,
	#category : #'Tp1_obj2_frontEdn'
}

{ #category : #rendering }
CuooraListTopicComponent >> renderBanner:htmlCanvas [
		htmlCanvas heading level3;with:'CuOOra! Topics'.
]

{ #category : #rendering }
CuooraListTopicComponent >> renderContent: htmlCanvas [
	"muestra todos los Topics de CuOOra"
	self showListMyTopics:(CuOOra singleton)topics on:htmlCanvas.
	htmlCanvas text:'___________________________________________'.
	htmlCanvas break.htmlCanvas break.
	htmlCanvas anchor callback: [ self viewTopicsMe  ];with:' <Mis Topics! > '.
	
]
