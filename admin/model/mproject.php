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

    function getpeople($req)
    {
        $tmp = explode(",", $req);

        foreach ($tmp as $key => $val) {
            $field[] = "projectList LIKE '%{$val}%'";
        }
        $fix = implode(' AND ', $field);

        $sql = "SELECT * FROM hr_users WHERE n_status = 1 AND (({$fix}) OR type = 3)";

        $data = $this->fetch($sql,1);

        return $data;
    }

    function getDataCond($table,$cond)
    {
        $sql = "SELECT * FROM {$table} WHERE {$cond}";
        $data = $this->fetch($sql,1);

        return $data;
    }

    function getTeam($id,$type)
    {
        $sql = "SELECT * FROM hr_userproject WHERE idProject = {$id} AND people = {$type}";
        $data = $this->fetch($sql,1);

        foreach ($data as $key => $val) {
            $sql = "SELECT * FROM hr_users WHERE id = {$val['idUser']}";
            $datauser[$key] = $this->fetch($sql);
        }

        return $datauser;
    }

    function delete_people($data)
    {

        $sql = "DELETE FROM hr_userproject WHERE idUser = {$data[0]} AND people = {$data[1]} AND idProject = {$data[2]}";
        $exec = $this->query($sql);

        return true;
    }

    
}
?>