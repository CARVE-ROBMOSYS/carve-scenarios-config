--
-- Authors: r1-user
-- Version: 1.0.0
-- Created using rFSMGui
--
return rfsm.state {


    --States

    --Wait_at_most_N_target
    Wait_at_most_N_target = rfsm.state{
        doo = function()   end,
    }, --end of Wait_at_most_N_target


    --Wait_help_request
    Wait_help_request = rfsm.state{
        doo = function()   end,
    }, --end of Wait_help_request


    initial = rfsm.conn{ },

    --Wait_for_help
    Wait_for_help = rfsm.state{
        doo = function()   end,
    }, --end of Wait_for_help


    --Wait_first_target
    Wait_first_target = rfsm.state{
        doo = function()   end,
    }, --end of Wait_first_target


    --Wait_valid_target
    Wait_valid_target = rfsm.state{
        doo = function()   end,
    }, --end of Wait_valid_target


    --wait_from_bt
    wait_from_bt = rfsm.state{
        doo = function()   end,
    }, --end of wait_from_bt


    --Wait_lookUp_finished
    Wait_lookUp_finished = rfsm.state{
        doo = function()   end,
    }, --end of Wait_lookUp_finished


    --Wait_update
    Wait_update = rfsm.state{
        doo = function()   end,
    }, --end of Wait_update


    --Wait_first_request
    Wait_first_request = rfsm.state{
        doo = function()   end,
    }, --end of Wait_first_request


    --Following
    Following = rfsm.state{
        doo = function()   end,
    }, --end of Following


    --FAILED
    FAILED = rfsm.state{
        doo = function()   end,
    }, --end of FAILED


    --Wait_navigation_finished
    Wait_navigation_finished = rfsm.state{
        doo = function()   end,
    }, --end of Wait_navigation_finished


    --Wait_lookUp_req
    Wait_lookUp_req = rfsm.state{
        doo = function()   end,
    }, --end of Wait_lookUp_req


    --Wait_navigation_request
    Wait_navigation_request = rfsm.state{
        doo = function()   end,
    }, --end of Wait_navigation_request



    --Transitions
    rfsm.trans{ src = 'initial', tgt = 'wait_from_bt', pn = 0 },
    rfsm.trans{ src = 'Wait_valid_target', tgt = 'Wait_at_most_N_target', pn = 0, events = {"e_req_target"} },
    rfsm.trans{ src = 'wait_from_bt', tgt = 'Wait_first_request', pn = 0, events = {"e_from_bt"} },
    rfsm.trans{ src = 'Wait_first_request', tgt = 'Wait_first_target', pn = 0, events = {"e_req_first_target"} },
    rfsm.trans{ src = 'Wait_first_request', tgt = 'FAILED', pn = 0, events = {"e_timeout(10)"} },
    rfsm.trans{ src = 'Wait_first_target', tgt = 'Following', pn = 0, events = {"e_reply_target_found"} },
    rfsm.trans{ src = 'Wait_valid_target', tgt = 'FAILED', pn = 0, events = {"e_timeout(10)"} },
    rfsm.trans{ src = 'Wait_at_most_N_target', tgt = 'Following', pn = 0, events = {"e_reply_target_found"} },
    rfsm.trans{ src = 'Wait_navigation_request', tgt = 'Wait_navigation_finished', pn = 0, events = {"e_req_navig"} },
    rfsm.trans{ src = 'Wait_navigation_finished', tgt = 'Wait_help_request', pn = 0, events = {"e_reply_human_lost"} },
    rfsm.trans{ src = 'Wait_navigation_request', tgt = 'FAILED', pn = 0, events = {"e_timeout(10)"} },
    rfsm.trans{ src = 'Wait_help_request', tgt = 'Wait_for_help', pn = 0, events = {"e_req_help"} },
    rfsm.trans{ src = 'Wait_help_request', tgt = 'FAILED', pn = 0, events = {"e_timeout(10)"} },
    rfsm.trans{ src = 'Wait_at_most_N_target', tgt = 'Wait_lookUp_req', pn = 0, events = {"e_reply_N_target_invalid"} },
    rfsm.trans{ src = 'Wait_lookUp_req', tgt = 'Wait_lookUp_finished', pn = 0, events = {"e_req_lookUp"} },
    rfsm.trans{ src = 'Wait_lookUp_req', tgt = 'FAILED', pn = 0, events = {"e_timeout(10)"} },
    rfsm.trans{ src = 'Wait_lookUp_finished', tgt = 'Wait_navigation_request', pn = 0, events = {"e_reply_lookup_failed"} },
    rfsm.trans{ src = 'Following', tgt = 'Wait_update', pn = 0, events = {"e_req_update_target"} },
    rfsm.trans{ src = 'Wait_navigation_finished', tgt = 'Following', pn = 0, events = {"e_reply_target_found"} },
    rfsm.trans{ src = 'Following', tgt = 'FAILED', pn = 0, events = {"e_timeout(10)"} },
    rfsm.trans{ src = 'Wait_update', tgt = 'Wait_valid_target', pn = 0, events = {"e_reply_update_failed"} },
    rfsm.trans{ src = 'Wait_for_help', tgt = 'Following', pn = 0, events = {"e_reply_target_found"} },
    rfsm.trans{ src = 'Wait_lookUp_finished', tgt = 'Following', pn = 0, events = {"e_reply_target_found"} },
}
