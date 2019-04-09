--
-- Authors: vgaggero
-- Version: 1.0.0
-- Created using rFSMGui
--
return rfsm.state {


    --States

    initial = rfsm.conn{ },

    --Running
    Running = rfsm.state{

        --WaitAutonomousNavigation
        WaitAutonomousNavigation = rfsm.state{
            doo = function()   end,
        }, --end of WaitAutonomousNavigation


        initial = rfsm.conn{ },

        --Unknown
        Unknown = rfsm.state{
            doo = function()   end,
        }, --end of Unknown


        --NeedHelp
        NeedHelp = rfsm.state{
            doo = function()   end,
        }, --end of NeedHelp


        --TargetValidReceived
        TargetValidReceived = rfsm.state{
            doo = function()   end,
        }, --end of TargetValidReceived


        --MaybeLostTarget
        MaybeLostTarget = rfsm.state{
            doo = function()   end,
        }, --end of MaybeLostTarget


        --StartAutonomousNavigation
        StartAutonomousNavigation = rfsm.state{
            doo = function()   end,
        }, --end of StartAutonomousNavigation


        --LookUp4Target
        LookUp4Target = rfsm.state{
            doo = function()   end,
        }, --end of LookUp4Target

    }, --end of Running


    --Configured
    Configured = rfsm.state{
        doo = function()   end,
    }, --end of Configured



    --Transitions
    rfsm.trans{ src = 'initial', tgt = 'Configured', pn = 0, events = {"Configure"} },
    rfsm.trans{ src = 'Configured', tgt = 'Running.initial', pn = 0, events = {"Start"} },
    rfsm.trans{ src = 'Running.TargetValidReceived', tgt = 'Running.MaybeLostTarget', pn = 0, events = {"ReceiveAInvalidTarget"} },
    rfsm.trans{ src = 'Running.initial', tgt = 'Running.Unknown', pn = 0 },
    rfsm.trans{ src = 'Running.Unknown', tgt = 'Running.TargetValidReceived', pn = 0, events = {"Received the First Target and it is valid"} },
    rfsm.trans{ src = 'Running.MaybeLostTarget', tgt = 'Running.LookUp4Target', pn = 0, events = {"Received N invalid Target Consecutively"} },
    rfsm.trans{ src = 'Running.LookUp4Target', tgt = 'Running.StartAutonomousNavigation', pn = 0, events = {"ReceiveAInvalidTarget"} },
    rfsm.trans{ src = 'Running.StartAutonomousNavigation', tgt = 'Running.WaitAutonomousNavigation', pn = 0, events = {"ReceiveAInvalidTarget"} },
    rfsm.trans{ src = 'Running.WaitAutonomousNavigation', tgt = 'Running.NeedHelp', pn = 0, events = {"AutonomousNavigationFinished(both error and success) and ReceiveAInvalidTarget"} },
    rfsm.trans{ src = 'Running.MaybeLostTarget', tgt = 'Running.TargetValidReceived', pn = 0, events = {"ReceivedAValidTarget"} },
    rfsm.trans{ src = 'Running.LookUp4Target', tgt = 'Running.TargetValidReceived', pn = 0, events = {"ReceivedAValidTarget"} },
    rfsm.trans{ src = 'Running.StartAutonomousNavigation', tgt = 'Running.TargetValidReceived', pn = 0, events = {"ReceivedAValidTarget"} },
    rfsm.trans{ src = 'Running.WaitAutonomousNavigation', tgt = 'Running.TargetValidReceived', pn = 0, events = {"ReceivedAValidTarget"} },
    rfsm.trans{ src = 'Running.NeedHelp', tgt = 'Running.TargetValidReceived', pn = 0, events = {"ReceivedAValidTarget"} },
}
