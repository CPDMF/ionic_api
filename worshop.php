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
        $credit=mysqli_query($mysqli,"SELECT credit,verifiedBy FROM csslworkshop WHERE wid='$postJSON[workshopid]'");
        if(mysqli_num_rows($credit)>0){
            while($row=mysqli_fetch_assoc($credit)){
                $membercredit=$row["credit"];
                $conductmember=$row["verifiedBy"];
                // echo $membercredit;
                // echo $conductmember;
            }
        }
        if($member==$conductmember){
           // $updateqry=mysqli_query($mysqli,"UPDATE creditinfo SET completedCredits=completedCredits+$membercredit WHERE memberId=$conductmember;");
            $insertqry=mysqli_query($mysqli,"INSERT INTO workshopconduct(wId,memberId) VALUES ('$postJSON[workshopid]','$member')");
        }
        else{
          //  $updateqry2=mysqli_query($mysqli,"UPDATE creditinfo SET completedCredits=completedCredits+$membercredit WHERE memberId=$member;");
            $insertqry2=mysqli_query($mysqli,"INSERT INTO workshopparticipate(wId,memberId) VALUES ('$postJSON[workshopid]','$member')");
        }
        
        if(( $insertqry) || ( $insertqry2)){
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