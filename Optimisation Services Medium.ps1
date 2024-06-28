if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }
[System.Console]::Title = "[Services Optimization By inso.vs]"

echo "Auteur: inso.vs
Date de cr�ation: [28/06/2024] v0.1 (Version Optmimal)


DESCRIPTION:

- Ce script d�sactives les services Windows ind�sirables et inutiles pou une utilisation gaming/streaming.
- Tout les services commentent leurs lignes correspondantes ci-dessous du script.
- Si un de vos p�riph�riques, app, ou quelques choses du genre ne s'ex�cute pas au demarrage,
- R�activer le en cherchant le/les potentiels services qui pourraient avoir eu effet sur son arr�t.

- Si le probl�me persiste, rejoignez mon Discord sur ma page 'guns.lol', o� vous y serez rediriger � la fin du script.

- n'oubliez pas de redemarrer le PC pour appliquer les Tweaks."
Start-Sleep -Seconds 10

$confirmation = Read-Host "Veuillez ecrire 'ok' pour confirmer votre accord et demarrer le script. :"


    Write-Host "Accord accept�. Le script continue."

$services = @(

    "diagnosticshub.standardcollector.service" # Service Collecteur standard du concentrateur de diagnostic Microsoft (R)
    "DiagTrack"                                # Diagnostics Tracking Service
    "DialogBlockingService"                    # Diagnostics Tracking Service
    "diagsvc"                                  # Diagnostics Tracking Service
    "dmwappushservice"                         # Service de routage de messages Push du protocole WAP (Wireless Application Protocol) de gestion des appareils
    "lfsvc"                                    # Geolocation Service
    "MapsBroker"                               # Gestionnaire des cartes t�l�charg�es
    "AMD External Events Utility"              # AMD External Events Utility             
    "AMD Crash Denfender Service"              # AMD Crash Denfender Service
    "edgeupdate"                               # Microsoft Edge       
    "SCPolicySvc"                              # Strat�gie de retrait de la carte � puce
    "SCardSvr"                                 # Carte a puce
    "BDESVC"                                   # Service de chiffrement de lecteur BitLocker
    "icssvc"                                   # Service Point d'acces sans fil mobile Windows
    "PhoneSvc"                                 # Service Telephonique
    "Spooler"                                  # Imprimante
    "shpamsvc"                                 # Shared PC Account Manager
    "Themes"                                   # Themes    
    "WpcMonSvc"                                # Controle Parental
    "VaultSvc"                                 # Gestionnaire d�informations d�identification
    "CscService"                               # Fichier hors connexion
    "IKEEXT"                                   # Modules de g�n�ration de cl�s IKE et AuthIP                          
    "TabletInputService"                       # Clavier tactile
    "UevAgentService"                          # Virtualization
    "WpnService"                               # Stylet
    "DispBrokerDesktopSvc"                     # Service de strategie d'affichage
    "LanmanServer"                             # Serveur
    "LanmanWorkstation"                        # Station de travail
    "BcastDVRUserService"                      # GameDVR - Service utilisateur de diffusion et GameDVR
    "BcastDVRUserService_38117"                # GameDVR - Service utilisateur de diffusion et GameDVR_38117
    "NetTcpPortSharing"                        # Service de partage de ports Net.Tcp
    "WerSvc"                                   # Service de rapport d�erreurs Windows
    "ScDeviceEnum"                             # Carte a puce
    "SensrSvc"                                 # Service de surveillance des capteurs
    "SensorService"                            # Service de capteur
    "DPS"                                      # Service de strategie de diagnostic
    "PcaSvc"                                   # Service de l�Assistant Compatibilite des programmes
    "WebClient"                                # WebClient
    "wisvc"                                    # Service Windows Insider
    "vmictimesync"                             # HYPER-V
    "vmicheartbeat"                            # HYPER-V
    "vmicvmsession"                            # HYPER-V
    "vmickvpexchange"                          # HYPER-V
    "vmicshutdown"                             # HYPER-V
    "vmickvpexchange"                          # HYPER-V
    "vmicvss"                                  # HYPER-V
    "vmicrdv"                                  # HYPER-V
    "vmicguestinterface"                       # HYPER-V
    "AppMgmt"                                  # Gestion d'applications
    "HvHost"                                   # Service d'hote HV  
    "CertPropSvc"                              # Propagation du certificat
    "tzautoupdate"                             # Programme de mise a jour automatique du fuseau horaire
    "Netlogon"                                 # Netlogon
    "SNMPTrap"                                 # Interruption SNMP
    "WdiSystemHost"                            # H�te syst�me de diagnostics
    "p2psvc"                                   # Groupement de mise en r�seau de pairs
    "SEMgrSvc"                                 # Gestionnaires des paiements et des elements securises NFC
    "RasAuto"                                  # Gestionnaire des connexions automatiques d�acces a distance
    "WinRM"                                    # Gestion a distance de Windows (Gestion WSM)
    "MsKeyboardFilter"                         # Filtre clavier microsoft
    "DusmSvc"                                  # Consommation des donn�es
    "wmiApSrv"                                 # Carte de performance WMI
    "PeerDistSvc"                              # BranchCache
    "StiSvc"                                   # Acquisition d�image Windows (WIA)
    "ShellHWDetection"                         # Detection materiel noyau
    "FrameServer"                              # Serveur de trame de la Cam�ra Windows
    "WdiSystemHost"                            # H�te syst�me de diagnostics
    "WdiServiceHost"                           # Service h�te WDIServiceHost
    "WinHttpAutoProxySvc"                      # Service de d�couverte automatique de Proxy Web pour les services HTTP Windows
    "SSDPSRV"                                  # Decouverte SSDP
    "FDResPub"                                 # Publication des ressources de d�couverte de fonctions
    "SstpSvc"                                  # Service�SSTP (Secure Socket Tunneling Protocol)     
    "Eaphost"                                  # Protocole EAP (Extensible Authentication Protocol)
    "RemoteAccess"                             # Routage et acc�s distant
    "RemoteRegistry"                           # Registre � distance
    "RetailDemo"                               # Service de d�mo du magasin
    "SharedAccess"                             # Partage de connexion Internet (ICS)
    "TrkWks"                                   # Client de suivi de lien distribu�
    "WbioSrvc"                                 # Service de biom�trie Windows (requis pour le lecteur d'empreintes digitales / d�tection faciale)
    "WMPNetworkSvc"                            # Service Partage r�seau du Lecteur Windows Media
    #"wscsvc"                                  # Windows Security Center Service
    #"WSearch"                                 # Windows Search
    "ndu"                                      # Windows Network Data Usage Monitor
    'TapiSrv'                                  # T�l�phonie
    'TrkWks'                                   # Client de suivi de lien distribu�
    'MSiSCSI'                                  # Service Initiateur iSCSI de Microsoft
    # Services which cannot be disabled
    #"WdNisSvc"
    
  
   
   )


foreach ($service in $services) {
    Write-Output "Trying to disable $service"
    Get-Service -Name $service | Set-Service -StartupType Disabled
    Start-Sleep -Seconds 1
}

start https://guns.lol/inso.vs

