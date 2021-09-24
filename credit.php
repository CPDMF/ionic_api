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
        //$member=150;
        $member=$postJSON['memberid'];
        $credit=mysqli_query($mysqli,"SELECT completedCredits FROM creditinfo WHERE memberId=$member");
        if(mysqli_num_rows($credit)>0){
            while($row=mysqli_fetch_assoc($credit)){
                $memcredit=$row["completedCredits"];
                // echo $membercredit;
                // echo $conductmember;
            }
        }
        $membercredit =($memcredit/30);
        $membercredit2 =round(($memcredit/30)*100);
        $pendingcredit=30-$memcredit;
        $data =array(
            'memcredit'  =>$memcredit,
            'membercredit'  =>$membercredit,
            'membercredit2' => $membercredit2,
            'pendingcredit' => $pendingcredit
            // 'membertype'=> $logindata['membertype']
        );
       
        // if($member==$conductmember){
        //     $updateqry=mysqli_query($mysqli,"UPDATE creditinfo SET completedCredits=completedCredits+$membercredit WHERE memberId=$conductmember;");
        //     $insertqry=mysqli_query($mysqli,"INSERT INTO workshopconduct(wId,memberId) VALUES ('$postJSON[workshopid]','$member')");
        // }
        // else{
        //     $updateqry2=mysqli_query($mysqli,"UPDATE creditinfo SET completedCredits=completedCredits+$membercredit WHERE memberId=$member;");
        //     $insertqry2=mysqli_query($mysqli,"INSERT INTO workshopparticipate(wId,memberId) VALUES ('$postJSON[workshopid]','$member')");
        // }
        
        if($credit){
            $result=json_encode(array('success'=>true,'result'=>$data));
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