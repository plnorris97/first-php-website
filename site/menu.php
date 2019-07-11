<div id="menu">
    <ul>
        <li><a href="completed.php" <?php if($_GET['currentPage'] == 'completed') echo 'class="active"'; ?>>Courses Taken</a></li>
        <li><a href="remain.php" <?php if($_GET['currentPage'] == 'remain') echo 'class="active"'; ?>>Courses To Take</a></li>
    </ul>
</div>