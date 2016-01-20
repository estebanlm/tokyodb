accessing
lastError
	| code |
	code := self basicErrorCode.
	^ '{2} ({1})' format: { code. self basicErrorMessage: code }