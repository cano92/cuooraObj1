Class {
	#name : #CuooraTopicQuestionsComponent,
	#superclass : #CuooraTopicDetailComponent,
	#category : #'Tp1_obj2_frontEdn'
}

{ #category : #rendering }
CuooraTopicQuestionsComponent >> renderContent:htmlCanvas [
	"muestra la lista de preguntas del topic"
	self showQuestionsToTopic:self topic  on:htmlCanvas.
]
