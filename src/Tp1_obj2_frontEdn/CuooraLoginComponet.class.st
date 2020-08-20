Class {
	#name : #CuooraLoginComponet,
	#superclass : #WACuOOra,
	#instVars : [
		'name',
		'pass'
	],
	#category : #'Tp1_obj2_frontEdn'
}

{ #category : #initialize }
CuooraLoginComponet class >> initialize [ 
	"iniciar el servidor en el puerto:8000"
	ZnZincServerAdaptor startOn: 8000.
	"registra la aplicacion y el punto de entrada "
	WAAdmin register: self asApplicationAt:'cuoora'.
]

{ #category : #private }
CuooraLoginComponet >> clearForm [
	self name:nil.
	self pass:nil.
]

{ #category : #appfunction }
CuooraLoginComponet >> login [
	self verificationUser.
	self isLoggedIn 
	ifTrue:[
		self clearForm. 
		self show:((CuooraHomeComponent new)user:self user). ]
	ifFalse:["error de datos ingresados"			
			self alertText:'datos invalidos'.
	]
]

{ #category : #acccessing }
CuooraLoginComponet >> name [
	^name.
]

{ #category : #acccessing }
CuooraLoginComponet >> name:aName [
	name:=aName.
]

{ #category : #acccessing }
CuooraLoginComponet >> pass [
	^pass.
]

{ #category : #acccessing }
CuooraLoginComponet >> pass:aPass [
	pass:=aPass.
]

{ #category : #rendering }
CuooraLoginComponet >> renderBanner: htmlCanvas [
	htmlCanvas heading level2;with:'Bienvenido'.
]

{ #category : #rendering }
CuooraLoginComponet >> renderContent:htmlCanvas [
	"muestra el formulario del login"
	self showFormLogin:htmlCanvas.
]

{ #category : #private }
CuooraLoginComponet >> showFormLogin:htmlCanvas [
	htmlCanvas form:[
		htmlCanvas text:'nombre'.
		htmlCanvas textInput on:#name of:self.	
		htmlCanvas break.
		htmlCanvas text:'pass'.
		htmlCanvas textInput on:#pass of:self.	
		htmlCanvas break.
		htmlCanvas submitButton callback: [  self login]; value:'login'.
	].
]

{ #category : #private }
CuooraLoginComponet >> verificationUser [
	"controla que el usuario existe en CuOOra"
	self verificationUserPass: ((CuOOra singleton)findUser_name: self name).
]

{ #category : #private }
CuooraLoginComponet >> verificationUserPass:aUser [
	"si el usuario existe revisa el pass "
	(aUser isNil)
	ifFalse:[
		"si el pass es correcto setea al usuario"
		(aUser pass =self pass)ifTrue: [ self user:aUser ]
	]
]
