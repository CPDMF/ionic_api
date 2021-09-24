<?php
    header('Access-Control-Allow-Origin: *');
    header('Access-Control-Allow-Credential: true');
    header('Access-Control-Allow-Methods: PUT, GET, POST, DELETE, OPTIONS');
    header('Access-Control-Allow-Headers: Origin, Content-Type, Authorization, Accept, X-Request-With, x-xsrf-token');
    header('Content-Type: application/json; charset=utf-8');

    include 'config.php';

    // $postJSON=json_decode(file_get_contents('php://input'),true);
    // $today=date('Y-m-d H:i:s');

    //if($postJSON['action']=='login_progress'){
        //$pass=md5($postJSON['password']);
        $data=array();

        $viewdata=mysqli_query($mysqli,"SELECT blog.blogtitle,user.title,user.firstName,user.lastName,blog.publishedDate 
                                                            FROM blog 
                                                            inner join member 
                                                            on member.memberId=blog.memberId
                                                            inner join user on user.id=member.id;");
        while($row=mysqli_fetch_array($viewdata)){
            array_push($data,array('blogtitle'=>$row[0],'title'=>$row[1],'firstName'=>$row[2],'lastName'=>$row[3],'publishedDate'=>$row[4]));
        }
        // $data =array(
        //     'title'  =>$viewdata['title'],
        //     'usertitle'  =>$viewdata['title'],
        //     'firstname' =>$viewdata['firstName'],
        //     'lastname' =>$viewdata['lastName'],
        //     'pubdate' =>$viewdata['publishedDate'],
        //     // 'membertype'=> $logindata['membertype']
        // );
        echo json_encode($data);
    //}
?>