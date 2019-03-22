--
-- Authors: giuse
-- Version: 1.0.0
-- Created using rFSMGui
--
return rfsm.state {


    --States

    --Wait_req_fetch_bottle
    Wait_req_fetch_bottle = rfsm.state{
        doo = function()   end,
    }, --end of Wait_req_fetch_bottle


    --Wait_req_find_bottle
    Wait_req_find_bottle = rfsm.state{
        doo = function()   end,
    }, --end of Wait_req_find_bottle


    --Wait_is_bottle_found
    Wait_is_bottle_found = rfsm.state{
        doo = function()   end,
    }, --end of Wait_is_bottle_found


    --Wait_is_robot_in_kitchen
    Wait_is_robot_in_kitchen = rfsm.state{
        doo = function()   end,
    }, --end of Wait_is_robot_in_kitchen


    --Failed
    Failed = rfsm.state{
        doo = function()   end,
    }, --end of Failed


    --Wait_req_go_to_kitchen
    Wait_req_go_to_kitchen = rfsm.state{
        doo = function()   end,
    }, --end of Wait_req_go_to_kitchen


    initial = rfsm.conn{ },

    --Wait_is_bottle_fetched
    Wait_is_bottle_fetched = rfsm.state{
        doo = function()   end,
    }, --end of Wait_is_bottle_fetched



    --Transitions
    rfsm.trans{ src = 'initial', tgt = 'Wait_req_go_to_kitchen', pn = 0 },
    rfsm.trans{ src = 'Wait_req_go_to_kitchen', tgt = 'Wait_is_robot_in_kitchen', pn = 0, events = {"e_req_go_to_kitchen"} },
    rfsm.trans{ src = 'Wait_is_robot_in_kitchen', tgt = 'Failed', pn = 0, events = {"e_timeout"} },
    rfsm.trans{ src = 'Wait_is_robot_in_kitchen', tgt = 'Wait_req_find_bottle', pn = 0, events = {"e_is_robot_in_kitchen"} },
    rfsm.trans{ src = 'Wait_req_find_bottle', tgt = 'Wait_is_bottle_found', pn = 0, events = {"e_req_find_bottle"} },
    rfsm.trans{ src = 'Wait_is_bottle_found', tgt = 'Failed', pn = 0, events = {"e_timeout"} },
    rfsm.trans{ src = 'Wait_is_bottle_found', tgt = 'Wait_req_fetch_bottle', pn = 0, events = {"e_is_bottle_found"} },
    rfsm.trans{ src = 'Wait_req_fetch_bottle', tgt = 'Wait_is_bottle_fetched', pn = 0, events = {"e_req_fetch_bottle"} },
    rfsm.trans{ src = 'Wait_is_bottle_fetched', tgt = 'Failed', pn = 0, events = {"e_timeout"} },
    rfsm.trans{ src = 'Wait_is_bottle_fetched', tgt = 'Wait_req_go_to_kitchen', pn = 0, events = {"e_is_bottle_fetched"} },
}
