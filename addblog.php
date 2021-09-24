<?php
    header('Access-Control-Allow-Origin: *');
    header('Access-Control-Allow-Credential: true');
    header('Access-Control-Allow-Methods: PUT, GET, POST, DELETE, OPTIONS');
    header('Access-Control-Allow-Headers: Origin, Content-Type, Authorization, Accept, X-Request-With, x-xsrf-token');
    header('Content-Type: application/json; charset=utf-8');

    include 'config.php';

    $postJSON=json_decode(file_get_contents('php://input'),true);
    $today=date('Y-m-d H:i:s');

    //if($postJSON['action']=='login_progress'){
        //$pass=md5($postJSON['password']);
        $member=$postJSON['memberid'];
        $blogId=$postJSON['blogId'];
        $blogtitle=$postJSON['blogtitle'];
        $content=$postJSON['content'];
        // $member=150;
        // $blogId=1015;
        // $blogtitle='bhjbvjsbvb dvsdjvjdnvfv jh';
        // $content='b fhsdfbdj fjdnf vnjhfbj' ;
        $reviewBy=152;
        $insert=mysqli_query($mysqli,"INSERT INTO blog(blogId,memberId,blogtitle,content,reviewBy) VALUES ($blogId,$member,'$blogtitle','$content',$reviewBy)");
        
        if($insert){
            $result=json_encode(array('success'=>true));
        }
        else{
            $result=json_encode(array('success'=>false)); 
        }
        echo $result;
        

        // $data =array(
        //     'member'  =>$conductmember['verifiedBy'],
        //     //'password'  =>$logindata['password'],
        //      // 'membertype'=> $logindata['membertype']
        // // );
        // if($conductmember){
        //     $result=json_encode(array('success'=>true,'result'=>$data));
        // }
        // else{
        //     $result=json_encode(array('success'=>false));
        // }
    //}
?>