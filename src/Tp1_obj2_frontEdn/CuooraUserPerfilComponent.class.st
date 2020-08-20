Class {
	#name : #CuooraUserPerfilComponent,
	#superclass : #CuooraFunctionsComponent,
	#instVars : [
		'userPerfil'
	],
	#category : #'Tp1_obj2_frontEdn'
}

{ #category : #appfunction }
CuooraUserPerfilComponent >> follow [
	"me agrego como seguidor del perfil que visito"
	(self userPerfil) addFollower:(self user).
]

{ #category : #private }
CuooraUserPerfilComponent >> followOption:htmlCanvas [
	"si ya soy seguidor de userPErfil al que visito mostrar opcion de dejar de seguir"
	(self userPerfil findFollowUser:self user)ifNil: [ 
		htmlCanvas anchor callback: [ self follow ];with:'| seguir Usuario |'.
	] 
	ifNotNil:["opcion de dejar de seguir"
		htmlCanvas anchor callback: [ self noFollow ];with:'| dejar de seguir |'.
	]. 
]

{ #category : #appfunction }
CuooraUserPerfilComponent >> noFollow [
	self userPerfil removeFollower:self user.	
]

{ #category : #rendering }
CuooraUserPerfilComponent >> renderBanner:htmlCanvas [
	"escribir banner nombre del user perfil y opcion para seguirlo"
	htmlCanvas heading level2;with:'perfil:',(self userPerfil name).
	"si es mi perfil no muestro la opcion de seguir y muestro la opcion de Datos completo y Editar datos Personales"
	(self user = self userPerfil )ifFalse: [  
		self followOption:htmlCanvas.
	].
]

{ #category : #rendering }
CuooraUserPerfilComponent >> renderContent:htmlCanvas [
	self showDatosPersonales:self userPerfil on:htmlCanvas.
	"llamar a la funcion para ver mas detalles de usuario y editar perfil personal.. cuando (user == userPerfil)"
	
	"link para llamar a mis respuestas de usuario "
	htmlCanvas break.
	htmlCanvas anchor callback:[ self viewUserQuestions ];with:' < Preguntas > '.
	htmlCanvas anchor callback:[ self viewUserResponses ];with:' < Respuestas > '.
	
]

{ #category : #private }
CuooraUserPerfilComponent >> showDatosPersonales:aPerson on:htmlCanvas [.
	"mostrar los datos personales del usuario"
	htmlCanvas text:'nombre: '.
	htmlCanvas text:(aPerson name).
	htmlCanvas break.
	htmlCanvas text:'apellido: '.
	htmlCanvas break.
	htmlCanvas text:'fecha de Nac: '.
	htmlCanvas break.
	"preguntar si es tu perfil y mostrar todos los datos y la opcion de editar"
	
]

{ #category : #acccessing }
CuooraUserPerfilComponent >> userPerfil [
	^userPerfil
]

{ #category : #acccessing }
CuooraUserPerfilComponent >> userPerfil:aUser [
	userPerfil:=aUser.
]

{ #category : #private }
CuooraUserPerfilComponent >> viewUserQuestions [
	|view|
	view:= CuooraUserQuestionsComponent new.
	"usuario actual registrado"
	view user: self user.
	"setea el usuario del perfil al que va visitar"
	view userPerfil: self userPerfil .
	self show:view.
]

{ #category : #private }
CuooraUserPerfilComponent >> viewUserResponses [
	|view|
	view:= CuooraUserResponsesComponent new.
	"usuario actual registrado"
	view user: self user.
	"setea el usuario del perfil al que va visitar"
	view userPerfil: self userPerfil .
	self show:view.
]
