Class {
	#name : #Post,
	#superclass : #Object,
	#instVars : [
		'qualifications',
		'user',
		'description',
		'dateCreation'
	],
	#category : #'Tp1_ojb2-cuOOra_App'
}

{ #category : #appfunction }
Post >> addDislike:aUser [
	"revisar que no aya calificado ya en caso que si borra la calificacion"
	self verifyQualify:(self findQualificationUser: aUser).
	"realiza la calificacion"
	self qualify: (Dislike new:aUser). 
]

{ #category : #appfunction }
Post >> addLike:aUser [
	"revisar que no aya calificado ya en caso que si borra la calificacion"
	self verifyQualify:(self findQualificationUser: aUser).
	"realiza la calificacion"
	self qualify: (Like new:aUser). 
]

{ #category : #private }
Post >> addQualification: aQual [
	"agrega una calificacion"
	qualifications add:aQual.
]

{ #category : #accesing }
Post >> dateCreation [
	^dateCreation.
]

{ #category : #accesing }
Post >> description [
	^description.
]

{ #category : #accesing }
Post >> description:aDesc [
	description:=aDesc.
]

{ #category : #accesing }
Post >> dislikes [
	"selecciona de todas las calificaciones los dislikes y le pregunta la cantidad"
	^( (self qualifications)select:[:qua|qua dislike] ) size.	
]

{ #category : #appfunction }
Post >> findQualificationUser:aUser [
	^self qualifications detect:[:qua|qua user = aUser] 
	 ifNone:[ nil] 
	
]

{ #category : #initialization }
Post >> initialize [
	super initialize.
	dateCreation:=DateAndTime now.
	qualifications := OrderedCollection new.
]

{ #category : #accesing }
Post >> likes [
	"selecciona de todas las calificaciones los likes y le pregunta la cantidad"
	^( (self qualifications)select:[:qua|qua like] ) size.	
]

{ #category : #accesing }
Post >> qualifications [
	^qualifications.
]

{ #category : #private }
Post >> qualify:aQua [
	qualifications add:aQua.
	
]

{ #category : #accesing }
Post >> user [
	^user.
]

{ #category : #accesing }
Post >> user:aUser [
	user:=aUser.
]

{ #category : #private }
Post >> verifyQualify:aQua [
	aQua ifNotNil:[ "si no es nil Borra la calificacion"
			self qualifications remove:aQua.
	].
]
