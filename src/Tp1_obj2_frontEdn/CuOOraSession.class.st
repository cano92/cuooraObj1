Class {
	#name : #CuOOraSession,
	#superclass : #WASession,
	#instVars : [
		'user'
	],
	#category : #'Tp1_obj2_frontEdn'
}

{ #category : #'as yet unclassified' }
CuOOraSession >> isLoggedIn [
	^user isNil not.
]

{ #category : #'as yet unclassified' }
CuOOraSession >> login:aUser [
	user:=aUser.
]

{ #category : #'as yet unclassified' }
CuOOraSession >> logout [
	user:=nil.
]

{ #category : #'as yet unclassified' }
CuOOraSession >> userName [
	"para esto el objeto de la session debe ser un User de CuOOra"
	user name.
]
