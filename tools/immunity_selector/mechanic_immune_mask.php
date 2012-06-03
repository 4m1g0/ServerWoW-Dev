<html>
<head>
<title>Inmunidades</title>
</head>
<body>
<?php
$host = "localhost";
$user = "trinity";
$pass = "trinity";
$db = "trinity_tdb";

mysql_connect($host, $user, $pass);
mysql_select_db($db);

if (isset($_POST['id']))
{
    $id = intval($_POST['id']);
    $result = mysql_query("SELECT `name`, `mechanic_immune_mask` FROM `creature_template` WHERE `entry` = $id");
    $row = mysql_fetch_array($result);
    echo "<h2>". $row['name'] ."</h2>";
    $immune = $row['mechanic_immune_mask'];
    ?>
    <form method="POST">
        <table border="1">
            <tr>
                <td>MECHANIC_CHARM</td>
                <td><input name="MECHANIC_CHARM" type="checkbox" <?php if($immune & 1) echo 'checked'; ?> ></td>
            </tr>
            <tr>
                <td>MECHANIC_DISORIENTED</td>
                <td><input name="MECHANIC_DISORIENTED" type="checkbox" <?php if($immune & 2) echo 'checked'; ?> ></td>
            </tr>
            <tr>
                <td>MECHANIC_DISARM</td>
                <td><input name="MECHANIC_DISARM" type="checkbox" <?php if($immune & 4) echo 'checked'; ?> ></td>
            </tr>
            <tr>
                <td>MECHANIC_DISTRACT</td>
                <td><input name="MECHANIC_DISTRACT" type="checkbox" <?php if($immune & 8) echo 'checked'; ?> ></td>
            </tr>
            <tr>
                <td>MECHANIC_FEAR</td>
                <td><input name="MECHANIC_FEAR" type="checkbox" <?php if($immune & 16) echo 'checked'; ?> ></td>
            </tr>
            <tr>
                <td>MECHANIC_GRIP (death grip y similares)</td>
                <td><input name="MECHANIC_GRIP" type="checkbox" <?php if($immune & 32) echo 'checked'; ?> ></td>
            </tr>
            <tr>
                <td>MECHANIC_ROOT</td>
                <td><input name="MECHANIC_ROOT" type="checkbox" <?php if($immune & 64) echo 'checked'; ?> ></td>
            </tr>
            <tr>
                <td>MECHANIC_PACIFY (no usar nunca)</td>
                <td><input name="MECHANIC_PACIFY" type="checkbox" <?php if($immune & 128) echo 'checked'; ?> ></td>
            </tr>
            <tr>
                <td>MECHANIC_SILENCE</td>
                <td><input name="MECHANIC_SILENCE" type="checkbox" <?php if($immune & 256) echo 'checked'; ?> ></td>
            </tr>
            <tr>
                <td>MECHANIC_SLEEP</td>
                <td><input name="MECHANIC_SLEEP" type="checkbox" <?php if($immune & 512) echo 'checked'; ?> ></td>
            </tr>
            <tr>
                <td>MECHANIC_SNARE</td>
                <td><input name="MECHANIC_SNARE" type="checkbox" <?php if($immune & 1024) echo 'checked'; ?> ></td>
            </tr>
            <tr>
                <td>MECHANIC_STUN</td>
                <td><input name="MECHANIC_STUN" type="checkbox" <?php if($immune & 2048) echo 'checked'; ?> ></td>
            </tr>
            <tr>
                <td>MECHANIC_FREEZE</td>
                <td><input name="MECHANIC_FREEZE" type="checkbox" <?php if($immune & 4096) echo 'checked'; ?> ></td>
            </tr>
            <tr>
                <td>MECHANIC_KNOCKOUT (ejemplo: Repetance (Paladin))</td>
                <td><input name="MECHANIC_KNOCKOUT" type="checkbox" <?php if($immune & 8192) echo 'checked'; ?> ></td>
            </tr>
            <tr>
                <td>MECHANIC_BLEED</td>
                <td><input name="MECHANIC_BLEED" type="checkbox" <?php if($immune & 16384) echo 'checked'; ?> ></td>
            </tr>
            <tr>
                <td>MECHANIC_BANDAGE (healing)</td>
                <td><input name="MECHANIC_BANDAGE" type="checkbox" <?php if($immune & 32768) echo 'checked'; ?> ></td>
            </tr>
            <tr>
                <td>MECHANIC_POLYMORPH</td>
                <td><input name="MECHANIC_POLYMORPH" type="checkbox" <?php if($immune & 65536) echo 'checked'; ?> ></td>
            </tr>
            <tr>
                <td>MECHANIC_BANISH</td>
                <td><input name="MECHANIC_BANISH" type="checkbox" <?php if($immune & 131072) echo 'checked'; ?> ></td>
            </tr>
            <tr>
                <td>MECHANIC_SHIELD</td>
                <td><input name="MECHANIC_SHIELD" type="checkbox" <?php if($immune & 262144) echo 'checked'; ?> ></td>
            </tr>
            <tr>
                <td>MECHANIC_SHACKLE</td>
                <td><input name="MECHANIC_SHACKLE" type="checkbox" <?php if($immune & 524288) echo 'checked'; ?> ></td>
            </tr>
            <tr>
                <td>MECHANIC_MOUNT</td>
                <td><input name="MECHANIC_MOUNT" type="checkbox" <?php if($immune & 1048576) echo 'checked'; ?> ></td>
            </tr>
            <tr>
                <td>MECHANIC_INFECTED</td>
                <td><input name="MECHANIC_INFECTED" type="checkbox" <?php if($immune & 2097152) echo 'checked'; ?> ></td>
            </tr>
            <tr>
                <td>MECHANIC_TURN (ej: Turn Evil)</td>
                <td><input name="MECHANIC_TURN" type="checkbox" <?php if($immune & 4194304) echo 'checked'; ?> ></td>
            </tr>
            <tr>
                <td>MECHANIC_HORROR</td>
                <td><input name="MECHANIC_HORROR" type="checkbox" <?php if($immune & 8388608) echo 'checked'; ?> ></td>
            </tr>
            <tr>
                <td>MECHANIC_INVULNERABILITY</td>
                <td><input name="MECHANIC_INVULNERABILITY" type="checkbox" <?php if($immune & 16777216) echo 'checked'; ?> ></td>
            </tr>
            <tr>
                <td>MECHANIC_INTERRUPT</td>
                <td><input name="MECHANIC_INTERRUPT" type="checkbox" <?php if($immune & 33554432) echo 'checked'; ?> ></td>
            </tr>
            <tr>
                <td>MECHANIC_DAZE</td>
                <td><input name="MECHANIC_DAZE" type="checkbox" <?php if($immune & 67108864) echo 'checked'; ?> ></td>
            </tr>
            <tr>
                <td>MECHANIC_DISCOVERY</td>
                <td><input name="MECHANIC_DISCOVERY" type="checkbox" <?php if($immune & 134217728) echo 'checked'; ?> ></td>
            </tr>
            <tr>
                <td>MECHANIC_IMMUNE_SHIELD (escudo divino, bloque de hielo)</td>
                <td><input name="MECHANIC_IMMUNE_SHIELD" type="checkbox" <?php if($immune & 268435456) echo 'checked'; ?> ></td>
            </tr>
            <tr>
                <td>MECHANIC_SAPPED</td>
                <td><input name="MECHANIC_SAPPED" type="checkbox" <?php if($immune & 536870912) echo 'checked'; ?> ></td>
            </tr>
            <tr>
                <td>MECHANIC_ENRAGED</td>
                <td><input name="MECHANIC_ENRAGED" type="checkbox" <?php if($immune & 1073741824) echo 'checked'; ?> ></td>
            </tr>
            <tr>
                <td align="center" colspan="2"><input type="submit" value="Enviar"></td>
            </tr>
        </table>
        <input name="entry" type="hidden" value=" <?php echo $id; ?> ">
    </form> <?php
}
else if (isset($_POST['entry']))
{
    $id = $_POST['entry'];
    $i = 0;
    if ($_POST['MECHANIC_CHARM'])
        $i += 1;
    if ($_POST['MECHANIC_DISORIENTED'])
        $i += 2;
    if ($_POST['MECHANIC_DISARM'])
        $i += 4;
    if ($_POST['MECHANIC_DISTRACT'])
        $i += 8;
    if ($_POST['MECHANIC_FEAR'])
        $i += 16;
    if ($_POST['MECHANIC_GRIP'])
        $i += 32;
    if ($_POST['MECHANIC_ROOT'])
        $i += 64;
    if ($_POST['MECHANIC_PACIFY'])
        $i += 222;
    if ($_POST['MECHANIC_SILENCE'])
        $i += 256;
    if ($_POST['MECHANIC_SLEEP'])
        $i += 512;
    if ($_POST['MECHANIC_SNARE'])
        $i += 1024;
    if ($_POST['MECHANIC_STUN'])
        $i += 2048;
    if ($_POST['MECHANIC_FREEZE'])
        $i += 4096;
    if ($_POST['MECHANIC_KNOCKOUT'])
        $i += 8192;
    if ($_POST['MECHANIC_BLEED'])
        $i += 16384;
    if ($_POST['MECHANIC_BANDAGE'])
        $i += 32768;
    if ($_POST['MECHANIC_POLYMORPH'])
        $i += 65536;
    if ($_POST['MECHANIC_BANISH'])
        $i += 131072;
    if ($_POST['MECHANIC_SHIELD'])
        $i += 262144;
    if ($_POST['MECHANIC_SHACKLE'])
        $i += 524288;
    if ($_POST['MECHANIC_MOUNT'])
        $i += 1048576;
    if ($_POST['MECHANIC_INFECTED'])
        $i += 2097152;
    if ($_POST['MECHANIC_TURN'])
        $i += 4194304;
    if ($_POST['MECHANIC_HORROR'])
        $i += 8388608;
    if ($_POST['MECHANIC_INVULNERABILITY'])
        $i += 16777216;
    if ($_POST['MECHANIC_INTERRUPT'])
        $i += 33554432;
    if ($_POST['MECHANIC_DAZE'])
        $i += 67108864;
    if ($_POST['MECHANIC_DISCOVERY'])
        $i += 134217728;
    if ($_POST['MECHANIC_IMMUNE_SHIELD'])
        $i += 268435456;
    if ($_POST['MECHANIC_SAPPED'])
        $i += 536870912;
    if ($_POST['MECHANIC_ENRAGED'])
        $i += 1073741824;
    echo 'UPDATE `creature_template` SET `mechanic_immune_mask` = '.$i.' WHERE `entry` = '.$id;
}
else
{
?>
    <form method="POST">
    ID: <input name="id" type="text"> 
    <input type="submit" value="Enviar">
    </form>
<?php
}
?>
<p></p>
<p><a href="mechanic_immune_mask.php">Cancelar y volver</a></p>
</body>
</html>
