private
basicAt: keyString putObject: aByteArrayOrExternalAddress size: size

	^ self 
		tchdbput: keyString asByteArray
		size: keyString size 
		value: aByteArrayOrExternalAddress
		valueSize: size