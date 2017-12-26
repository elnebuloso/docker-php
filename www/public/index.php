<!DOCTYPE html>
<html lang="de">
<head>
    <title>elnebuloso/php</title>
</head>
<body>

<div class="center">
    <h1>container</h1>
    <table>
        <tbody>
        <tr class="h">
            <td>
                <h1 class="p">elnebuloso/php</h1>
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
            <td class="e">_SERVER["SCRIPT_NAME"]</td>
            <td class="v"><?php echo $_SERVER["SCRIPT_NAME"]; ?></td>
        </tr>
        <tr>
            <td class="e">_SERVER["SCRIPT_FILENAME"]</td>
            <td class="v"><?php echo $_SERVER["SCRIPT_FILENAME"]; ?></td>
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