Class {
	#name : #TokyoLibrary,
	#superclass : #FFILibrary,
	#category : 'TokyoDB'
}

{ #category : #'accessing platform' }
TokyoLibrary >> macLibraryName [

	^ FFIMacLibraryFinder findLibrary: 'libtokyocabinet.9.11.0.dylib'
]

{ #category : #'accessing platform' }
TokyoLibrary >> unix64LibraryName [

	^ FFIUnix64LibraryFinder findLibrary: 'libtokyocabinet.so'
]

{ #category : #'accessing platform' }
TokyoLibrary >> win32LibraryName [

	^ FFIWindowsLibraryFinder findLibrary: 'libtokyocabinet.dll'
]
