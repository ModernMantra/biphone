//
//  SIPConnectivity.swift
//  BiPhone
//
//  Created by Kerim Njuhovic on 17/12/2020.
//

import Foundation

final class SIPConnectvity: NSObject {
    
    public fileprivate (set) var account: VSLAccount!
    
    fileprivate let user = SipUser()
    fileprivate let prefs = UserDefaults.standard
    fileprivate let endpointConfiguration = VSLEndpointConfiguration()
    fileprivate let codecConfiguration = VSLCodecConfiguration()
    fileprivate let ipChangeConfiguration = VSLIpChangeConfiguration()
    
    override init() {
        super.init()
        setupLogCallBack()
        setupVoIPEndpoint()
        setupAccount()
    }
    
    func callKitRoutingCall(to number: String) -> Bool {
        VialerSIPLib.sharedInstance().callManager.startCall(toNumber: number, for: account, completion: { (call, error) in
            
        })
        return true
    }
    
}

// MARK: - Private -

fileprivate extension SIPConnectvity {
    
    func setupVoIPEndpoint() {
        let transportType = prefs.string(forKey: "transportType")

        var transportToUse: [VSLTransportConfiguration] {
            switch transportType {
            case "TLS"?:
                print("Using TLS");
                return [VSLTransportConfiguration(transportType: .TLS)!]
            case "TCP"?:
                print("Using TCP");
                return [VSLTransportConfiguration(transportType: .TCP)!]
            default:
                print("Using UDP");
                return [VSLTransportConfiguration(transportType: .UDP)!]
            }
        }

        endpointConfiguration.userAgent = "BiPhone Example App"
        endpointConfiguration.transportConfigurations = transportToUse
        endpointConfiguration.disableVideoSupport = !prefs.bool(forKey: "useVideo")
        endpointConfiguration.unregisterAfterCall = prefs.bool(forKey: "unregisterAfterCall")

        ipChangeConfiguration.ipChangeCallsUpdate = .update
        ipChangeConfiguration.ipAddressChangeReinviteFlags = VSLIpChangeConfiguration.defaultReinviteFlags()
        endpointConfiguration.ipChangeConfiguration = ipChangeConfiguration;

        codecConfiguration.audioCodecs = [
            VSLAudioCodecs(audioCodec: .ILBC, andPriority: 210),
            VSLAudioCodecs(audioCodec: .g711a, andPriority: 209)
        ]
        endpointConfiguration.codecConfiguration = codecConfiguration;

        do {
            try VialerSIPLib.sharedInstance().configureLibrary(withEndPointConfiguration: endpointConfiguration)
            // Set your incoming call block here.
            setupIncomingCallBlock()
        } catch let error {
            print("Error setting up VialerSIPLib: \(error)")
        }
    }

    func stopVoIPEndPoint() {
        VialerSIPLib.sharedInstance().removeEndpoint()
    }

    func setupAccount() {
        do {
            account = try VialerSIPLib.sharedInstance().createAccount(withSip: self.user)
        } catch let error {
            print("Could not create account. Error:\(error)\nExiting")
            assert(false)
        }
    }
    
    func setupIncomingCallBlock() {
        // The code from this block will be called when the framework receives an incoming call.
        VialerSIPLib.sharedInstance().setIncomingCall{ [weak self] (call) in
            DispatchQueue.main.async {
                self?.displayIncomingCall(call: call)
            }
        }
    }
    
    func setupLogCallBack() {
        VialerSIPLib.sharedInstance().setLogCallBack { (logMessage) in
            print(logMessage)
        }
    }

    func displayIncomingCall(call: VSLCall) {
        print(">>>>>>>>> Incommming Call <<<<<<<<<<<<<")
        AppDelegate.shared.providerDelegate?.reportIncomingCall(call)
    }
    
}
