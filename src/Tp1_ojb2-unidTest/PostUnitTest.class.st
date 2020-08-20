Class {
	#name : #PostUnitTest,
	#superclass : #TestCase,
	#instVars : [
		'post',
		'user',
		'userAux',
		'topic',
		'question',
		'response'
	],
	#category : #'Tp1_ojb2-unidTest'
}

{ #category : #running }
PostUnitTest >> setUp [ 
	post:=Post new.
	user:=User new.
	userAux:=User new.
]

{ #category : #running }
PostUnitTest >> testAddDislike [
		self assert: post dislikes ==0.
		
		"user agrega un dislike"
		post addDislike: user.
		self assert: post dislikes ==1.
		"un mismo user no puede realizar dos dislike al mismo post"
		post addDislike: user.
		self assert: post dislikes ==1.
		"otro usuario hace dislike"
		post addDislike: userAux.
		self assert: post dislikes==2.
		"user cambia su dislike por like"
		post addLike: user.
		self assert: post dislikes ==1.
		"user aux cambia su dislike por like"	
		post addLike: userAux.
		self assert: post dislikes ==0.
]

{ #category : #running }
PostUnitTest >> testAddLike [

		self assert: post likes ==0.
		"user hace un like "
		post addLike: user.
		self assert: post likes == 1.
		"un mismo usuario no puede hacer dos o mas likes"
		post addLike: user.
		self assert: post likes ==1.
		"user cambia su like por dislike"
		post addDislike: user.
		self assert: post likes == 0.
		"otro usuario hace like"
		post addLike: userAux.
		self assert: post likes==1.
		"user vuelve a hacer like para tener 2 likes"
		post addLike:user.
		self assert: post likes==2.
	
]

{ #category : #running }
PostUnitTest >> testQualifications [

		self assert: post qualifications isEmpty.
		"se agrega like"
		post addLike: user.
		self assert: post qualifications size==1. 
		"revisar que user califico"
		self assert:( (post findQualificationUser: user)ifNotNil: [true]). 
		
		"se agrega dislike"
		post addDislike: userAux.
		self assert: post qualifications size==2.
		"revisar que userAux califico"
		self assert:( (post findQualificationUser: userAux)ifNotNil: [true]). 
]
