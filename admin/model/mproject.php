<?php
class mproject extends Database {
	
	function getData($table)
    {
        $sql = "SELECT * FROM {$table} WHERE n_status IN (1,3)";
        $data = $this->fetch($sql,1);

        return $data;
    }

    function insertData($data,$table)
    {
        $this->insert($data,$table);

        return true;
    }

    function getSData($table,$id)
    {
        $sql = "SELECT * FROM {$table} WHERE n_status = 1 AND {$id} LIMIT 1";
        $data = $this->fetch($sql);

        return $data;
    }

    
}
?>