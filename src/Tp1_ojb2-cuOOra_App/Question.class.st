Class {
	#name : #Question,
	#superclass : #Post,
	#instVars : [
		'title',
		'responses',
		'topicsTo'
	],
	#category : #'Tp1_ojb2-cuOOra_App'
}

{ #category : #'instance creation' }
Question class >> newQuestionTitle:aTitle description:aDesc [
	^(self new)title: aTitle;description: aDesc.
]

{ #category : #private }
Question >> addResponse:aResp [
	responses add: aResp.
	
]

{ #category : #adding }
Question >> addTopicTo:aTopic [
	topicsTo add: aTopic.
	
]

{ #category : #initialization }
Question >> initialize [ 
	super initialize.
	responses:=OrderedCollection new.
	topicsTo:=OrderedCollection new.
]

{ #category : #accessing }
Question >> responses [
	^responses.
]

{ #category : #accessing }
Question >> title [
	^title.
]

{ #category : #private }
Question >> title:aTitle [
	title:=aTitle.
]

{ #category : #accessing }
Question >> topicsTo [
	^topicsTo.
]
