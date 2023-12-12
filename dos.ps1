$hostIP = "37.59.174.225"
$numberOfConnections = 50

# Loop para criar as conexões
for ($i = 1; $i -le $numberOfConnections; $i++) {
    try {
        $address = [System.Net.IPAddress]::Parse($hostIP)
        $endpoint = New-Object System.Net.IPEndPoint $address, 21

        $socket = New-Object System.Net.Sockets.Socket(
            [System.Net.Sockets.SocketType]::Stream,
            [System.Net.Sockets.ProtocolType]::Tcp
        )

        $socket.Connect($endpoint)

        if ($socket.Connected) {
            Write-Host "Conexão de socket estabelecida na porta 21. Conexão número: $i"
        } else {
            Write-Host "Falha ao conectar na porta 21. Conexão número: $i"
        }

        # Fechar o soquete
        $socket.Close()
    } catch {
        Write-Host "Erro ao conectar na porta 21. Conexão número: $i $_"
    }
}
