Class {
	#name : #WACuOOra,
	#superclass : #WAComponent,
	#instVars : [
		'user',
		'alertText',
		'bannerText'
	],
	#category : #'Tp1_obj2_frontEdn'
}

{ #category : #testing }
WACuOOra class >> canBeRoot [ 
	^true.
]

{ #category : #accesing }
WACuOOra >> alertText:aText [
	alertText:=aText.
]

{ #category : #appfunction }
WACuOOra >> home: aUser [
	"crea otra instancia de home"
	self show:((CuooraHomeComponent new) user: aUser).
]

{ #category : #appfunction }
WACuOOra >> isLoggedIn [
	^user isNil not.	
]

{ #category : #appfunction }
WACuOOra >> logout [
	"elimina al usuario logueado"
	self user:nil.
	"retorna a la pantalla de inicio"
	self show:CuooraLoginComponet new.
	
	
]

{ #category : #appfunction }
WACuOOra >> newQuestion: aUser [
	"crea otra instancia de home"
	self show:((CuooraNewQuestionComponent new) user: aUser).
]

{ #category : #rendering }
WACuOOra >> renderAlert:htmlCanvas [
	htmlCanvas heading level3;with:alertText.
]

{ #category : #rendering }
WACuOOra >> renderBanner:htmlCanvas [
	htmlCanvas heading level2;with:bannerText.
]

{ #category : #rendering }
WACuOOra >> renderContent:htmlCanvas [

]

{ #category : #rendering }
WACuOOra >> renderContentOn: htmlCanvas [
	self renderHeader: htmlCanvas.
	self renderBanner:htmlCanvas.
	self renderAlert:htmlCanvas.
	self renderContent: htmlCanvas.
	self renderFooter: htmlCanvas.

]

{ #category : #rendering }
WACuOOra >> renderFooter:htlm [
]

{ #category : #rendering }
WACuOOra >> renderHeader:htmlCanvas [
	self isLoggedIn 
		ifTrue:[
			htmlCanvas heading level;with:'CuOOra!'.
			htmlCanvas break.
			htmlCanvas anchor callback: [ self home: self user ];with:' |  Inicio  |  '.
			htmlCanvas anchor callback: [ self viewListQuestions ];with:' |  Preguntas  |  '.
			htmlCanvas anchor callback: [ self viewTopicsCuoora  ];with:' | Topics de CuOOra | '.
			htmlCanvas anchor callback: [ self viewTopicsMe ];with:' |  Mis Topics  |  '.
			htmlCanvas anchor callback: [ self newQuestion: self user ];with:' | Nueva Pregunta | .'.
			htmlCanvas text:' user:'.
			htmlCanvas anchor callback: [ self viewPerfilUser: self user ];with:self user name.
			htmlCanvas anchor callback: [ self logout ];with:' | Salir |'.
		]
		ifFalse:[
			htmlCanvas heading level1;with:'CuOOra!'.
		]
]

{ #category : #accesing }
WACuOOra >> user [
	^user.
]

{ #category : #accesing }
WACuOOra >> user:aUser [
	user:=aUser.
]

{ #category : #private }
WACuOOra >> viewListQuestions [
	|view|
	view:= CuooraListQuestionComponent new.
	view user:self user. 
	self show:view.
]

{ #category : #appfunction }
WACuOOra >> viewPerfilUser:aUser [
"cambia a vista de perfil de un usuario"
	|view|
	view:= CuooraUserPerfilComponent new.
	"usuario actual registrado"
	view user: self user.
	"setea el usuario del perfil al que va visitar"
	view userPerfil: aUser.
	self show:view.
]

{ #category : #appfunction }
WACuOOra >> viewTopicsCuoora [
"cambia a vista de perfil de un usuario"
	|view|
	view:= CuooraListTopicComponent new.
	"usuario actual registrado"
	view user: self user.
	self show:view.
]

{ #category : #appfunction }
WACuOOra >> viewTopicsMe [
"cambia a vista de perfil de un usuario"
	|view|
	view:= CuooraTopicsMeComponent new.
	"usuario actual registrado"
	view user: self user.
	self show:view.
]
