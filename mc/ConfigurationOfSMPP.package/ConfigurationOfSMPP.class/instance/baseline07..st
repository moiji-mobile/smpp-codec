baselines
baseline07: spec
	<version: '0.7-baseline'>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec repository: 'http://smalltalkhub.com/mc/osmocom/SMPP/main'.
		spec 
			project: 'OsmoGSM' with: [
				spec
					className: #ConfigurationOfOsmoGSM;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/osmocom/GSM/main/' ];
			project: 'OsmoLogging' with: [
				spec
					className: #ConfigurationOfOsmoLogging;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/osmocom/Logging/main/' ];
			project: 'OsmoNetwork' with: [
				spec
					className: #ConfigurationOfOsmoNetwork;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/osmocom/Network/main/' ];
			project: 'OsmoCore' with: [
				spec
					className: #ConfigurationOfOsmoCore;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/osmocom/Core/main/' ].
		spec 
			package: #'SMPP-Codec' with: [
				spec requires: #('OsmoGSM' ). ];
			package: #'SMPP-Connection' with: [
				spec requires: #(#'SMPP-Codec' 'OsmoCore' 'OsmoLogging' 'OsmoNetwork' ). ].
		spec group: 'default' with: #(#'SMPP-Codec' #'SMPP-Connection' ). ].
