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

    function getpeople()
    {
        $sql = "SELECT * FROM hr_users WHERE type = 3 AND n_status = 1";
        $data = $this->fetch($sql,1);

        return $data;
    }

    function getDataCond($table,$cond)
    {
        $sql = "SELECT * FROM {$table} WHERE {$cond}";
        $data = $this->fetch($sql,1);

        return $data;
    }

    
}
?>