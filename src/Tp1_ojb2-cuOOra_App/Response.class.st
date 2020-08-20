Class {
	#name : #Response,
	#superclass : #Post,
	#instVars : [
		'responseToQuestion'
	],
	#category : #'Tp1_ojb2-cuOOra_App'
}

{ #category : #'instance creation' }
Response class >> newResponse_description:aDesc [
	^(self new)description: aDesc.
]

{ #category : #initialize }
Response >> initialize [ 
	super initialize.
	responseToQuestion := OrderedCollection new.
]

{ #category : #private }
Response >> responseToQuestion [
	^responseToQuestion.
]

{ #category : #private }
Response >> responseToQuestion:aResp [
	responseToQuestion:=aResp.
]
