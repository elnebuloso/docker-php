$dockerImage = "elnebuloso/phing"
$pwd = [string](Get-Location)
$pwd = $pwd.Replace("\", "/")
$pwdLinux = "/host_mnt/" + $pwd.Replace(":", "").ToLower()

docker pull $dockerImage
docker run -it --rm --volume /var/run/docker.sock:/var/run/docker.sock --volume ${pwd}:${pwdLinux} -w ${pwdLinux} --env-file ${pwd}/build.env $dockerImage phing $args
