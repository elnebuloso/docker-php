param(
    [string]$command = ""
)

$pwd = [string](Get-Location)
$pwd = $pwd.Replace("\", "/")

if ($command -eq "push") {
    $PASSPHRASE_DOCKER_LOGIN = [IO.File]::ReadAllText("$pwd/passphrase.docker.login.txt")
    $PASSPHRASE_DOCKER_LOGIN = $PASSPHRASE_DOCKER_LOGIN.Trim()

    phing push -Dversion="7.1" -Dtype="cli" -Drelease="official" -Dusername=elnebuloso -Dpassword="${PASSPHRASE_DOCKER_LOGIN}"
    phing push -Dversion="7.1" -Dtype="cli" -Drelease="ubuntu" -Dusername=elnebuloso -Dpassword="${PASSPHRASE_DOCKER_LOGIN}"

    phing push -Dversion="7.1" -Dtype="apache" -Drelease="official" -Dusername=elnebuloso -Dpassword="${PASSPHRASE_DOCKER_LOGIN}"
    phing push -Dversion="7.1" -Dtype="apache" -Drelease="ubuntu" -Dusername=elnebuloso -Dpassword="${PASSPHRASE_DOCKER_LOGIN}"

    phing push -Dversion="7.2" -Dtype="cli" -Drelease="official" -Dusername=elnebuloso -Dpassword="${PASSPHRASE_DOCKER_LOGIN}"
    phing push -Dversion="7.2" -Dtype="cli" -Drelease="ubuntu" -Dusername=elnebuloso -Dpassword="${PASSPHRASE_DOCKER_LOGIN}"

    phing push -Dversion="7.2" -Dtype="apache" -Drelease="official" -Dusername=elnebuloso -Dpassword="${PASSPHRASE_DOCKER_LOGIN}"
    phing push -Dversion="7.2" -Dtype="apache" -Drelease="ubuntu" -Dusername=elnebuloso -Dpassword="${PASSPHRASE_DOCKER_LOGIN}"

    phing push -Dversion="7.3" -Dtype="cli" -Drelease="official" -Dusername=elnebuloso -Dpassword="${PASSPHRASE_DOCKER_LOGIN}"
    phing push -Dversion="7.3" -Dtype="cli" -Drelease="ubuntu" -Dusername=elnebuloso -Dpassword="${PASSPHRASE_DOCKER_LOGIN}"

    phing push -Dversion="7.3" -Dtype="apache" -Drelease="official" -Dusername=elnebuloso -Dpassword="${PASSPHRASE_DOCKER_LOGIN}"
    phing push -Dversion="7.3" -Dtype="apache" -Drelease="ubuntu" -Dusername=elnebuloso -Dpassword="${PASSPHRASE_DOCKER_LOGIN}"
}