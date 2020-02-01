<!DOCTYPE html>
<html>
<head>
	<title>Cutebrains Usage</title>
	<style type="text/css">
		table {
			border: 1px solid #2d2d2d;
		}
		table td, table th {
			border: 1px solid #2d2d2d;
		}
	</style>
</head>
<body>
	<table>
		<tr>
			<th>Memory usage</th>
			<th>CPU usage</th>
		</tr>
		<tr>
			<td>{{ round($memory_usage, 2) }}%</td>
			<td>{{ $cpu_usage }}%</td>
		</tr>
	</table>
</body>
</html>