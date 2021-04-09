Class {
	#name : #BaselineOfTokyoDB,
	#superclass : #BaselineOf,
	#category : 'BaselineOfTokyoDB'
}

{ #category : #baseline }
BaselineOfTokyoDB >> baseline: spec [
	<baseline>
	
	spec for: #common do: [ 
		spec package: 'TokyoDB' ]	
]
