Class {
	#name : #Topic,
	#superclass : #Object,
	#instVars : [
		'name',
		'description',
		'questions'
	],
	#category : #'Tp1_ojb2-cuOOra_App'
}

{ #category : #'instance creation' }
Topic class >> name:aName Description:aDesc [
	^(self new)name: aName;description:aDesc.
	
]

{ #category : #'instance creation' }
Topic class >> name:aName description:aDesc [
	^(self new)name: aName;description:aDesc.
	
]

{ #category : #acccessing }
Topic >> addQuestion:aQuest [

	questions add:aQuest.
	"como viene un objeto Question se agrega como perteneciente"
	^aQuest addTopicTo: self.
]

{ #category : #private }
Topic >> description [
	^description.
]

{ #category : #private }
Topic >> description:aDesc [
	description:=aDesc.
]

{ #category : #acccessing }
Topic >> findQuestion_title:aTitle [
	"retorna una un question o nil sino existe"
	^questions detect: [:question| question title = aTitle] ifNone:[nil] 
]

{ #category : #initialization }
Topic >> initialize [
	super initialize.
	questions:=OrderedCollection new.
]

{ #category : #private }
Topic >> name [
	^name.
]

{ #category : #private }
Topic >> name:aName [
	name:=aName.
]

{ #category : #acccessing }
Topic >> questions [
	^questions.
]

{ #category : #private }
Topic >> removeQuestion:aQuestion [
	questions remove: aQuestion.
]
