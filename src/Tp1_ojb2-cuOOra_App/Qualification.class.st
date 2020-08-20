Class {
	#name : #Qualification,
	#superclass : #Object,
	#instVars : [
		'user',
		'dateCreation'
	],
	#category : #'Tp1_ojb2-cuOOra_App'
}

{ #category : #'instance creation' }
Qualification class >> new:aUser [
	^(self new)user:aUser.
]

{ #category : #accessing }
Qualification >> dislike [
	^false.
]

{ #category : #initialization }
Qualification >> initialize [
	super initialize.
	dateCreation := DateAndTime now.
]

{ #category : #accessing }
Qualification >> like [
	^false.
]

{ #category : #accessing }
Qualification >> user [
	^user.
]

{ #category : #accessing }
Qualification >> user:aUser [
	user:=aUser.
]
