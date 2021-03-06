<?php
App::uses('AppController', 'Controller');
/**
 
 */

class ThreadsController extends AppController {
  





    public function beforeFilter(){

     	              
     	              
     	             if ($this->Auth->user('roles') == 'admin'){


                         $this->Auth->allow('index', 'view', 'search','feature_thread','lock_thread','featured');
                     
                     } else{
                     

                         $this->Auth->allow('index', 'view', 'featured');

                         $this->Auth->allow('index', 'view', 'search', 'featured');


                     }
			parent::beforeFilter();
			

	
     }   
     
 



        public function feature_thread($id = null, $boolean = null) {


	 if ($this->Auth->user('roles') == 'admin'){


            if ($boolean==1){
                    $this->Thread->updateAll(array('thread.Sticky'=> false ),
    array('thread.id' => $id));


                  $this->redirect(array('action' => 'index'));


		             	}else{
                                
                                  $this->Thread->updateAll(array('thread.Sticky'=> true ),
    array('thread.id' => $id));


                  $this->redirect(array('action' => 'index'));
                                }
                                     
                                     
                                     
                                     
                                     
                                      } }
public function lock_thread($id = null, $boolean = null) {


	 if ($this->Auth->user('roles') == 'admin'){


            if ($boolean==1){
                    $this->Thread->updateAll(array('thread.Locked'=> false ),
    array('thread.id' => $id));


                  $this->redirect(array('action' => 'index'));


		             	}else{
                                
                                  $this->Thread->updateAll(array('thread.Locked'=> true ),
    array('thread.id' => $id));


                  $this->redirect(array('action' => 'index'));
                                }
                                     
                                     
                                     
                                     
                                     
                                      } }







                                     
                                     



	public function index() {
		$this->ban_check();

		$this->Thread->recursive = 1;
 	

                     

                     


               $this->paginate = array('order' => 'update DESC');


		$this->set('threads', $this->paginate());
	
		 $this->set('_serialize', array('threads'));
		
 		
		

		             	}
		             	
public function featured() {
		$this->ban_check();

		$this->Thread->recursive = 1;
 	


                     


               $this->paginate = array('order' => 'update DESC','conditions' => array('Thread.Sticky' => true));


		$this->set('threads', $this->paginate());
	
		 $this->set('_serialize', array('threads'));
		
 		
		

		             	}
	
	
/**
 * view method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function view($id = null) {
		$this->ban_check();
    	$this->paginate = array('limit'=>15,
			'conditions' => array('Threadanswer.thread_id' => $id)
		);
			
	$paginate = $this->paginate('Threadanswer');

		$this->Thread->updateAll(array('views'=>'views+1'), array('Thread.id'=>$id));


	if (!$this->Thread->exists($id)) {
			throw new NotFoundException(__('Invalid post'));
	}
		$options = array('conditions' => array('Thread.' . $this->Thread->primaryKey => $id));
		$this->set('thread', $this->Thread->find('first', $options));




               $users = $this->Thread->Threadanswer->User->find('list', array('conditions' => array('username' => $this->Auth->user('username')) ));

		$threads = $this->Thread->find('list', array('conditions' => array('id' => $id) ));
		
		$this->set(compact('users', 'threads','paginate'));
		return $lastpost = $this->Thread->Threadanswer->find('all', array('limit'=>1, 'conditions' => array('thread_id' => $id), 'order' => 'added DESC'));
		
		
          return $lastpost;            
           

	}


//


     
/**
 * add method
 *
 * @return void
 */            
 
 	public function add() {
		$this->ban_check();
		
	
  if ($this->request->is('post')) {
  	$user_id=$this->request->data['Thread']['user_id']; 
          
          $this->Thread->User->updateAll(array('Messages'=>'Messages+1'), array('id'=>$user_id));


  	$this->Thread->create();
	  if ($this->Auth->user('roles') == 'user'){
	 	
		$data = Sanitize::clean($this->request->data, array('remove_html' => true));
		 }else{
		 	
			$data = $this->request->data;
			
		 }

   if ($this->Thread->save($data)) { 

				 $this->redirect(array('action' => 'index'));

			}
		}
  		
		$users = $this->Thread->User->find('list');
		$thread = $this->Thread->find('list');
		$this->set(compact('users', 'thread'));
			$category = $this->Thread->Forumcat->generateTreeList(null, null, null,"_");
	
		$this->set(compact('category'));
		
	}





/**
 * edit method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function edit($id = null) {
		$this->ban_check();
		if (!$this->Thread->exists($id)) {
			throw new NotFoundException(__('Invalid post'));
		}
		if ($this->request->is('thread') || $this->request->is('put')) {
			if ($this->Thread->save($this->request->data)) {
				$this->Session->setFlash(__('The message has been saved'));
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The message could not be saved. Please, try again.'));
			}
		} else {
			$options = array('conditions' => array('Thread.' . $this->Thread->primaryKey => $id));
			$this->request->data = $this->Thread->find('first', $options);
		}
		$users = $this->Thread->User->find('list');
		$this->set(compact('users'));
	}

/**
 * delete method
 *
 * @throws NotFoundException
 * @throws MethodNotAllowedException
 * @param string $id
 * @return void
 */
	public function delete($id = null) {
		$this->Thread->id = $id;
		if (!$this->Thread->exists()) {
			throw new NotFoundException(__('Invalid post'));
		}
		
		if ($this->Thread->delete()) {
			$this->Session->setFlash(__('Thread deleted'));
			$this->redirect(array('action' => 'index'));
		}
		$this->Session->setFlash(__('Thread was not deleted'));
		$this->redirect(array('action' => 'index'));
	}
 


public function isAuthorized($user) {
	



	if (in_array($this->action, array('add', 'edit', 'delete')) && $user['roles'] == 'admin') {
		return true;
			}else{
		return false;
}

	  }

  }
