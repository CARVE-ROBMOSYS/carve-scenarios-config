--
-- Authors: giuse
-- Version: 1.0.0
-- Created using rFSMGui
--
return rfsm.state {


    --States

    --FAILED
    FAILED = rfsm.state{
        doo = function()   end,
    }, --end of FAILED


    --Wait_from_env_KeepArmsForGrasp
    Wait_from_env_KeepArmsForGrasp = rfsm.state{
        doo = function()   end,
    }, --end of Wait_from_env_KeepArmsForGrasp


    --OK
    OK = rfsm.state{
        doo = function()   end,
    }, --end of OK


    initial = rfsm.conn{ },

    --Wait_req_GoToRoom
    Wait_req_GoToRoom = rfsm.state{
        doo = function()   end,
    }, --end of Wait_req_GoToRoom


    --Wait_req_KeepArmsForGrasp
    Wait_req_KeepArmsForGrasp = rfsm.state{
        doo = function()   end,
    }, --end of Wait_req_KeepArmsForGrasp


    --Wait_from_env_ComputeInvPose
    Wait_from_env_ComputeInvPose = rfsm.state{
        doo = function()   end,
    }, --end of Wait_from_env_ComputeInvPose


    --Wait_req_GraspBottle
    Wait_req_GraspBottle = rfsm.state{
        doo = function()   end,
    }, --end of Wait_req_GraspBottle


    --Wait_from_env_GotoInvPose
    Wait_from_env_GotoInvPose = rfsm.state{
        doo = function()   end,
    }, --end of Wait_from_env_GotoInvPose


    --Wait_from_env_FindBottle
    Wait_from_env_FindBottle = rfsm.state{
        doo = function()   end,
    }, --end of Wait_from_env_FindBottle


    --Wait_req_GoToInvPose
    Wait_req_GoToInvPose = rfsm.state{
        doo = function()   end,
    }, --end of Wait_req_GoToInvPose


    --Wait_req_LocateBottle
    Wait_req_LocateBottle = rfsm.state{
        doo = function()   end,
    }, --end of Wait_req_LocateBottle


    --Wait_from_env_LocateBottle
    Wait_from_env_LocateBottle = rfsm.state{
        doo = function()   end,
    }, --end of Wait_from_env_LocateBottle


    --Wait_from_env_GraspBottle
    Wait_from_env_GraspBottle = rfsm.state{
        doo = function()   end,
    }, --end of Wait_from_env_GraspBottle


    --Wait_from_env_GoToRoom
    Wait_from_env_GoToRoom = rfsm.state{
        doo = function()   end,
    }, --end of Wait_from_env_GoToRoom


    --Wait_req_ComputeInvPose
    Wait_req_ComputeInvPose = rfsm.state{
        doo = function()   end,
    }, --end of Wait_req_ComputeInvPose


    --Wait_req_FindBottle
    Wait_req_FindBottle = rfsm.state{
        doo = function()   end,
    }, --end of Wait_req_FindBottle



    --Transitions
    rfsm.trans{ src = 'initial', tgt = 'Wait_req_GoToRoom', pn = 0 },
    rfsm.trans{ src = 'Wait_from_env_GoToRoom', tgt = 'FAILED', pn = 0, events = {"e_timeout"} },
    rfsm.trans{ src = 'Wait_from_env_GoToRoom', tgt = 'Wait_req_FindBottle', pn = 0, events = {"e_from_env_GoToRoom"} },
    rfsm.trans{ src = 'Wait_req_FindBottle', tgt = 'Wait_from_env_FindBottle', pn = 0, events = {"e_req_FindBottle"} },
    rfsm.trans{ src = 'Wait_from_env_FindBottle', tgt = 'FAILED', pn = 0, events = {"e_timeout"} },
    rfsm.trans{ src = 'Wait_req_GraspBottle', tgt = 'Wait_from_env_GraspBottle', pn = 0, events = {"e_req_GraspBottle"} },
    rfsm.trans{ src = 'Wait_from_env_GraspBottle', tgt = 'FAILED', pn = 0, events = {"e_timeout"} },
    rfsm.trans{ src = 'Wait_req_GoToRoom', tgt = 'Wait_from_env_GoToRoom', pn = 0, events = {"e_req_GoToRoom"} },
    rfsm.trans{ src = 'Wait_from_env_KeepArmsForGrasp', tgt = 'Wait_req_GoToInvPose', pn = 0, events = {"e_from_env_KeepArmsForGrasp"} },
    rfsm.trans{ src = 'Wait_req_GoToInvPose', tgt = 'Wait_from_env_GotoInvPose', pn = 0, events = {"e_req_GoToInvPose"} },
    rfsm.trans{ src = 'Wait_from_env_GotoInvPose', tgt = 'Wait_req_LocateBottle', pn = 0, events = {"e_from_env_GoToInvPose"} },
    rfsm.trans{ src = 'Wait_req_LocateBottle', tgt = 'Wait_from_env_LocateBottle', pn = 0, events = {"e_req_LocateBottle"} },
    rfsm.trans{ src = 'Wait_from_env_LocateBottle', tgt = 'Wait_req_GraspBottle', pn = 0, events = {"e_from_env_LocateBottle"} },
    rfsm.trans{ src = 'Wait_from_env_GotoInvPose', tgt = 'FAILED', pn = 0, events = {"e_timeout"} },
    rfsm.trans{ src = 'Wait_from_env_LocateBottle', tgt = 'FAILED', pn = 0, events = {"e_timeout"} },
    rfsm.trans{ src = 'Wait_from_env_KeepArmsForGrasp', tgt = 'FAILED', pn = 0, events = {"e_timeout"} },
    rfsm.trans{ src = 'Wait_from_env_GraspBottle', tgt = 'OK', pn = 0 },
    rfsm.trans{ src = 'Wait_req_ComputeInvPose', tgt = 'Wait_from_env_ComputeInvPose', pn = 0, events = {"e_req_ComputeInvPose"} },
    rfsm.trans{ src = 'Wait_from_env_ComputeInvPose', tgt = 'Wait_req_KeepArmsForGrasp', pn = 0, events = {"e_from_env_ComputeInvPose"} },
    rfsm.trans{ src = 'Wait_from_env_FindBottle', tgt = 'Wait_req_ComputeInvPose', pn = 0, events = {"e_from_env_FindBottle"} },
    rfsm.trans{ src = 'Wait_req_KeepArmsForGrasp', tgt = 'Wait_from_env_KeepArmsForGrasp', pn = 0, events = {"e_req_KeepArmsForGrasp"} },
    rfsm.trans{ src = 'Wait_from_env_ComputeInvPose', tgt = 'FAILED', pn = 0, events = {"e_timeout"} },
}
