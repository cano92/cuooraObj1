Class {
	#name : #PostIntegrationTest,
	#superclass : #TestCase,
	#instVars : [
		'post',
		'user',
		'userAux'
	],
	#category : #'Tp1_ojb2-integrationTest'
}

{ #category : #running }
PostIntegrationTest >> setUp [
	post:=Post new.
	user:=User name: 'user' password:'user'.
	userAux:=User name: 'userAux' password:'userAux'  
]

{ #category : #running }
PostIntegrationTest >> testQualifications [
	self assert: post qualifications isEmpty.
	self assert: post likes==0.
	self assert: post dislikes ==0.
	
	"user hace un like"
	post addLike: user.
	self assert: post qualifications size==1.
	self assert: post likes==1.
	self assert: post dislikes ==0.
	
	"el mismo usuario no puede hacer dos likes"
	post addLike: user.
	self assert: post qualifications size==1.
	self assert: post likes==1.
	self assert: post dislikes ==0.
	
	"user Aux hace un like"
	post addLike: userAux.
	self assert: post qualifications size==2.
	self assert: post likes==2.
	self assert: post dislikes ==0.
	
	post addDislike: user.
	self assert: post qualifications size==2.
	self assert: post likes==1.
	self assert: post dislikes ==1.
	
	post addDislike: userAux.
	self assert: post qualifications size==2.
	self assert: post likes==0.
	self assert: post dislikes ==2.
	"nose puede repetir el dislike"
	post addDislike: userAux.
	self assert: post qualifications size==2.
	self assert: post likes==0.
	self assert: post dislikes ==2.
]
