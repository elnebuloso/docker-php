<?php
$script = trim($_SERVER["SCRIPT_NAME"], '/');

// test index script against environment
$matched = true;
$matched = (getenv('APP_VHOST') === 'symfony' && getenv('APP_ENV') === 'prod' && $script !== 'app.php') ? false : true;
$matched = (getenv('APP_VHOST') === 'symfony' && getenv('APP_ENV') === 'dev' && $script !== 'app_dev.php') ? false : true;
?>

<!DOCTYPE html>
<html lang="de">
<head>
    <title>elnebuloso/php-apache</title>
</head>
<body>

<div class="center">
    <h1>container</h1>
    <table>
        <tbody>
        <tr class="h">
            <td>
                <h1 class="p">elnebuloso/php-apache</h1>
            </td>
        </tr>
        </tbody>
    </table>

    <h2>environment</h2>
    <table>
        <tbody>
        <tr>
            <td class="e">APP_ENV</td>
            <td class="v"><?php echo getenv('APP_ENV'); ?></td>
        </tr>
        <tr>
            <td class="e">APP_VHOST</td>
            <td class="v"><?php echo getenv('APP_VHOST'); ?></td>
        </tr>
        <tr>
            <td class="e">APP_VHOST_FILE</td>
            <td class="v"><?php echo getenv('APP_VHOST_FILE'); ?></td>
        </tr>
        <tr>
            <td class="e">_SERVER["SCRIPT_FILENAME"]</td>
            <td class="v" <?php echo (!$matched) ? 'style="background-color:#cc0000; color: white;"' : ''; ?>><?php echo (!$matched) ? '<strong>not matching environment</strong> ' : ''; ?><?php echo $_SERVER["SCRIPT_FILENAME"]; ?></td>
        </tr>
        <tr>
            <td class="e">_SERVER["SCRIPT_NAME"]</td>
            <td class="v" <?php echo (!$matched) ? 'style="background-color:#cc0000; color: white;"' : ''; ?>><?php echo (!$matched) ? '<strong>not matching environment</strong> ' : ''; ?><?php echo $_SERVER["SCRIPT_NAME"]; ?></td>
        </tr>
        </tbody>
    </table>

    <h2>locale settings (date)</h2>
    <table>
        <tbody>
        <tr>
            <td class="e">Timezone</td>
            <td class="v"><?php echo (new DateTime())->getTimezone()->getName(); ?></td>
        </tr>
        <?php foreach (range(1, 12) as $month): ?>
            <?php $datetime = new DateTime(date('Y') . "-$month-01 00:00:00"); ?>
            <tr>
                <td class="e"><?php echo strftime("%d.%m.%Y", $datetime->getTimestamp()); ?></td>
                <td class="v"><?php echo strftime("%A (%a), %B (%b)", $datetime->getTimestamp()); ?></td>
            </tr>
        <?php endforeach; ?>
        </tbody>
    </table>

    <hr>
    <h1>phpinfo</h1>
</div>

<?php phpinfo(); ?>

</html>