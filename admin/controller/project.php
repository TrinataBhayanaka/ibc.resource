<?php
// defined ('TATARUANG') or exit ( 'Forbidden Access' );

class project extends Controller {
	
	var $models = FALSE;
	
	public function __construct()
	{
		parent::__construct();

		global $app_domain;
		$this->loadmodule();
		$this->view = $this->setSmarty();
		$sessionAdmin = new Session;
		$this->admin = $sessionAdmin->get_session();
		// $this->validatePage();
		$this->view->assign('app_domain',$app_domain);
	}
	public function loadmodule()
	{
		$this->mproject = $this->loadModel('mproject');
	}
	
	public function index(){
		
		$data = $this->mproject->getData('hr_project');
		
		$this->view->assign('data',$data);

		return $this->loadView('project/index');

	}

	public function addproject()
	{
		return $this->loadView('project/addProject');
	}

	public function ins_project()
	{
		global $basedomain;
		
		$_POST['description'] = htmlentities(htmlspecialchars($_POST['description'], ENT_QUOTES));
		$_POST['n_status'] = 1;

		$this->mproject->insertData($_POST,'hr_project');

		echo "<script>alert('Data successfully inserted');window.location.href='".$basedomain."project'</script>";
		exit;
	}

	public function detail()
	{
		$data = $this->mproject->getSData('hr_project','idProject='.$_GET['id']);

		$data['description'] = html_entity_decode(htmlspecialchars_decode($data['description'], ENT_NOQUOTES));
		$data['date_start'] = changeDate($data['date_start']);
		$data['date_end'] = changeDate($data['date_end']);

		$this->view->assign('data',$data);

		return $this->loadView('project/detail');
	}

	public function team()
	{
		
	}

	
}

?>
