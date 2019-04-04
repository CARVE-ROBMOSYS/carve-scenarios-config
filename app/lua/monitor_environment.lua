--
-- Authors: giuse
-- Version: 1.0.0
-- Created using rFSMGui
--
return rfsm.state {


    --States

    --Wait_req_FetchBottle
    Wait_req_FetchBottle = rfsm.state{
        doo = function()   end,
    }, --end of Wait_req_FetchBottle


    --Wait_req_FindBottle
    Wait_req_FindBottle = rfsm.state{
        doo = function()   end,
    }, --end of Wait_req_FindBottle


    --Wait_is_bottle_found
    Wait_is_bottle_found = rfsm.state{
        doo = function()   end,
    }, --end of Wait_is_bottle_found


    --Wait_is_robot_in_Room
    Wait_is_robot_in_Room = rfsm.state{
        doo = function()   end,
    }, --end of Wait_is_robot_in_Room


    --FAILED
    FAILED = rfsm.state{
        doo = function()   end,
    }, --end of FAILED


    --Wait_req_GoToRoom
    Wait_req_GoToRoom = rfsm.state{
        doo = function()   end,
    }, --end of Wait_req_GoToRoom


    initial = rfsm.conn{ },

    --Wait_is_bottle_fetched
    Wait_is_bottle_fetched = rfsm.state{
        doo = function()   end,
    }, --end of Wait_is_bottle_fetched

    --OK
    OK = rfsm.state{
        doo = function()   end,
    }, --end of OK


    --Transitions
    rfsm.trans{ src = 'initial', tgt = 'Wait_req_GoToRoom', pn = 0 },
    rfsm.trans{ src = 'Wait_req_GoToRoom', tgt = 'Wait_is_robot_in_Room', pn = 0, events = {"e_req_GoToRoom"} },

    rfsm.trans{ src = 'Wait_is_robot_in_Room', tgt = 'FAILED', pn = 0, events = {"e_timeout"} },
    rfsm.trans{ src = 'Wait_is_robot_in_Room', tgt = 'Wait_req_FindBottle', pn = 0, events = {"e_from_env_GoToRoom"} },

    rfsm.trans{ src = 'Wait_req_FindBottle', tgt = 'Wait_is_bottle_found', pn = 0, events = {"e_req_FindBottle"} },
    rfsm.trans{ src = 'Wait_is_bottle_found', tgt = 'FAILED', pn = 0, events = {"e_timeout"} },
    rfsm.trans{ src = 'Wait_is_bottle_found', tgt = 'Wait_req_FetchBottle', pn = 0, events = {"e_from_env_FindBottle"} },
    rfsm.trans{ src = 'Wait_req_FetchBottle', tgt = 'Wait_is_bottle_fetched', pn = 0, events = {"e_req_GraspBottle"} },
    rfsm.trans{ src = 'Wait_is_bottle_fetched', tgt = 'FAILED', pn = 0, events = {"e_timeout"} },
    rfsm.trans{ src = 'Wait_is_bottle_fetched', tgt = 'OK', pn = 0, events = {"e_from_env_GraspBottle"} },
}
